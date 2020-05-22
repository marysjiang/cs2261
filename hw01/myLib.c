#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, 240)] = color;
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
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

void delay(int time) {
    volatile int trash = 0; // volatile tells C not to optimize code
    for (int i = 0; i < time * 1000; i++) {
        trash++;
    }
}