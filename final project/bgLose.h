
//{{BLOCK(bgLose)

//======================================================================
//
//	bgLose, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 361 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11552 + 2048 = 14112
//
//	Time-stamp: 2020-04-28, 18:40:50
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGLOSE_H
#define GRIT_BGLOSE_H

#define bgLoseTilesLen 11552
extern const unsigned short bgLoseTiles[5776];

#define bgLoseMapLen 2048
extern const unsigned short bgLoseMap[1024];

#define bgLosePalLen 512
extern const unsigned short bgLosePal[256];

#endif // GRIT_BGLOSE_H

//}}BLOCK(bgLose)
