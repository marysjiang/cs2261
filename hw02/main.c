#include "myLib.h"

void initialize();
void draw();
void updatePaddle();
void updateOranges();

unsigned short buttons;
unsigned short oldButtons;

extern int gameOver;

extern int oCol1, oCol2;
extern int oRow1, oRow2;
extern int oOldCol1, oOldCol2;
extern int oOldRow1, oOldRow2;
extern int oCDel1, oCDel2;
extern int oRDel1, oRDel2;

extern int bCol;
extern int bRow;
extern int bOldCol;
extern int bOldRow;
extern int bCDel;
extern int bRDel;
extern int bWidth;
extern int bHeight;

void main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        if (gameOver == 0) {
            updatePaddle();
            updateOranges();
            waitForVBlank();
            draw();
        } else if (gameOver == 1) {
            waitForVBlank();
            fillScreen(RED);
        }
    }
}

void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    fillScreen(YELLOW);

    // initialize buttons
    buttons = BUTTONS;
    oldButtons = 0;

    // initialize game over state
    gameOver = 0;

    // initialize basket
    bCol = 225;
    bRow = 70;
    bOldCol = bCol;
    bOldRow = bRow;
    bWidth = 10;
    bHeight = 20;

    // initialize orange 1
    oCol1 = 0;
    oRow1 = 30;
    oOldCol1 = oCol1;
    oOldRow1 = oRow1;
    oCDel1 = 1;
    oRDel1 = 1;

    // initialize orange 2
	oCol2 = 0;
	oRow2 = 130;
    oOldCol2 = oCol2;
    oOldRow2 = oRow2;
    oCDel2 = 1;
    oRDel2 = 1;
}

void draw() {
    // erase old locations for basket
    drawRect(bOldCol, bOldRow, bWidth, bHeight, YELLOW);

    // draw new location for basket
    drawRect(bCol, bRow, bWidth, bHeight, SKYCOLOR);

    // erase old locations for oranges
    eraseOrange(oOldCol1, oOldRow1);
    eraseOrange(oOldCol2, oOldRow2);

    // draw new locations for oranges
    drawOrange(oCol1, oRow1);
    drawOrange(oCol2, oRow2);
}