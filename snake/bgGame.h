
//{{BLOCK(bgGame)

//======================================================================
//
//	bgGame, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 236 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7552 + 2048 = 10112
//
//	Time-stamp: 2020-03-29, 17:33:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGGAME_H
#define GRIT_BGGAME_H

#define bgGameTilesLen 7552
extern const unsigned short bgGameTiles[3776];

#define bgGameMapLen 2048
extern const unsigned short bgGameMap[1024];

#define bgGamePalLen 512
extern const unsigned short bgGamePal[256];

#endif // GRIT_BGGAME_H

//}}BLOCK(bgGame)
