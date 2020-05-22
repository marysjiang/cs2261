
//{{BLOCK(bgPause)

//======================================================================
//
//	bgPause, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 318 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10176 + 2048 = 12736
//
//	Time-stamp: 2020-04-28, 18:44:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGPAUSE_H
#define GRIT_BGPAUSE_H

#define bgPauseTilesLen 10176
extern const unsigned short bgPauseTiles[5088];

#define bgPauseMapLen 2048
extern const unsigned short bgPauseMap[1024];

#define bgPausePalLen 512
extern const unsigned short bgPausePal[256];

#endif // GRIT_BGPAUSE_H

//}}BLOCK(bgPause)
