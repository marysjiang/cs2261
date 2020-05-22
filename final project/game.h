// anisprite struct
typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
    int active;
    int hit;
} ANISPRITE;

// constants
#define ROCKCOUNT 2
#define BUGCOUNT 3
#define HEARTCOUNT 3

#define GRAVITY 100
#define JUMPPOWER 1500
#define SHIFTUP(num) ((num) << 8)
#define SHIFTDOWN(num) ((num) >> 8)

// variables
extern ANISPRITE player;
extern ANISPRITE bees;
extern ANISPRITE rocks[ROCKCOUNT];
extern ANISPRITE bugs[BUGCOUNT];
extern ANISPRITE hearts[HEARTCOUNT];
 
 // player variables
extern int livesRemaining;
extern int usingNet;
extern int bugsCaught;

// offset variable
extern int hOff;
extern int vOff;

// obstacle timers
extern int rockTimer;
extern int rockTimerEnd;
extern int bugTimer;
extern int bugTimerEnd;

// game prototypes
void initGame();
void updateGame();
void drawGame();

// player prototypes
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();

// bee prototypes
void initBees();
void updateBees();
void animateBees();
void drawBees();

// rock prototypes
void initRocks();
void updateRocks(ANISPRITE *);
void generateRock();
void drawRocks();

// bug prototypes
void initBugs();
void updateBugs(ANISPRITE *);
void generateBug();
void drawBugs();

// heart prototypes
void initHearts();
void updateHearts(ANISPRITE *);
void drawHearts();