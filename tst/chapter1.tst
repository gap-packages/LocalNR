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
gap> InfoLocalNearRing(SmallGroup(49,1));
[ "AllLocalNearRings(49,1,42,6) (1)" ]
gap> G:=SmallGroup(25,2);
<pc group of size 25 with 2 generators>
gap> IsAdditiveGroupOfLibraryOfLNRs(G);
true
gap> IsAdditiveGroupOfLibraryOfLNRs(SmallGroup(81,14));
false


## Each test file should finish with the call of STOP_TEST.
## The argument of STOP_TEST should be the name of the test file.
gap> STOP_TEST( "man-examples.tst" );

#############################################################################
##
#E
