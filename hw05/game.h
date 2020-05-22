// anistate struct
typedef struct {
	int row;
    int oldRow;
	int col;
    int oldCol;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
    int active;
    int eaten;
} ANISPRITE;

// constants
#define ORANGECOUNT 24
#define MAXLENGTH 26

// variables
extern ANISPRITE snake[MAXLENGTH];
extern ANISPRITE oranges[ORANGECOUNT];
extern int snakeLength;
extern int timer;

// game prototypes
void initGame();
void updateGame();
void drawGame();

// snake prototypes
void initSnake();
void updateSnake();
void animateSnake();
void growSnake();
void drawSnake();

// orange prototypes
void initOranges();
void updateOranges(ANISPRITE *);
void generateOrange();
void drawOranges();

