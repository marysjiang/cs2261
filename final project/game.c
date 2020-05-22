#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "bugBite.h"
#include "rockHit.h"

// player
ANISPRITE player;
int livesRemaining;
int usingNet;
int netTimer;
int bugsCaught;
int cheat;
int cheatTimer;

// gravity
int ground;
int jumping;

// bees
ANISPRITE bees;

// rocks
ANISPRITE rocks[ROCKCOUNT];
int rockTimer;
int rockTimerEnd;

// bugs
ANISPRITE bugs[BUGCOUNT];
int bugTimer;
int bugTimerEnd;

// hearts
ANISPRITE hearts[HEARTCOUNT];

// shadow OAM
OBJ_ATTR shadowOAM[128];

// offsets
int vOff;
int hOff;

// player direction
enum { RIGHT = 0, LEFT = 1 };
int direction;

// initialize the game
void initGame() {
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

    // initialize bob's direction
    direction = RIGHT;

    // initialize bob variables
    livesRemaining = 3;
    bugsCaught = 0;
    usingNet = 0;
    netTimer = 0;
    
    // initialize cheat
    cheat = 0;
    cheatTimer = 0;

    // initialize rock generating timer
    rockTimer = 0;
    rockTimerEnd = rand() % 90 + 10;

    // initialize bug generating timer
    bugTimer = 0;
    bugTimerEnd = rand() % 270 + 20;

    // initialize offsets
    vOff = 0;
    hOff = 0;

    // initialize gravity variables
    ground = 100;
    jumping = 1;

    initPlayer();
    initBees();
    initRocks();
    initBugs();
    initHearts();
}

void updateGame() {
    // increment the rock timer
    rockTimer++;

    // increment the bug timer
    bugTimer++;

    // increment the net timer while net is being used
    if (usingNet) {
        netTimer++;
    }

    // increment cheat timer during cheat
    if (cheat == 1) {
        cheatTimer++;
    }

    // reset net timer
    if (netTimer == 33) {
        usingNet = 0;
        netTimer = 0;
    }

    // reset cheat
    if (cheatTimer == 600) {
        cheat = 0;
        bugsCaught = 0;
        cheatTimer = 0;
    }

    // update the player
    updatePlayer();

    // update the bees
    updateBees();

    // update the rocks
    for (int i = 0; i < ROCKCOUNT; i++) {
        updateRocks(&rocks[i]);
    }

    // update the bugs
    for (int i = 0; i < BUGCOUNT; i++) {
        updateBugs(&bugs[i]);
    }

    // update the hearts
    for (int i = 0; i < HEARTCOUNT; i++) {
        updateHearts(&hearts[i]);
    }

    // increment hOff
    if (cheat == 0) {
        hOff += 2;
    } else {
        hOff += 6;
    }
}

// draw the game every frame
void drawGame() {
    drawPlayer();
    drawBees();
    drawRocks();
    drawBugs();
    drawHearts();

    REG_BG1HOFF = hOff;
}

// initialize the player
void initPlayer() {
    player.screenRow = 100;
    player.screenCol = 0;
    player.worldRow = SHIFTUP(ground + vOff);
    player.worldCol = (SCREENWIDTH / 2) - (player.width / 2);
    player.rdel = 0;
    player.cdel = 2;
    player.width = 32;
    player.height = 32;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = RIGHT;
}

// updates the player in each frame
void updatePlayer() {

    // gravity
    if (SHIFTDOWN(player.worldRow + player.rdel) < ground) { // if player is above the ground
        player.worldRow += player.rdel;
    } else { // if player is on the ground
        player.rdel = 0;
        jumping = 0;
    }

    if (BUTTON_PRESSED(BUTTON_UP) && !jumping) {
        player.rdel -= JUMPPOWER;
        jumping = 1;
    }

    player.rdel += GRAVITY;

    // activates cheat if bob catches three bugs
    if (bugsCaught == 3) {
        cheat = 1;
    }

    // moves bob to the left
    if (BUTTON_PRESSED(BUTTON_LEFT) && (player.screenCol > 0)) {
        direction = LEFT;
        player.worldCol -= player.cdel;
    }
    if (BUTTON_HELD(BUTTON_LEFT) && (player.screenCol > 0)) {
        direction = LEFT;
        player.worldCol -= player.cdel;
    }

    // moves bob to the right
    if (BUTTON_PRESSED(BUTTON_RIGHT) && ((player.screenCol - 1) < 210)) {
        direction = RIGHT;
        player.worldCol += player.cdel;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && ((player.screenCol - 1) < 210)) {
        direction = RIGHT;
        player.worldCol += player.cdel;
    }

    // makes bob use the net
    if (BUTTON_PRESSED(BUTTON_B) && !usingNet && cheat == 0) {
        usingNet = 1;
        player.curFrame = 0;
    }

    // update location
    player.screenCol = player.worldCol;
    player.screenRow = SHIFTDOWN(player.worldRow) - vOff;

    animatePlayer();
}

