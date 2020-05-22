
//{{BLOCK(bgGameBack)

//======================================================================
//
//	bgGameBack, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 151 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4832 + 2048 = 7392
//
//	Time-stamp: 2020-04-22, 02:40:29
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGGAMEBACK_H
#define GRIT_BGGAMEBACK_H

#define bgGameBackTilesLen 4832
extern const unsigned short bgGameBackTiles[2416];

#define bgGameBackMapLen 2048
extern const unsigned short bgGameBackMap[1024];

#define bgGameBackPalLen 512
extern const unsigned short bgGameBackPal[256];

#endif // GRIT_BGGAMEBACK_H

//}}BLOCK(bgGameBack)
