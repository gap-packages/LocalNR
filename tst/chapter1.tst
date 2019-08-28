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
gap> D:=SmallGroup(64,35);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(D);
[ "AllLocalNearRings(64,35,32,6)", "AllLocalNearRings(64,35,32,11)", 
  "AllLocalNearRings(64,35,32,22)", "AllLocalNearRings(64,35,32,24)", 
  "AllLocalNearRings(64,35,32,25)", "AllLocalNearRings(64,35,32,27)", 
  "AllLocalNearRings(64,35,32,28)", "AllLocalNearRings(64,35,32,29)", 
  "AllLocalNearRings(64,35,32,30)", "AllLocalNearRings(64,35,32,31)", 
  "AllLocalNearRings(64,35,32,33)", "AllLocalNearRings(64,35,32,34)", 
  "AllLocalNearRings(64,35,32,42)", "AllLocalNearRings(64,35,32,43)", 
  "AllLocalNearRings(64,35,32,44)", "AllLocalNearRings(64,35,32,46)", 
  "AllLocalNearRings(64,35,32,48)" ]
gap> InfoLocalNearRing(D);
There are 15504 local nearrings on this group.  
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,35,32,6)                            (512)  
AllLocalNearRings(64,35,32,11)                           (4608) 
AllLocalNearRings(64,35,32,22)                           (64)   
AllLocalNearRings(64,35,32,24)                           (80)   
AllLocalNearRings(64,35,32,25)                           (288)  
AllLocalNearRings(64,35,32,27)                           (680)  
AllLocalNearRings(64,35,32,28)                           (1152) 
AllLocalNearRings(64,35,32,29)                           (128)  
AllLocalNearRings(64,35,32,30)                           (704)  
AllLocalNearRings(64,35,32,31)                           (208)  
AllLocalNearRings(64,35,32,33)                           (128)  
AllLocalNearRings(64,35,32,34)                           (120)  
AllLocalNearRings(64,35,32,42)                           (2048) 
AllLocalNearRings(64,35,32,43)                           (2560) 
AllLocalNearRings(64,35,32,44)                           (2048) 
AllLocalNearRings(64,35,32,46)                           (96)   
AllLocalNearRings(64,35,32,48)                           (80)   
gap> F:=SmallGroup(121,2);
<pc group of size 121 with 2 generators>
gap> TheLibraryOfLNRsOnGroup(F);
[ "AllLocalNearRings(121,2,110,1)", "AllLocalNearRings(121,2,110,2)", 
  "AllLocalNearRings(121,2,110,4)", "AllLocalNearRings(121,2,110,6)", 
  "AllLocalNearRings(121,2,120,4)", "AllLocalNearRings(121,2,120,5)", 
  "AllLocalNearRings(121,2,120,15)", "AllLocalNearRings(121,2,120,21)" ]
gap> InfoLocalNearRing(F);
There are 15 local nearrings on this group.     
They are sorted by their multiplicative groups. 
AllLocalNearRings(121,2,110,1)                          (5) 
AllLocalNearRings(121,2,110,2)                          (4) 
AllLocalNearRings(121,2,110,4)                          (1) 
AllLocalNearRings(121,2,110,6)                          (1) 
AllLocalNearRings(121,2,120,4)                          (1) 
AllLocalNearRings(121,2,120,5)                          (1) 
AllLocalNearRings(121,2,120,15)                         (1) 
AllLocalNearRings(121,2,120,21)                         (1) 
gap> G:=SmallGroup(64,26);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(G);
[ "AllLocalNearRings(64,26,32,5)", "AllLocalNearRings(64,26,32,11)", 
  "AllLocalNearRings(64,26,32,21)", "AllLocalNearRings(64,26,32,22)", 
  "AllLocalNearRings(64,26,32,23)", "AllLocalNearRings(64,26,32,24)", 
  "AllLocalNearRings(64,26,32,25)", "AllLocalNearRings(64,26,32,28)", 
  "AllLocalNearRings(64,26,32,29)", "AllLocalNearRings(64,26,32,30)", 
  "AllLocalNearRings(64,26,32,36)", "AllLocalNearRings(64,26,32,37)", 
  "AllLocalNearRings(64,26,32,40)", "AllLocalNearRings(64,26,32,41)", 
  "AllLocalNearRings(64,26,32,42)", "AllLocalNearRings(64,26,32,43)", 
  "AllLocalNearRings(64,26,32,44)", "AllLocalNearRings(64,26,32,45)", 
  "AllLocalNearRings(64,26,32,46)", "AllLocalNearRings(64,26,32,47)", 
  "AllLocalNearRings(64,26,32,48)" ]
