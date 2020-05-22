#include "myLib.h"

int gameOver;

int oCol1, oCol2;
int oRow1, oRow2;
int oOldCol1, oOldCol2;
int oOldRow1, oOldRow2;
int oCDel1, oCDel2;
int oRDel1, oRDel2;

int bCol;
int bRow;
int bOldCol;
int bOldRow;
int bCDel;
int bRDel;
int bWidth;
int bHeight;

void updatePaddle() {
    bOldCol = bCol;
    bOldRow = bRow;

    // move paddle down
    if ((bCol + bWidth < SCREENWIDTH) && BUTTON_PRESSED(BUTTON_DOWN)) {
        bRow++;
    }

    // move paddle down while button is held
    if ((bCol + bWidth < 240) && BUTTON_HELD(BUTTON_DOWN)) {
        bRow++;
    }

    // move paddle up
    if ((bCol > 0) && BUTTON_PRESSED(BUTTON_UP)) {
        bRow--;
    }

    // move paddle up while button is held
    if ((bCol > 0) && BUTTON_HELD(BUTTON_UP)) {
        bRow--;
    }
}

void updateOranges() {
    oOldCol1 = oCol1;
    oOldRow1 = oRow1;
    
    oOldCol2 = oCol2;
    oOldRow2 = oRow2;

    // bounce orange 1 off the top and bottom
    if (oRow1 < 0 || oRow1 + 10 >= SCREENHEIGHT) {
		oRDel1 *= -1;
	}

    // bounce orange 1 off the left side
    if (oCol1 < 0) {
        oCDel1 *= -1;
    }

    // if orange 1 hits the paddle
    if (collision(bCol, bRow, bWidth, bHeight, oCol1, oRow1, 10, 10)) {
        oRDel1 *= -1;
        oCDel1 *= -1;
    }

    // bounce orange 2 off the top and bottom
    if (oRow2 < 0 || oRow2 + 10 >= SCREENHEIGHT) {
		oRDel2 *= -1;
	}

    // bounce orange 2 off the left side
    if (oCol2 < 0) {
        oCDel2 *= -1;
    }

    // if orange 2 hits the paddle
    if (collision(bCol, bRow, bWidth, bHeight, oCol2, oRow2, 10, 10)) {
        oRDel2 *= -1;
        oCDel2 *= -1;
    }

    // check if orange 1 or orange 2 goes out of bounds
    if (((oCol1 + 10) >= SCREENWIDTH) || ((oCol2 + 10) >= SCREENWIDTH)) {
        gameOver = 1;
    }

    // update orange 1 position
    oRow1 += oRDel1;
	oCol1 += oCDel1;

    // update orange 2 position
    oRow2 += oRDel2;
	oCol2 += oCDel2;
}