#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "ship.h"

// variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
ASTEROID asteroids[ASTEROIDCOUNT];
int asteroidsRemaining;
int gameState;

// initialize game
void initGame() {
    initPlayer();
    initBullets();
    initAsteroids();

    asteroidsRemaining = ASTEROIDCOUNT;
    gameState = 0;

    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};

    DMANow(3, &shipPal, PALETTE, 256);

    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

// update game each frame
void updateGame() {
    updatePlayer();
    for(int i = 0; i < BULLETCOUNT; i++) {
        updateBullet(&bullets[i]);
    }

    for (int i = 0; i < ASTEROIDCOUNT; i++) {
        updateAsteroid(&asteroids[i]);
    }
}

// draw game each frame
void drawGame() {
    fillScreen4(BLACKID);
    drawPlayer();
    for (int i = 0; i < BULLETCOUNT; i++) {
        drawBullet(&bullets[i]);
    }

    for (int i = 0; i < ASTEROIDCOUNT; i++) {
        drawAsteroid(&asteroids[i]);
    }
}

// initialize player
void initPlayer() {
    player.col = 100;
    player.row = 130;
    player.width = 12;
    player.height = 12;
    player.cdel = 1;
    player.rdel = 1;
    player.bulletTimer = 15;
}


// update player
void updatePlayer() {
    // move player to the right
    if (BUTTON_PRESSED(BUTTON_RIGHT)
        && (player.col + player.width - 1 < SCREENWIDTH)) {
            player.col += player.cdel;
    }

    if (BUTTON_HELD(BUTTON_RIGHT) 
        && (player.col + player.width - 1 < SCREENWIDTH)) {
            player.col += player.cdel;
    }

    // move player to the left
    if (BUTTON_PRESSED(BUTTON_LEFT) 
        && (player.col > 0)) {
            player.col -= player.cdel;
    }

    if (BUTTON_HELD(BUTTON_LEFT) 
        && (player.col > 0)) {
            player.col -= player.cdel;
    }

    // move player up
    if (BUTTON_PRESSED(BUTTON_UP)) {
            player.row -= player.rdel;
    }

    if (BUTTON_HELD(BUTTON_UP)) {
            player.row -= player.rdel;
    }

    // move player down
    if (BUTTON_PRESSED(BUTTON_DOWN) 
        && (player.row + player.height - 1 < SCREENHEIGHT)) {
            player.row += player.rdel;
    }

    if (BUTTON_HELD(BUTTON_DOWN) 
        && (player.row + player.height - 1 < SCREENHEIGHT)) {
            player.row += player.rdel;
    }

    // shoot bullets
    if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 15) {
        fireBullet();
        player.bulletTimer = 0;
    }

    // allow player to move up and out of screen after destroying all asteroids
    if (player.row <= 0 && asteroidsRemaining == 0) {
        gameState = 1;
    }

    player.bulletTimer++;
}

// draw player each frame
void drawPlayer() {
    drawImage4(player.col, player.row, player.width, player.height, shipBitmap);
}

// initialize bullets
void initBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].col = player.col;
        bullets[i].row = player.row;
        bullets[i].width = 1;
        bullets[i].height = 3;
        bullets[i].cdel = 0;
        bullets[i].rdel = -2;
        bullets[i].active = 0;
        bullets[i].color = WHITEID;
    }
}

// fire bullets
void fireBullet() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullets[i].active) {
            bullets[i].col = player.col + (player.width / 2) // position bullet
                - (bullets[i].width / 2);
            bullets[i].row = player.row;
            bullets[i].active = 1;
            break;
        }
    }
}

// update bullet each frame
void updateBullet(BULLET* b) {
    if (b->active) { // update active bullets
        if (b->row + (b->height - 1) > 0
            && b->col > 0
            && b->col + b->width -1 < SCREENWIDTH) {
                b->row += b->rdel;
                b->col += b->cdel;
        } else { // ignore inactive bullets
            b->active = 0;
        }
    }
}

// draw active bullets each frame
void drawBullet(BULLET* b) {
    if (b->active) {
        drawRect4(b->col, b->row, b->width, b->height, WHITEID);
    }
}

// initialize asteroids
void initAsteroids() {
    int fallSpeed = 10;

    for (int i = 0; i < ASTEROIDCOUNT; i++) {
        if (i % 2 == 0) { // vary fall speed
            fallSpeed = 2;
        }
        asteroids[i].col = rand() % 220;
        asteroids[i].row = rand() % 110 + 4;
        asteroids[i].width = 12;
        asteroids[i].height = 12;
        asteroids[i].cdel = 1;
        asteroids[i].rdel = fallSpeed;
        asteroids[i].active = 1;
    }
}

// update asteroid each frame
void updateAsteroid(ASTEROID* a) {
    if (a->active) {
        // reflect asteroid off the walls
        if (a->col <= 1 || a->col + a->width - 1 > SCREENWIDTH) {
            a->cdel *= -1;
        }
        if (a->row <= 1 || a->row + a->height - 1 > SCREENHEIGHT) {
            a->rdel *= -1;
        }

        // update positions
        a->col += a->cdel;
        a->row += a->rdel;

        // handle asteroid-bullet collision
        for (int i = 0; i < BULLETCOUNT; i++) {
            if (bullets[i].active && collision(a->col, a->row, a->width, a->height, 
                bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) {
                    a->active = 0;
                    bullets[i].active = 0;
                    asteroidsRemaining--;
            }
        }

        // handle asteroid-player collision
        if (collision(a->col, a->row, a->width, a->height, 
            player.col, player.row, player.width, player.height)) {
                gameState = -1;
        }
    }
}

// draw asteroid each frame
void drawAsteroid(ASTEROID* a) {
    if (a->active) {
        drawRect4(a->col, a->row, a->width, a->height, WHITEID);
    }
}