// animates the player in each frame
void animatePlayer() {
    if (usingNet) { // slow frame rate down if using the net
        if (player.aniCounter % 15 == 0) {
            player.curFrame = (player.curFrame + 1) % player.numFrames;
        }
    } else {
        if (player.aniCounter % 6 == 0) {
            player.curFrame = (player.curFrame + 1) % player.numFrames;
        }
    }

    // faces bob's sprite in the correct direction
    if (BUTTON_PRESSED(BUTTON_RIGHT))  {
        player.aniState = RIGHT;
    }
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        player.aniState = LEFT;
    }
    
    player.aniCounter++;
}

// draws the player in each frame
void drawPlayer() {
    if (usingNet == 0) {
        if (cheat == 0) { // draw normal bob
            shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.curFrame * 4) | ATTR2_PALROW(0);
        } else { // draw bob wearing a beekeeper suit
            shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_TILEID((player.aniState * 4) + 16, player.curFrame * 4) | ATTR2_PALROW(0);
        }
    } else { // draw bob using his net
        shadowOAM[0].attr0 = player.screenRow | ATTR0_WIDE | ATTR0_4BPP;
        shadowOAM[0].attr1 = (player.screenCol - 16) | ATTR1_LARGE;
        shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 8, (player.curFrame * 4) + 12) | ATTR2_PALROW(0);
    }
}

// initializes THE BEES!!!!!!
void initBees() {
    bees.screenRow = 95;
    bees.screenCol = 25;
    bees.width = 32;
    bees.height = 32;
    bees.aniCounter = 0;
    bees.curFrame = 0;
    bees.numFrames = 2;
}

// updates the bees
void updateBees() {
    // handles bee-player collision
    if (collision(bees.screenCol, bees.screenRow, bees.width, bees.height,
        player.screenCol, player.screenRow, player.width, player.height) && cheat == 0) {
            playSoundB(bugBite, BUGBITELEN, 0);
            livesRemaining = 0; // lose the game
    }

    animateBees();
}

// animates the bees during each frame
void animateBees() {
    if (bees.aniCounter % 8 == 0) {
        bees.curFrame = (bees.curFrame + 1) % bees.numFrames;
    }

    bees.aniCounter++;
}

// draws the bees
void drawBees() {
    shadowOAM[1].attr0 = bees.screenRow | ATTR0_SQUARE | ATTR0_4BPP;
    shadowOAM[1].attr1 = bees.screenCol | ATTR1_MEDIUM;
    shadowOAM[1].attr2 = ATTR2_TILEID((bees.aniState * 4) + 8, (bees.curFrame * 4) + 1) | ATTR2_PALROW(0);
}

// initializes the rocks
void initRocks() {
    for (int i = 0; i < ROCKCOUNT; i++) {
        rocks[i].screenCol = 0;
        rocks[i].screenRow = 117;
        rocks[i].worldCol = 0;
        rocks[i].width = 16;
        rocks[i].height = 16;
        rocks[i].active = 0;
        rocks[i].hit = 0;
    }
}

// updates the rocks
void updateRocks(ANISPRITE* a) {
    if (a->active) {
        // set rock to inactive when it goes off the screen
        if ((a->screenCol - 1) < -a->width) {
            a->active = 0;
        }

        // handle rock-player collisions
        if (collision(a->screenCol, a->screenRow, a->width, a->height,
            player.screenCol, player.screenRow, player.width, player.height) 
            && a->hit == 0 // if the rock hasn't hit the player yet
            && cheat == 0) {
                playSoundB(rockHit, ROCKHITLEN, 0);
                player.worldCol -= 35; // push the player back
                a->hit = 1; // the rock can't hit the player again
                livesRemaining--;
                hearts[livesRemaining].active = 0;
        }

        // update screenCol
        a->screenCol = a->worldCol - hOff;
    }

    // timer to generate new rock
    if (rockTimer == rockTimerEnd) {
        rockTimer = 0; // reset timer
        rockTimerEnd = rand() % 90 + 10; // reset timer end
        generateRock();
    }
}

// generates a new rock
void generateRock() {
    for (int i = 0; i < ROCKCOUNT; i++) {
        if (!rocks[i].active) { // finds the first inactive rock and sets it to active
            rocks[i].worldCol = SCREENWIDTH + hOff;
            rocks[i].screenCol = rocks[i].worldCol;
            rocks[i].active = 1;
            rocks[i].hit = 0; // reset ability to hit player
            break;
        }
    }
}

// draws the rocks in each frame
void drawRocks() {
    for (int i = 0; i < ROCKCOUNT; i++) {
        if (rocks[i].active) {
            shadowOAM[2 + i].attr0 = (ROWMASK & rocks[i].screenRow) | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[2 + i].attr1 = (COLMASK & rocks[i].screenCol) | ATTR1_SMALL;
            shadowOAM[2 + i].attr2 = ATTR2_TILEID(14, 2) | ATTR2_PALROW(0);
        } else {
            shadowOAM[2 + i].attr0 = ATTR0_HIDE;
        }
    }
}

