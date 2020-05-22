#include "myLib.h"

void initialize();
void frame1();
void frame2();
void frame3();

int main() {
    initialize();
    
    while(1) {
        fillScreen(CYAN);
        waitForVBlank();
        frame1();
        delay(300);

        fillScreen(RED);
        waitForVBlank();
        frame2();
        delay(300);
        
        fillScreen(YELLOW);
        waitForVBlank();
        frame3();
        delay(300);
    }
}

void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
}

void frame1() {
    drawTriangle(50, 70, MAGENTA);
    drawTriangle(130, 70, MAGENTA);
    drawRect(75, 100, MAGENTA);
}

void frame2() {
    drawTriangle(100, 80, WHITE);
    drawTriangle(180, 80, WHITE);
    drawRect(125, 110, WHITE);
}

void frame3() {
    drawTriangle(80, 30, CYAN);
    drawTriangle(160, 30, CYAN);
    drawRect(105, 60, CYAN);
}

