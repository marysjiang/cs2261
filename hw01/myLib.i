# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
# 25 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawTriangle(int, int, unsigned short color);
void drawRect(int, int, unsigned short color);
void fillScreen(unsigned short color);
void waitForVBlank();
void delay();


extern unsigned short *videoBuffer;
# 2 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }
}

void drawTriangle(int col, int row, unsigned short color) {
    int length = 30;
    for (int i = 0; i < length; i++) {
        setPixel((col + i), row, color);
        setPixel(col, (row + i), color);
        setPixel((col + i), (row + length - i), color);
    }
}

void drawRect(int col, int row, unsigned short color) {
    int length = 20;
    for (int i = 0; i < length; i++) {
        setPixel(col, (row + i + 1), color);
        setPixel((col + 2 * length), (row + i), color);
    }
    for (int i = 0; i < 2 * length; i++) {
        setPixel((col + i), row, color);
        setPixel((col + i + 1), (row + length), color);
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

void delay(int time) {
    volatile int trash = 0;
    for (int i = 0; i < time * 1000; i++) {
        trash++;
    }
}