gap> InfoLocalNearRing(G);
There are 11467 local nearrings on this group. 
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,26,32,5)                            (16)   
AllLocalNearRings(64,26,32,11)                           (36)   
AllLocalNearRings(64,26,32,21)                           (346)  
AllLocalNearRings(64,26,32,22)                           (576)  
AllLocalNearRings(64,26,32,23)                           (832)  
AllLocalNearRings(64,26,32,24)                           (528)  
AllLocalNearRings(64,26,32,25)                           (2305) 
AllLocalNearRings(64,26,32,28)                           (1024) 
AllLocalNearRings(64,26,32,29)                           (1024) 
AllLocalNearRings(64,26,32,30)                           (1024) 
AllLocalNearRings(64,26,32,36)                           (84)   
AllLocalNearRings(64,26,32,37)                           (232)  
AllLocalNearRings(64,26,32,40)                           (32)   
AllLocalNearRings(64,26,32,41)                           (32)   
AllLocalNearRings(64,26,32,42)                           (288)  
AllLocalNearRings(64,26,32,43)                           (144)  
AllLocalNearRings(64,26,32,44)                           (208)  
AllLocalNearRings(64,26,32,45)                           (456)  
AllLocalNearRings(64,26,32,46)                           (212)  
AllLocalNearRings(64,26,32,47)                           (212)  
AllLocalNearRings(64,26,32,48)                           (1856) 
gap> S:=SmallGroup(64,27);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(S);
[ "AllLocalNearRings(64,27,32,5)", "AllLocalNearRings(64,27,32,11)", 
  "AllLocalNearRings(64,27,32,21)", "AllLocalNearRings(64,27,32,22)", 
  "AllLocalNearRings(64,27,32,23)", "AllLocalNearRings(64,27,32,24)", 
  "AllLocalNearRings(64,27,32,25)", "AllLocalNearRings(64,27,32,28)", 
  "AllLocalNearRings(64,27,32,29)", "AllLocalNearRings(64,27,32,30)", 
  "AllLocalNearRings(64,27,32,36)", "AllLocalNearRings(64,27,32,37)", 
  "AllLocalNearRings(64,27,32,40)", "AllLocalNearRings(64,27,32,41)", 
  "AllLocalNearRings(64,27,32,42)", "AllLocalNearRings(64,27,32,43)", 
  "AllLocalNearRings(64,27,32,44)", "AllLocalNearRings(64,27,32,45)", 
  "AllLocalNearRings(64,27,32,46)", "AllLocalNearRings(64,27,32,47)", 
  "AllLocalNearRings(64,27,32,48)" ]
gap> InfoLocalNearRing(S);
There are 11467 local nearrings on this group.  
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,27,32,5)                            (16)   
AllLocalNearRings(64,27,32,11)                           (36)   
AllLocalNearRings(64,27,32,21)                           (272)  
AllLocalNearRings(64,27,32,22)                           (512)  
AllLocalNearRings(64,27,32,23)                           (768)  
AllLocalNearRings(64,27,32,24)                           (602)  
AllLocalNearRings(64,27,32,25)                           (2177) 
AllLocalNearRings(64,27,32,28)                           (1088) 
AllLocalNearRings(64,27,32,29)                           (1088) 
AllLocalNearRings(64,27,32,30)                           (1152) 
AllLocalNearRings(64,27,32,36)                           (84)   
AllLocalNearRings(64,27,32,37)                           (232)  
AllLocalNearRings(64,27,32,40)                           (32)   
AllLocalNearRings(64,27,32,41)                           (32)   
AllLocalNearRings(64,27,32,42)                           (288)  
AllLocalNearRings(64,27,32,43)                           (144)  
AllLocalNearRings(64,27,32,44)                           (208)  
AllLocalNearRings(64,27,32,45)                           (376)  
AllLocalNearRings(64,27,32,46)                           (212)  
AllLocalNearRings(64,27,32,47)                           (212)  
AllLocalNearRings(64,27,32,48)                           (1936) 
gap> R:=SmallGroup(64,34);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(R);
[ "AllLocalNearRings(64,34,32,6)", "AllLocalNearRings(64,34,32,11)", 
  "AllLocalNearRings(64,34,32,22)", "AllLocalNearRings(64,34,32,24)", 
  "AllLocalNearRings(64,34,32,25)", "AllLocalNearRings(64,34,32,27)", 
  "AllLocalNearRings(64,34,32,28)", "AllLocalNearRings(64,34,32,29)", 
  "AllLocalNearRings(64,34,32,30)", "AllLocalNearRings(64,34,32,31)", 
  "AllLocalNearRings(64,34,32,33)", "AllLocalNearRings(64,34,32,34)", 
  "AllLocalNearRings(64,34,32,42)", "AllLocalNearRings(64,34,32,43)", 
  "AllLocalNearRings(64,34,32,44)", "AllLocalNearRings(64,34,32,46)", 
  "AllLocalNearRings(64,34,32,48)" ]
