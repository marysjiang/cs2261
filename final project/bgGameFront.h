
//{{BLOCK(bgGameFront)

//======================================================================
//
//	bgGameFront, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 455 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 14560 + 4096 = 19168
//
//	Time-stamp: 2020-04-22, 02:40:13
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGGAMEFRONT_H
#define GRIT_BGGAMEFRONT_H

#define bgGameFrontTilesLen 14560
extern const unsigned short bgGameFrontTiles[7280];

#define bgGameFrontMapLen 4096
extern const unsigned short bgGameFrontMap[2048];

#define bgGameFrontPalLen 512
extern const unsigned short bgGameFrontPal[256];

#endif // GRIT_BGGAMEFRONT_H

//}}BLOCK(bgGameFront)
