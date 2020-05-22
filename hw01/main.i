# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1
# 25 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawTriangle(int, int, unsigned short color);
void drawRect(int, int, unsigned short color);
void fillScreen(unsigned short color);
void waitForVBlank();
void delay();


extern unsigned short *videoBuffer;
# 2 "main.c" 2

void initialize();
void frame1();
void frame2();
void frame3();

int main() {
    initialize();

    while(1) {
        fillScreen(((0) | (31)<<5 | (31)<<10));
        waitForVBlank();
        frame1();
        delay(300);

        fillScreen(((31) | (0)<<5 | (0)<<10));
        waitForVBlank();
        frame2();
        delay(300);

        fillScreen(((31) | (31)<<5 | (0)<<10));
        waitForVBlank();
        frame3();
        delay(300);
    }
}

void initialize() {
    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);
}

void frame1() {
    drawTriangle(50, 70, ((31) | (0)<<5 | (31)<<10));
    drawTriangle(130, 70, ((31) | (0)<<5 | (31)<<10));
    drawRect(75, 100, ((31) | (0)<<5 | (31)<<10));
}

void frame2() {
    drawTriangle(100, 80, ((31) | (31)<<5 | (31)<<10));
    drawTriangle(180, 80, ((31) | (31)<<5 | (31)<<10));
    drawRect(125, 110, ((31) | (31)<<5 | (31)<<10));
}

void frame3() {
    drawTriangle(80, 30, ((0) | (31)<<5 | (31)<<10));
    drawTriangle(160, 30, ((0) | (31)<<5 | (31)<<10));
    drawRect(105, 60, ((0) | (31)<<5 | (31)<<10));
}
