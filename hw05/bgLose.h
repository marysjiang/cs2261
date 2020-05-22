
//{{BLOCK(bgLose)

//======================================================================
//
//	bgLose, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 119 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3808 + 2048 = 6368
//
//	Time-stamp: 2020-03-29, 21:39:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGLOSE_H
#define GRIT_BGLOSE_H

#define bgLoseTilesLen 3808
extern const unsigned short bgLoseTiles[1904];

#define bgLoseMapLen 2048
extern const unsigned short bgLoseMap[1024];

#define bgLosePalLen 512
extern const unsigned short bgLosePal[256];

#endif // GRIT_BGLOSE_H

//}}BLOCK(bgLose)
