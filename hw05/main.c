#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "bgGame.h"
#include "bgStart.h"
#include "bgWin.h"
#include "bgLose.h"
#include "bgPause.h"
#include "spritesheet.h"

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

// buttons
unsigned short buttons;
unsigned short oldButtons;

// shadowOAM
OBJ_ATTR shadowOAM[128];

// determines game state
int snakeLength;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch (state) {
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

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

// set up start state
void goToStart() {

    DMANow(3, bgStartPal, PALETTE, 256);
    DMANow(3, bgStartTiles, &CHARBLOCK[0], bgStartTilesLen / 2);
    DMANow(3, bgStartMap, &SCREENBLOCK[28], bgStartMapLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();

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
    DMANow(3, bgGamePal, PALETTE, 256);
    DMANow(3, bgGameTiles, &CHARBLOCK[0], bgGameTilesLen / 2);
    DMANow(3, bgGameMap, &SCREENBLOCK[28], bgGameMapLen / 2);
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();

    state = GAME;
}

// runs game state for each frame
void game() {
    updateGame();
    drawGame();
    
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (snakeLength == 25) {
        goToWin();
    }
    if (snakeLength == 0) {
        goToLose();
    }
}

// set up pause state
void goToPause() {
    DMANow(3, bgPausePal, PALETTE, 256);
    DMANow(3, bgPauseTiles, &CHARBLOCK[0], bgPauseTilesLen / 2);
    DMANow(3, bgPauseMap, &SCREENBLOCK[28], bgPauseMapLen / 2);
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();

    state = PAUSE;
}

// run pause state each frame
void pause() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// set up win state
void goToWin() {
    DMANow(3, bgWinPal, PALETTE, 256);
    DMANow(3, bgWinTiles, &CHARBLOCK[0], bgWinTilesLen / 2);
    DMANow(3, bgWinMap, &SCREENBLOCK[28], bgWinMapLen / 2);
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();

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

    DMANow(3, bgLosePal, PALETTE, 256);
    DMANow(3, bgLoseTiles, &CHARBLOCK[0], bgLoseTilesLen / 2);
    DMANow(3, bgLoseMap, &SCREENBLOCK[28], bgLoseMapLen / 2);
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();

    state = LOSE;
}

// run lose state for each frame
void lose() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}