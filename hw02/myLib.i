# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
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
# 2 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(col + j, row + i, color);
        }
    }
}

void drawTriangle(int col, int row, unsigned short color) {
    int length = 35;
    for (int i = 0; i < length; i++) {
        setPixel((col + i), row, color);
        setPixel(col, (row + i), color);
        setPixel((col + i), (row + length - i), color);
    }
}

void drawOrange(int col, int row) {
    drawRect(col, row, 10, 10, ((31) | (10)<<5 | (0)<<10));
    drawRect(col + 4, row - 3, 2, 3, ((12) | (30)<<5 | (10)<<10));
}

void eraseOrange(int col, int row) {
    drawRect(col, row, 10, 10, ((31) | (31)<<5 | (0)<<10));
    drawRect(col + 4, row - 3, 2, 3, ((31) | (31)<<5 | (0)<<10));
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}
