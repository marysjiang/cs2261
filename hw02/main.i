# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2

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
        buttons = (*(volatile unsigned short *)0x04000130);

        if (gameOver == 0) {
            updatePaddle();
            updateOranges();
            waitForVBlank();
            draw();
        } else if (gameOver == 1) {
            waitForVBlank();
            fillScreen(((31) | (0)<<5 | (0)<<10));
        }
    }
}

void initialize() {
    (*(unsigned short *)0x4000000) = 3 | (1<<10);

    fillScreen(((31) | (31)<<5 | (0)<<10));


    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;


    gameOver = 0;


    bCol = 225;
    bRow = 70;
    bOldCol = bCol;
    bOldRow = bRow;
    bWidth = 10;
    bHeight = 20;


    oCol1 = 0;
    oRow1 = 30;
    oOldCol1 = oCol1;
    oOldRow1 = oRow1;
    oCDel1 = 1;
    oRDel1 = 1;


 oCol2 = 0;
 oRow2 = 130;
    oOldCol2 = oCol2;
    oOldRow2 = oRow2;
    oCDel2 = 1;
    oRDel2 = 1;
}

void draw() {

    drawRect(bOldCol, bOldRow, bWidth, bHeight, ((31) | (31)<<5 | (0)<<10));


    drawRect(bCol, bRow, bWidth, bHeight, ((13) | (27)<<5 | (30)<<10));


    eraseOrange(oOldCol1, oOldRow1);
    eraseOrange(oOldCol2, oOldRow2);


    drawOrange(oCol1, oRow1);
    drawOrange(oCol2, oRow2);
}
