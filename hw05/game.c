#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"

// snake
ANISPRITE snake[MAXLENGTH];
extern int snakeLength;

// oranges
ANISPRITE oranges[ORANGECOUNT];

// shadow OAM
OBJ_ATTR shadowOAM[128];

// sprite states
enum { UP = 0, DOWN = 1, RIGHT = 2, LEFT = 3};

// snake movement states
enum { SNAKEUP = 0, SNAKEDOWN = 1, SNAKERIGHT = 2, SNAKELEFT = 3};
int direction;

// timer for snake movement
int timer;

// initializes the game
void initGame() {
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

    // snake moves up at the start
    direction = SNAKEUP;

    timer = 0;

    initSnake();
    initOranges();
}

void updateGame() {    
    updateSnake();
    
    for (int i = 0; i < ORANGECOUNT; i++) {
        updateOranges(&oranges[i]);
    }

    timer++;
}

void drawGame() {
   drawSnake();
   drawOranges();
}

// initializes the snake
void initSnake() {
    snakeLength = 2;

    // initialize snake head and body
    for (int i = 0; i < MAXLENGTH; i++) {
        snake[i].row = 72 + (32 * i);
        snake[i].oldRow = snake[i].row;
        snake[i].col = 112;
        snake[i].oldCol = snake[i].col;
        snake[i].rdel = 16;
        snake[i].cdel = 16;
        snake[i].width = 16;
        snake[i].height = 16;
        snake[i].aniCounter = 0;
        snake[i].curFrame = 0; // row
        snake[i].numFrames = 2;
        snake[i].aniState = UP; // col in spritesheet; starting moving up
        snake[i].active = 0;
    }

    // initialize snake head + first body part
    snake[0].active = 1;
    snake[1].active = 1;
}

// update the snake for each frame
void updateSnake() {
    // handle the direction of the snake's movement
    if (BUTTON_PRESSED(BUTTON_UP) && direction != SNAKEDOWN) {
        direction = SNAKEUP;
    }

    if (BUTTON_PRESSED(BUTTON_DOWN) && direction != SNAKEUP) {
        direction = SNAKEDOWN;
    }

    if (BUTTON_PRESSED(BUTTON_RIGHT) && direction != SNAKELEFT) {
        direction = SNAKERIGHT;
    }

    if (BUTTON_PRESSED(BUTTON_LEFT) && direction != SNAKERIGHT) {
        direction = SNAKELEFT;
    }

    if (timer == 10) {
        for (int i = 0; i < MAXLENGTH; i++) {
            snake[i].oldRow = snake[i].row;
            snake[i].oldCol = snake[i].col;

            if (i == 0) { // move the head
                switch (direction) {
                    case SNAKEUP:
                        snake[i].row -= snake[i].rdel;
                        break;
                    case SNAKEDOWN:
                        snake[i].row += snake[i].rdel;
                        break;
                    case SNAKERIGHT:
                        snake[i].col += snake[i].cdel;
                        break;
                    case SNAKELEFT:
                        snake[i].col -= snake[i].cdel;
                        break;
                }
            } else { // move the body
                snake[i].row = snake[i - 1].oldRow;
                snake[i].col = snake[i - 1].oldCol;
            }
        }

        // handle collisions if the snake hits the top, sides, or bottom of the screen
        if (((snake[0].row - 1) < 0) || (((snake[0].row + snake[0].height) - 1) > SCREENHEIGHT)
            || ((snake[0].col - 1) < -3) || (((snake[0].col + snake[0].width) - 1) > SCREENWIDTH)) {
                snakeLength = 0; // lose the game
        }

        // handle snake-body collisions
        for (int j = 1; j <= snakeLength; j++) {
            if (collision(snake[0].col, snake[0].row, snake[0].width, snake[0].height,
                snake[j].col, snake[j].row, snake[j].width, snake[j].height)) {
                    snakeLength = 0; // lose the game
            }
        }

        // reset the timer
        timer = 0;
    }
    
    animateSnake();
}

// grow the snake when it eats an orange by finding the first inactive snake part
void growSnake() {
    for (int i = 0; i < MAXLENGTH; i++) {
        if (!snake[i].active) {
            snake[i].active = 1;
            snakeLength++;
            break;
        }
    }
}

