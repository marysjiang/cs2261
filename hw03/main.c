#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// state prototypes
void startState();
void gameState();
void winState();
void loseState();
void pauseState();

void goToStart();
void goToGame();
void goToWin();
void goToLose();
void goToPause();

void initialize();

// random seed
int seed;

// states
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// buttons
unsigned short buttons;
unsigned short oldButtons;

// variables
extern int ballsRemaining;
extern int bricksRemaining;

void main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {
            case(START):
                startState();
                break;
            case(GAME):
                gameState();
                break;
            case(PAUSE):
                pauseState();
                break;
            case(WIN):
                winState();
                break;
            case(LOSE):
                loseState();
                break;
        }
    }
}

void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // initialize buttons
    buttons = BUTTONS;
    oldButtons = 0;
    
    goToStart();
}

void startState() {
    seed++;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        srand(seed);
        initGame();
    }
}

void goToStart() {
    fillScreen(CYAN);
    state = START;
}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();

    if (ballsRemaining == 0) {
        goToLose();
    }

    if (bricksRemaining == 0) {
        goToWin();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToGame() {
    fillScreen(BLACK);
    state = GAME;
}

void winState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(GREEN);
    state = WIN;
}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(RED);
    state = LOSE;
}

void pauseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToPause() {
    fillScreen(ORANGE);
    state = PAUSE;
}