gap>  InfoLocalNearRing(R);
There are 16177 local nearrings on this group.  
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,34,32,6)                            (576)  
AllLocalNearRings(64,34,32,11)                           (4736) 
AllLocalNearRings(64,34,32,22)                           (64)   
AllLocalNearRings(64,34,32,24)                           (64)   
AllLocalNearRings(64,34,32,25)                           (304)  
AllLocalNearRings(64,34,32,27)                           (704)  
AllLocalNearRings(64,34,32,28)                           (1193) 
AllLocalNearRings(64,34,32,29)                           (128)  
AllLocalNearRings(64,34,32,30)                           (752)  
AllLocalNearRings(64,34,32,31)                           (192)  
AllLocalNearRings(64,34,32,33)                           (144)  
AllLocalNearRings(64,34,32,34)                           (96)   
AllLocalNearRings(64,34,32,42)                           (2304) 
AllLocalNearRings(64,34,32,43)                           (2688) 
AllLocalNearRings(64,34,32,44)                           (2048) 
AllLocalNearRings(64,34,32,46)                           (120)  
AllLocalNearRings(64,34,32,48)                           (64)   
gap> Size(AllLocalNearRings(64,35,32,22));
64
gap> Size(AllLocalNearRings(64,35,32,24));
80
gap> Size(AllLocalNearRings(64,35,32,46));
96
gap> Size(AllLocalNearRings(64,35,32,48));
80
gap> Size(AllLocalNearRings(121,2,110,1));
5
gap> Size(AllLocalNearRings(121,2,110,2));
4
gap> Size(AllLocalNearRings(121,2,110,4));
1
gap> Size(AllLocalNearRings(121,2,110,6));
1
gap> Size(AllLocalNearRings(121,2,120,4));
1
gap> Size(AllLocalNearRings(121,2,120,5));
1
gap> Size(AllLocalNearRings(121,2,120,15));
1
gap> Size(AllLocalNearRings(121,2,120,21));
1
gap> Size(AllLocalNearRings(64,26,32,5));
16
gap> Size(AllLocalNearRings(64,26,32,11));
36
gap> Size(AllLocalNearRings(64,26,32,36));
84
gap> Size(AllLocalNearRings(64,26,32,40));
32
gap> Size(AllLocalNearRings(64,26,32,41));
32
gap> Size(AllLocalNearRings(64,27,32,5));
16
gap> Size(AllLocalNearRings(64,27,32,11));
36
gap> Size(AllLocalNearRings(64,27,32,36));
84
gap> Size(AllLocalNearRings(64,27,32,40));
32
gap> Size(AllLocalNearRings(64,27,32,41)); 
32
gap> Size(AllLocalNearRings(64,34,32,22));
64
gap> Size(AllLocalNearRings(64,34,32,24));
64
gap> Size(AllLocalNearRings(64,34,32,48));
64
gap> Size(AllLocalNearRings(343,5,294,8));
3
gap> Size(AllLocalNearRings(343,5,294,9));
2
gap> Size(AllLocalNearRings(343,5,294,10));
4
gap> Size(AllLocalNearRings(343,5,294,11)); 
5
gap> Size(AllLocalNearRings(343,5,294,12));
3
gap> Size(AllLocalNearRings(343,5,294,13));
5
gap> Size(AllLocalNearRings(343,5,294,14));
2
gap> Size(AllLocalNearRings(343,5,294,15));
3
gap> Size(AllLocalNearRings(343,5,294,16));
3
gap> Size(AllLocalNearRings(343,5,294,17));
3
gap> Size(AllLocalNearRings(343,5,294,18));
2
gap> Size(AllLocalNearRings(343,5,294,19));
2
gap> Size(AllLocalNearRings(343,5,294,23));
9

## Each test file should finish with the call of STOP_TEST.
## The argument of STOP_TEST should be the name of the test file.
gap> STOP_TEST( "man-examples.tst" );

#############################################################################
##
#E