// initializes the BUGS
void initBugs() {
    for (int i = 0; i < BUGCOUNT; i++) {
        bugs[i].screenCol = 0;
        bugs[i].screenRow = 116;
        bugs[i].worldCol = 0;
        bugs[i].width = 16;
        bugs[i].height = 16;
        bugs[i].active = 0;
        bugs[i].hit = 0;
    }
}

// updates the bugs in each frame
void updateBugs(ANISPRITE* a) {
    if (a->active) {
        // set bug to inactive if it goes off the screen
        if ((a->screenCol - 1) < -a->width) {
            a->active = 0;
        }

        // handles player-bug collision
        if (collision(a->screenCol, a->screenRow, a->width, a->height, // get hit by the bug
            player.screenCol, player.screenRow, player.width, player.height) 
            && a->hit == 0 // if the bug hasn't hit bob yet
            && usingNet == 0
            && cheat == 0 // if bob's not using a net
            ) {
                playSoundB(rockHit, ROCKHITLEN, 0);
                player.worldCol -= 30; // push bob back
                a->hit = 1; // can't hit the player again
                livesRemaining--; // lose health
                hearts[livesRemaining].active = 0;
        } else if (collision(a->screenCol, a->screenRow, a->width, a->height, // catch the bug
            player.screenCol, player.screenRow, player.width, player.height) 
            && a->hit == 0 // if the bug hasn't hit the player yet
            && usingNet == 1
            && cheat == 0) { // if bob is using a net
                a->active = 0;
                a->hit = 1;
                bugsCaught++;
        }

        // update screenCol
        a->screenCol = a->worldCol - hOff;
    }

    // generate bug using bug timer
    if (bugTimer == bugTimerEnd) {
        bugTimer = 0; // reset timer
        bugTimerEnd = rand() % 270 + 20; // reset timer end
        generateBug();
    }
}

// generates a new bug
void generateBug() {
    for (int i = 0; i < BUGCOUNT; i++) {
        if (!bugs[i].active) { // finds the first inactive bug and sets it to active
            bugs[i].worldCol = SCREENWIDTH + hOff;
            bugs[i].screenCol = bugs[i].worldCol;
            bugs[i].active = 1;
            bugs[i].hit = 0; // reset ability to hit player
            break;
        }
    }
}

// draws the bugs in each frame
void drawBugs() {
    for (int i = 0; i < BUGCOUNT; i++) {
        if (bugs[i].active) {
            shadowOAM[ROCKCOUNT + HEARTCOUNT + 2 + i].attr0 = (ROWMASK & bugs[i].screenRow) | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[ROCKCOUNT + HEARTCOUNT + 2 + i].attr1 = (COLMASK & bugs[i].screenCol) | ATTR1_SMALL;
            shadowOAM[ROCKCOUNT + HEARTCOUNT + 2 + i].attr2 = ATTR2_TILEID(14, 0) | ATTR2_PALROW(0);
        } else {
            shadowOAM[ROCKCOUNT + HEARTCOUNT + 2 + i].attr0 = ATTR0_HIDE;
        }
    }
}

// initializes the hearts
void initHearts() {
    for (int i = 0; i < HEARTCOUNT; i++) {
        hearts[i].screenRow = 10;
        hearts[i].screenCol = 165 + 20 * i;
        hearts[i].width = 16;
        hearts[i].height = 16;
        hearts[i].aniCounter = 0;
        hearts[i].aniState = 0;
        hearts[i].curFrame = 0;
        hearts[i].numFrames = 4; 
        hearts[i].active = 1;
    }
}

// animates the hearts in each frame
void updateHearts(ANISPRITE* a) {
    if (a->active) {
        if (a->aniCounter % 15 == 0) {
            a->curFrame = (a->curFrame + 1) % a->numFrames;
        }

        a->aniCounter++;
    }
}

// draws the hearts
void drawHearts() {
    for (int i = 0; i < HEARTCOUNT; i++) {
        if (hearts[i].active) {
            shadowOAM[ROCKCOUNT + 2 + i].attr0 = hearts[i].screenRow | ATTR0_SQUARE | ATTR0_4BPP;
            shadowOAM[ROCKCOUNT + 2 + i].attr1 = hearts[i].screenCol | ATTR1_SMALL;
            shadowOAM[ROCKCOUNT + 2 + i].attr2 = ATTR2_TILEID((hearts[i].aniState * 2) + 12, hearts[i].curFrame * 2) | ATTR2_PALROW(0);
        } else {
            shadowOAM[ROCKCOUNT + 2 + i].attr0 = ATTR0_HIDE;
        }
    }
}