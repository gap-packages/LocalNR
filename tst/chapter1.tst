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
gap> InfoLocalNearRing(G);
There are 268 local nearrings on this group.    
They are sorted by their multiplicative groups. 
AllLocalNearRings(81,2,54,3)                          (27)  
AllLocalNearRings(81,2,54,6)                          (55)  
AllLocalNearRings(81,2,54,9)                          (49)  
AllLocalNearRings(81,2,54,10)                         (11)  
AllLocalNearRings(81,2,54,11)                         (110) 
AllLocalNearRings(81,2,54,15)                         (4)   
AllLocalNearRings(81,2,72,14)                         (2)   
AllLocalNearRings(81,2,72,19)                         (2)   
AllLocalNearRings(81,2,72,24)                         (4)   
AllLocalNearRings(81,2,72,26)                         (4)   
gap> H:=SmallGroup(81,3);
<pc group of size 81 with 4 generators>
gap> TheLibraryOfLNRsOnGroup(H);
[ "AllLocalNearRings(81,3,54,12)" ]
gap> InfoLocalNearRing(H);
There are 46 local nearrings on this group. 
AllLocalNearRings(81,3,54,12)                        (46) 
gap> K:=SmallGroup(81,5);
<pc group of size 81 with 4 generators>
gap> TheLibraryOfLNRsOnGroup(K);
[ "AllLocalNearRings(81,5,54,4)", "AllLocalNearRings(81,5,54,9)", 
  "AllLocalNearRings(81,5,54,11)" ]
gap> InfoLocalNearRing(K);
There are 388 local nearrings on this group.    
They are sorted by their multiplicative groups. 
AllLocalNearRings(81,5,54,4)                         (10)  
AllLocalNearRings(81,5,54,9)                         (135) 
AllLocalNearRings(81,5,54,11)                        (243) 
gap> R:=SmallGroup(81,6);
<pc group of size 81 with 4 generators>
gap> TheLibraryOfLNRsOnGroup(R);
[ "AllLocalNearRings(81,6,54,4)" ]
gap> InfoLocalNearRing(R);
There are 10 local nearrings on this group. 
AllLocalNearRings(81,6,54,4)                          (10) 
gap> M:=SmallGroup(81,11);
<pc group of size 81 with 4 generators>
gap> TheLibraryOfLNRsOnGroup(M);
[ "AllLocalNearRings(81,11,54,5)", "AllLocalNearRings(81,11,54,8)", 
  "AllLocalNearRings(81,11,54,9)", "AllLocalNearRings(81,11,54,10)", 
  "AllLocalNearRings(81,11,54,11)", "AllLocalNearRings(81,11,54,12)", 
  "AllLocalNearRings(81,11,54,13)", "AllLocalNearRings(81,11,54,15)" ]
gap> InfoLocalNearRing(M);
There are 22989 local nearrings on this group.  
They are sorted by their multiplicative groups. 
AllLocalNearRings(81,11,54,5)                         (45)    
AllLocalNearRings(81,11,54,8)                         (16)    
AllLocalNearRings(81,11,54,9)                         (13)    
AllLocalNearRings(81,11,54,10)                        (15006) 
AllLocalNearRings(81,11,54,11)                        (24)    
AllLocalNearRings(81,11,54,12)                        (175)   
AllLocalNearRings(81,11,54,13)                        (30)    
AllLocalNearRings(81,11,54,15)                        (7680)  
gap> N:=SmallGroup(81,12);
<pc group of size 81 with 4 generators>
gap> TheLibraryOfLNRsOnGroup(N);
[ "AllLocalNearRings(81,12,54,5)", "AllLocalNearRings(81,12,54,8)", 
  "AllLocalNearRings(81,12,54,12)", "AllLocalNearRings(81,12,54,13)", 
  "AllLocalNearRings(81,12,72,39)" ]
gap> InfoLocalNearRing(N);
There are 807 local nearrings on this group.    
They are sorted by their multiplicative groups. 
AllLocalNearRings(81,12,54,5)                          (417) 
AllLocalNearRings(81,12,54,8)                          (30)  
AllLocalNearRings(81,12,54,12)                         (108) 
AllLocalNearRings(81,12,54,13)                         (248) 
AllLocalNearRings(81,12,72,39)                         (4)   
gap> P:=SmallGroup(81,13);
<pc group of size 81 with 4 generators>
gap> TheLibraryOfLNRsOnGroup(P);
[ "AllLocalNearRings(81,13,54,5)", "AllLocalNearRings(81,13,54,8)", 
  "AllLocalNearRings(81,13,54,12)", "AllLocalNearRings(81,13,54,13)" ]
gap> InfoLocalNearRing(P);
There are 337 local nearrings on this group.    
They are sorted by their multiplicative groups. 
AllLocalNearRings(81,13,54,5)                          (45)  
AllLocalNearRings(81,13,54,8)                          (55)  
AllLocalNearRings(81,13,54,12)                         (175) 
AllLocalNearRings(81,13,54,13)                         (62)  
gap> S:=SmallGroup(81,15);
<pc group of size 81 with 4 generators>
gap> TheLibraryOfLNRsOnGroup(S);
[ "AllLocalNearRings(81,15,54,3)", "AllLocalNearRings(81,15,54,5)", 
  "AllLocalNearRings(81,15,54,6)", "AllLocalNearRings(81,15,54,8)", 
  "AllLocalNearRings(81,15,54,9)", "AllLocalNearRings(81,15,54,10)", 
  "AllLocalNearRings(81,15,54,11)", "AllLocalNearRings(81,15,54,12)", 
  "AllLocalNearRings(81,15,54,13)", "AllLocalNearRings(81,15,54,14)", 
  "AllLocalNearRings(81,15,54,15)", "AllLocalNearRings(81,15,72,13)", 
  "AllLocalNearRings(81,15,72,14)", "AllLocalNearRings(81,15,72,19)", 
  "AllLocalNearRings(81,15,72,24)", "AllLocalNearRings(81,15,72,39)", 
  "AllLocalNearRings(81,15,80,1)", "AllLocalNearRings(81,15,80,2)" ]
gap> InfoLocalNearRing(S);
There are 12352 local nearrings on this group.  
They are sorted by their multiplicative groups. 
AllLocalNearRings(81,15,54,3)                          (9)    
AllLocalNearRings(81,15,54,5)                          (391)  
AllLocalNearRings(81,15,54,6)                          (18)   
AllLocalNearRings(81,15,54,8)                          (10)   
AllLocalNearRings(81,15,54,9)                          (9)    
AllLocalNearRings(81,15,54,10)                         (7527) 
AllLocalNearRings(81,15,54,11)                         (17)   
AllLocalNearRings(81,15,54,12)                         (87)   
AllLocalNearRings(81,15,54,13)                         (191)  
AllLocalNearRings(81,15,54,14)                         (167)  
AllLocalNearRings(81,15,54,15)                         (3896) 
AllLocalNearRings(81,15,72,13)                         (2) 
AllLocalNearRings(81,15,72,14)                         (2) 
AllLocalNearRings(81,15,72,19)                         (4) 
AllLocalNearRings(81,15,72,24)                         (4) 
AllLocalNearRings(81,15,72,39)                         (10) 

## Each test file should finish with the call of STOP_TEST.
## The argument of STOP_TEST should be the name of the test file.
gap> STOP_TEST( "man-examples.tst" );

#############################################################################
##
#E
