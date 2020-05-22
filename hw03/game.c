#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// variables
PLAYER player;
BRICK bricks[BRICKCOUNT];
BALL balls[BALLCOUNT];
int bricksRemaining;
int ballsRemaining;

// initialize game
void initGame() {
    initPlayer();
    initBricks();
    initBalls();
    bricksRemaining = BRICKCOUNT;
    ballsRemaining = BALLCOUNT;
}

// update game for each frame
void updateGame() {
    updatePlayer();
    
    for (int i = 0; i < BALLCOUNT; i++) {
        updateBall(&balls[i]);
    }
}

// draw game for each frame
void drawGame() {
    drawPlayer();

    for (int i = 0; i < BRICKCOUNT; i++) {
        drawBrick(&bricks[i]);
    }

    for (int i = 0; i < BALLCOUNT; i++) {
        drawBall(&balls[i]);
    }
}

// initialize player
void initPlayer () {
    player.col = 110;
    player.row = 135;
    player.oldCol = player.col;
    player.oldRow = player.row;
    player.cdel = 2;
    player.width = 25;
    player.height = 6;
    player.color = YELLOW;
}

// update player
void updatePlayer() {
    // update values
    player.oldCol = player.col;
    player.oldRow = player.row;

    // move player to the right
    if ((player.col + player.width + 2 <= SCREENWIDTH) && BUTTON_PRESSED(BUTTON_RIGHT)) {
        player.col += player.cdel;
    }

    if ((player.col + player.width + 2 <= SCREENWIDTH) && BUTTON_HELD(BUTTON_RIGHT)) {
        player.col += player.cdel;
    }

    // move player to the left
    if ((player.col - 2 >= 0) && BUTTON_PRESSED(BUTTON_LEFT)) {
        player.col -= player.cdel;
    }
    
    if ((player.col - 2 >= 0) && BUTTON_HELD(BUTTON_LEFT)) {
        player.col -= player.cdel;
    }
}

// draw player for each frame
void drawPlayer() {
    // erase old player position
    drawRect(player.oldCol, player.oldRow, player.width, player.height, BLACK);

    // draw new player position
    drawRect(player.col, player.row, player.width, player.height, player.color);

    // set old position values
    player.oldCol = player.col;
    player.oldRow = player.row;
}

// initialize bricks
void initBricks() {
    int brickCol = 10;
    int brickRow = 5;
    for (int i = 0; i < BRICKCOUNT; i++) {
        if (((i % 6) == 0)) {
            brickCol = 20;
            brickRow += 15;
        }
        bricks[i].col = brickCol + ((i % 6) * 35);
        bricks[i].row = brickRow;
        bricks[i].oldRow = bricks[i].row;
        bricks[i].oldCol = bricks[i].col;
        bricks[i].height = 10;
        bricks[i].width = 23;
        bricks[i].color = CYAN;
        bricks[i].active = 1;
    }
}

// draw bricks if active
void drawBrick(BRICK* b) {
    if (b->active) {
        drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
        drawRect(b->col, b->row, b->width, b->height, b->color);
    } else if (!b->active) {
        drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
        b->active = 0;
    }

    b->oldCol = b->col;
    b->oldRow = b->row;
}

// initialize balls
void initBalls() {
    for (int i = 0; i < BALLCOUNT; i++) {
        balls[i].col = rand() % 140 + 50;
        balls[i].row = player.row - 60;
        balls[i].oldRow = balls[i].row;
        balls[i].oldCol = balls[i].col;
        balls[i].rdel = 1;
        balls[i].cdel = 1;
        balls[i].height = 10;
        balls[i].width = 10;
        balls[i].color = RED;
        balls[i].active = 1;
    }
}

// update ball if active
void updateBall(BALL* b) {
    if (b->active) {

        // bounce ball off the top of the screen
        if (b->row <= 0) {
            b->rdel *= -1;
        }

        // bounce ball off the sides of the screen
        if (b->col <= 0 || (b->col + b->width) >= SCREENWIDTH) {
            b->cdel *= -1;
        }

        b->row += b->rdel;
        b->col += b->cdel;

        // if a ball goes out of the screen
        if (b->row + b->height >= SCREENHEIGHT) {
            ballsRemaining--;
            b->active = 0;
        }

        // check ball-paddle collision
        for (int i = 0; i < BALLCOUNT; i++) {
            if (collision(b->col, b->row, b->width, b->height, player.col, player.row,
                player.width, player.height)) {
                    b->rdel *= -1;
            }
        }

        // check ball-brick collision
        for (int i = 0; i < BRICKCOUNT; i++) {
            if (bricks[i].active) {
                if (collision(b->col, b->row, b->width, b->height, 
                    bricks[i].col, bricks[i].row, bricks[i].width, bricks[i].height)) {
                        bricks[i].active = 0;
                        b->rdel *= -1;
                        bricksRemaining--;
                }
            }
        }
    }
}

// draw ball if active
void drawBall(BALL* b) {
    if (b->active) {
        drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
        drawRect(b->col, b->row, b->width, b->height, MAGENTA);
    } else {
        drawRect(b->oldCol, b->oldRow, b->width, b->height, BLACK);
        b->active = 0;
    }
    b->oldRow = b->row;
    b->oldCol = b->col;
}