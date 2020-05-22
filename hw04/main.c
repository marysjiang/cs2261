#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "bg.h"
#include "win.h"

// prototypes
void initialize();

// state prototypes
void goToStart();
void goToGame();
void goToPause();
void goToWin();
void goToLose();

void start();
void game();
void pause();
void win();
void lose();

// game states
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// buttons
unsigned short buttons;
unsigned short oldButtons;

// random seed
int seed;

// determine win/loss
extern int gameState;

// text buffer
char buffer[41];

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;    
        }
    }
}

// set up GBA
void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    goToStart();
}

// set up start state
void goToStart() {
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};

    DMANow(3, &bgPal, PALETTE, 256);
    drawFullscreenImage4(bgBitmap);

    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

    waitForVBlank();
    flipPage();

    state = START;

    seed = 0;
}

// run start state for each frame
void start() {
    seed++;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);

        goToGame();
        initGame();
    }
}

// set up game state
void goToGame() {        
    state = GAME;
}

// runs game state for each frame
void game() {
    updateGame();
    drawGame();

    // text if asteroids are still present
    if (asteroidsRemaining > 0) {
        sprintf(buffer, "Asteroids Remaining: %d", asteroidsRemaining);
        drawString4(8, 145, buffer, WHITEID);
    }

    // text to notify player the asteroids are all destroyed
    if (asteroidsRemaining == 0) {
        sprintf(buffer, "You're safe! Go now!");
        drawString4(8, 145, buffer, WHITEID);
    }

    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (gameState == 1) {
        goToWin();
    }
    if (gameState == -1) {
        goToLose();
    }
}

// set up pause state
void goToPause() {
    fillScreen4(GRAYID);
    drawString4(105, 77, "PAUSE", BLACKID);

    waitForVBlank();
    flipPage();

    state = PAUSE;
}

// run pause state each frame
void pause() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// set up win state
void goToWin() {
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};

    DMANow(3, &winPal, PALETTE, 256);
    drawFullscreenImage4(winBitmap);

    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

    drawString4(111, 135, "WIN", GREENID);

    waitForVBlank();
    flipPage();

    state = WIN;
}

// run win state for each frame
void win() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// set up lose state
void goToLose() {
    fillScreen4(REDID);
    drawString4(108, 73, "LOSE", BLACKID);

    waitForVBlank();
    flipPage();

    state = LOSE;
}

// run lose state for each frame
void lose() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}