// player struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int cdel;
    int rdel;
    int bulletTimer;
} PLAYER;

// bullet struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
    unsigned short color;
} BULLET;

// asteroid struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
} ASTEROID;

// constants
#define BULLETCOUNT 5
#define ASTEROIDCOUNT 10

// variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern ASTEROID asteroids[ASTEROIDCOUNT];
extern int asteroidsRemaining;
extern int gameState;

// custom game colors
#define NUMCOLORS 6
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

// game prototypes
void initGame();
void updateGame();
void drawGame();

// player prototypes
void initPlayer();
void updatePlayer();
void drawPlayer();

// bullet prototypes
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);

// asteroid prototypes
void initAsteroids();
void updateAsteroid(ASTEROID *);
void drawAsteroid(ASTEROID *);