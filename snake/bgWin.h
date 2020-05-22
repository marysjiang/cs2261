
//{{BLOCK(bgWin)

//======================================================================
//
//	bgWin, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 116 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3712 + 2048 = 6272
//
//	Time-stamp: 2020-03-29, 21:51:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGWIN_H
#define GRIT_BGWIN_H

#define bgWinTilesLen 3712
extern const unsigned short bgWinTiles[1856];

#define bgWinMapLen 2048
extern const unsigned short bgWinMap[1024];

#define bgWinPalLen 512
extern const unsigned short bgWinPal[256];

#endif // GRIT_BGWIN_H

//}}BLOCK(bgWin)
