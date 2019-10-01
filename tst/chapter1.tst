##  To create a test file, place GAP prompts, input and output exactly as
##  they must appear in the GAP session. Do not remove lines containing 
##  START_TEST and STOP_TEST statements.
##
##  The first line starts the test. START_TEST reinitializes the caches and 
##  the global random number generator, in order to be independent of the 
##  reading order of several test files. Furthermore, the assertion level 
##  is set to 2 by START_TEST and set back to the previous value in the 
##  subsequent STOP_TEST call.
##
##  The argument of STOP_TEST may be an arbitrary identifier string.
## 
gap> START_TEST("LocalNR package: man-examples.tst");

# Note that you may use comments in the test file
# and also separate parts of the test by empty lines

gap> List(TheAdditiveGroupsOfLibraryOfLNRsOfOrder(81),IdGroup);
[ [ 81, 1 ], [ 81, 2 ], [ 81, 3 ], [ 81, 5 ], [ 81, 6 ], [ 81, 11 ], 
  [ 81, 12 ], [ 81, 13 ], [ 81, 15 ] ]
gap> G:=SmallGroup(81,2);
<pc group of size 81 with 4 generators>
gap> TheLibraryOfLNRsOnGroup(G);
[ "AllLocalNearRings(81,2,54,3)", "AllLocalNearRings(81,2,54,6)", 
  "AllLocalNearRings(81,2,54,9)", "AllLocalNearRings(81,2,54,10)", 
  "AllLocalNearRings(81,2,54,11)", "AllLocalNearRings(81,2,54,15)", 
  "AllLocalNearRings(81,2,72,14)", "AllLocalNearRings(81,2,72,19)", 
  "AllLocalNearRings(81,2,72,24)", "AllLocalNearRings(81,2,72,26)" ]
gap> InfoLocalNearRing(SmallGroup(361,2));
The local nearrings are sorted by their multiplicative groups.
[ "AllLocalNearRings(361,2,342,1) (2)", "AllLocalNearRings(361,2,342,2) (2)", \
"AllLocalNearRings(361,2,342,4) (1)",
  "AllLocalNearRings(361,2,342,6) (1)", "AllLocalNearRings(361,2,342,7) (7)",\
 "AllLocalNearRings(361,2,342,8) (6)",
  "AllLocalNearRings(361,2,360,4) (1)", "AllLocalNearRings(361,2,360,15) (1)"\
 ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(49,2)); 
[ "AllLocalNearRings(49,2,42,1)", "AllLocalNearRings(49,2,42,2)", 
  "AllLocalNearRings(49,2,42,4)", "AllLocalNearRings(49,2,42,6)", 
  "AllLocalNearRings(49,2,48,2)", "AllLocalNearRings(49,2,48,27)", 
  "AllLocalNearRings(49,2,48,28)" ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(81,15));
[ "AllLocalNearRings(81,15,54,3)", "AllLocalNearRings(81,15,54,5)", 
  "AllLocalNearRings(81,15,54,6)", "AllLocalNearRings(81,15,54,8)", 
  "AllLocalNearRings(81,15,54,9)", "AllLocalNearRings(81,15,54,10)", 
  "AllLocalNearRings(81,15,54,11)", "AllLocalNearRings(81,15,54,12)", 
  "AllLocalNearRings(81,15,54,13)", "AllLocalNearRings(81,15,54,14)", 
  "AllLocalNearRings(81,15,54,15)", "AllLocalNearRings(81,15,72,13)", 
  "AllLocalNearRings(81,15,72,14)", "AllLocalNearRings(81,15,72,19)", 
  "AllLocalNearRings(81,15,72,24)", "AllLocalNearRings(81,15,72,39)", 
  "AllLocalNearRings(81,15,80,1)", "AllLocalNearRings(81,15,80,2)" ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(121,2));
[ "AllLocalNearRings(121,2,110,1)", "AllLocalNearRings(121,2,110,2)", 
  "AllLocalNearRings(121,2,110,4)", "AllLocalNearRings(121,2,110,6)", 
  "AllLocalNearRings(121,2,120,4)", "AllLocalNearRings(121,2,120,5)", 
  "AllLocalNearRings(121,2,120,15)", "AllLocalNearRings(121,2,120,21)" ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(125,5));
[ "AllLocalNearRings(125,5,100,6)", "AllLocalNearRings(125,5,100,7)", 
  "AllLocalNearRings(125,5,100,8)", "AllLocalNearRings(125,5,100,9)", 
  "AllLocalNearRings(125,5,100,10)", "AllLocalNearRings(125,5,100,11)", 
  "AllLocalNearRings(125,5,100,12)", "AllLocalNearRings(125,5,124,2)" ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(169,2));
[ "AllLocalNearRings(169,2,156,1)", "AllLocalNearRings(169,2,156,2)", 
  "AllLocalNearRings(169,2,156,4)", "AllLocalNearRings(169,2,156,6)", 
  "AllLocalNearRings(169,2,156,7)", "AllLocalNearRings(169,2,156,9)", 
  "AllLocalNearRings(169,2,168,4)", "AllLocalNearRings(169,2,168,6)" ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(289,2)); 
[ "AllLocalNearRings(289,2,272,1)", "AllLocalNearRings(289,2,272,2)", 
  "AllLocalNearRings(289,2,272,3)", "AllLocalNearRings(289,2,272,28)", 
  "AllLocalNearRings(289,2,272,50)", "AllLocalNearRings(289,2,288,1)", 
  "AllLocalNearRings(289,2,288,2)" ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(343,2));
[ "AllLocalNearRings(343,2,294,8)", "AllLocalNearRings(343,2,294,15)", 
  "AllLocalNearRings(343,2,294,18)", "AllLocalNearRings(343,2,294,23)" ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(343,5));
[ "AllLocalNearRings(343,5,294,8)", "AllLocalNearRings(343,5,294,9)", 
  "AllLocalNearRings(343,5,294,10)", "AllLocalNearRings(343,5,294,11)", 
  "AllLocalNearRings(343,5,294,12)", "AllLocalNearRings(343,5,294,13)", 
  "AllLocalNearRings(343,5,294,14)", "AllLocalNearRings(343,5,294,15)", 
  "AllLocalNearRings(343,5,294,16)", "AllLocalNearRings(343,5,294,17)", 
  "AllLocalNearRings(343,5,294,18)", "AllLocalNearRings(343,5,294,19)", 
  "AllLocalNearRings(343,5,294,23)", "AllLocalNearRings(343,5,342,2)", 
  "AllLocalNearRings(343,5,342,6)" ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(361,2));
[ "AllLocalNearRings(361,2,342,1)", "AllLocalNearRings(361,2,342,2)", 
  "AllLocalNearRings(361,2,342,4)", "AllLocalNearRings(361,2,342,6)", 
  "AllLocalNearRings(361,2,342,7)", "AllLocalNearRings(361,2,342,8)", 
  "AllLocalNearRings(361,2,360,4)", "AllLocalNearRings(361,2,360,15)" ]
gap> TheLibraryOfLNRsOnGroup(SmallGroup(1331,2));
[ "AllLocalNearRings(1331,2,1210,8)", "AllLocalNearRings(1331,2,1210,18)", 
  "AllLocalNearRings(1331,2,1210,22)", "AllLocalNearRings(1331,2,1210,27)" ]

## Each test file should finish with the call of STOP_TEST.
## The argument of STOP_TEST should be the name of the test file.
gap> STOP_TEST( "man-examples.tst" );

#############################################################################
##
#E
