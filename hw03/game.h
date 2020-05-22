// paddle struct
typedef struct {
    int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
} PLAYER;

// orange struct
typedef struct {
    int row;
	int col;
	int oldRow;
	int oldCol;
	int height;
	int width;
	unsigned short color;
	int active;
} BRICK;

// bullet struct
typedef struct {
    int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
} BALL;

// macros
#define BRICKCOUNT 24
#define BALLCOUNT 3

// variables
extern PLAYER player;
extern BRICK bricks[BRICKCOUNT];
extern BALL balls[BALLCOUNT];
extern int bricksRemaining;
extern int ballsRemaining;

// game prototypes
void initGame();
void updateGame();
void drawGame();

// player prototypes
void initPlayer();
void updatePlayer();
void drawPlayer();

// bricks prototypes
void initBricks();
// void updateBrick(BRICK *);
void drawBrick(BRICK *);

// balls prototypes
void initBalls();
void updateBall(BALL *);
void drawBall(BALL *);