// animates the snake during each frame
void animateSnake() {
    if (snake[0].aniCounter % 25 == 0) {
        snake[0].curFrame = (snake[0].curFrame + 1) % snake[0].numFrames;
    }
    
    for (int i = 0; i < MAXLENGTH; i++) {
        if (i == 0) { // use the appropriate head sprite for each direction
            if (BUTTON_PRESSED(BUTTON_UP) && direction != SNAKEDOWN) {
                snake[i].aniState = UP;
            }
            if (BUTTON_PRESSED(BUTTON_DOWN) && direction != SNAKEUP) {
                snake[i].aniState = DOWN;
            }
            if (BUTTON_PRESSED(BUTTON_RIGHT) && direction != SNAKELEFT) {
                snake[i].aniState = RIGHT;
            }
            if (BUTTON_PRESSED(BUTTON_LEFT) && direction != SNAKERIGHT) {
                snake[i].aniState = LEFT;
            }
        }
    }

    snake[0].aniCounter++;
}

/**
* aniState: col in spritesheet
* curFrame: row in spritesheet
*/
// draws the snake in each frame
void drawSnake() {
    for (int i = 0; i < MAXLENGTH; i++) {
        if (snake[i].active) {
            if (i == 0) { // draw head
                shadowOAM[i].attr0 = snake[i].row | ATTR0_SQUARE | ATTR0_4BPP;
                shadowOAM[i].attr1 = snake[i].col | ATTR1_SMALL;
                shadowOAM[i].attr2 = ATTR2_TILEID(snake[i].aniState * 2, snake[i].curFrame * 2) | ATTR2_PALROW(0);
            } else { // draw body
                shadowOAM[i].attr0 = snake[i].row | ATTR0_SQUARE | ATTR0_4BPP;
                shadowOAM[i].attr1 = snake[i].col | ATTR1_SMALL;
                shadowOAM[i].attr2 = ATTR2_TILEID(0, 12) | ATTR2_PALROW(0);
            }
        } else {
            shadowOAM[i].attr0 = ATTR0_HIDE;
        }
    }
}

// initialize the oranges
void initOranges() {
    for (int i = 0; i < ORANGECOUNT; i++) {
        oranges[i].row = (rand() % (140 - 16)) + 16;
        oranges[i].col = (rand() % (220 - 16)) + 16;
        oranges[i].width = 16;
        oranges[i].height = 16;
        oranges[i].aniCounter = 0;
        oranges[i].aniState = 0; // col
        oranges[i].curFrame = 0; // row
        oranges[i].numFrames = 4;
        oranges[i].active = 0;
        oranges[i].eaten = 0;
    }

    oranges[0].active = 1;
}

// update the oranges during each frame
void updateOranges(ANISPRITE* a) {
    if (a->active) {
        // animate the active orange
        if (a->aniCounter % 15 == 0) {
            a->curFrame = (a->curFrame + 1) % a->numFrames;
        }

        // handles snake-orange collisions
        if (collision(a->col, a->row, a->width, a->height,
            snake[0].col, snake[0].row, snake[0].width, snake[0].height)) {
                a->active = 0; // set current orange to inactive
                a->eaten = 1; // set current orange to eaten
                growSnake();
                generateOrange();
        }

        a->aniCounter++;
    }
}

// find the first inactive + uneaten orange and make it appear
void generateOrange() {
    for (int i = 0; i < ORANGECOUNT; i++) {
        if (!oranges[i].active && !oranges[i].eaten) {
            oranges[i].active = 1;
            break;
        }
    }
}

// draw oranges during each frame
void drawOranges() {
    for (int i = 0; i < ORANGECOUNT; i++) {
        if (oranges[i].active) {
            shadowOAM[MAXLENGTH + i].attr0 = oranges[i].row | ATTR0_SQUARE | ATTR0_4BPP; // shadowOAM index for oranges starts right after the snake sprites
            shadowOAM[MAXLENGTH + i].attr1 = oranges[i].col | ATTR1_SMALL;
            shadowOAM[MAXLENGTH + i].attr2 = ATTR2_TILEID(oranges[i].aniState * 2, (oranges[i].curFrame * 2) + 4) | ATTR2_PALROW(0); // sprite starts on 4th tile
        } else {
            shadowOAM[MAXLENGTH + i].attr0 = ATTR0_HIDE;
        }
    }
}
