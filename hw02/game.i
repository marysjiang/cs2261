# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 42 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 67 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
void updatePaddle();
void updateOranges();
void eraseOrange();
# 2 "game.c" 2

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


    if ((bCol + bWidth < 240) && ((!(~(oldButtons) & ((1<<7)))) && (~(buttons) & ((1<<7))))) {
        bRow++;
    }


    if ((bCol + bWidth < 240) && (~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        bRow++;
    }


    if ((bCol > 0) && ((!(~(oldButtons) & ((1<<6)))) && (~(buttons) & ((1<<6))))) {
        bRow--;
    }


    if ((bCol > 0) && (~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        bRow--;
    }
}

void updateOranges() {
    oOldCol1 = oCol1;
    oOldRow1 = oRow1;

    oOldCol2 = oCol2;
    oOldRow2 = oRow2;


    if (oRow1 < 0 || oRow1 + 10 >= 160) {
  oRDel1 *= -1;
 }


    if (oCol1 < 0) {
        oCDel1 *= -1;
    }


    if (collision(bCol, bRow, bWidth, bHeight, oCol1, oRow1, 10, 10)) {
        oRDel1 *= -1;
        oCDel1 *= -1;
    }


    if (oRow2 < 0 || oRow2 + 10 >= 160) {
  oRDel2 *= -1;
 }


    if (oCol2 < 0) {
        oCDel2 *= -1;
    }


    if (collision(bCol, bRow, bWidth, bHeight, oCol2, oRow2, 10, 10)) {
        oRDel2 *= -1;
        oCDel2 *= -1;
    }


    if (((oCol1 + 10) >= 240) || ((oCol2 + 10) >= 240)) {
        gameOver = 1;
    }


    oRow1 += oRDel1;
 oCol1 += oCDel1;


    oRow2 += oRDel2;
 oCol2 += oCDel2;
}
