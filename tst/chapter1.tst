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
gap> T:=SmallGroup(64,14);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(T);
[ "AllLocalNearRings(64,14,32,6)", "AllLocalNearRings(64,14,32,22)", 
  "AllLocalNearRings(64,14,32,25)", "AllLocalNearRings(64,14,32,27)", 
  "AllLocalNearRings(64,14,32,28)", "AllLocalNearRings(64,14,32,30)", 
  "AllLocalNearRings(64,14,32,31)", "AllLocalNearRings(64,14,32,34)", 
  "AllLocalNearRings(64,14,32,46)", "AllLocalNearRings(64,14,32,48)", 
  "AllLocalNearRings(64,14,32,49)" ]
gap> InfoLocalNearRing(T);
There are 5520 local nearrings on this group.   
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,14,32,6)                            (48)   
AllLocalNearRings(64,14,32,22)                           (1344) 
AllLocalNearRings(64,14,32,25)                           (240)  
AllLocalNearRings(64,14,32,27)                           (1824) 
AllLocalNearRings(64,14,32,28)                           (720)  
AllLocalNearRings(64,14,32,30)                           (192)  
AllLocalNearRings(64,14,32,31)                           (96)   
AllLocalNearRings(64,14,32,34)                           (144)  
AllLocalNearRings(64,14,32,46)                           (720)  
AllLocalNearRings(64,14,32,48)                           (96)   
AllLocalNearRings(64,14,32,49)                           (96)   
gap> V:=SmallGroup(64,15);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(V);
[ "AllLocalNearRings(64,15,32,5)", "AllLocalNearRings(64,15,32,9)", 
  "AllLocalNearRings(64,15,32,36)", "AllLocalNearRings(64,15,32,37)", 
  "AllLocalNearRings(64,15,32,39)", "AllLocalNearRings(64,15,32,40)", 
  "AllLocalNearRings(64,15,32,43)", "AllLocalNearRings(64,15,32,45)", 
  "AllLocalNearRings(64,15,32,46)", "AllLocalNearRings(64,15,32,47)", 
  "AllLocalNearRings(64,15,32,48)" ]
gap> InfoLocalNearRing(V);
There are 2384 local nearrings on this group.   
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,15,32,5)                           (96)  
AllLocalNearRings(64,15,32,9)                           (32)  
AllLocalNearRings(64,15,32,36)                          (64)  
AllLocalNearRings(64,15,32,37)                          (192) 
AllLocalNearRings(64,15,32,39)                          (408) 
AllLocalNearRings(64,15,32,40)                          (408) 
AllLocalNearRings(64,15,32,43)                          (800) 
AllLocalNearRings(64,15,32,45)                          (32)  
AllLocalNearRings(64,15,32,46)                          (32)  
AllLocalNearRings(64,15,32,47)                          (32)  
AllLocalNearRings(64,15,32,48)                          (288) 
gap> B:=SmallGroup(64,16);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(B);
[ "AllLocalNearRings(64,16,32,5)", "AllLocalNearRings(64,16,32,9)", 
  "AllLocalNearRings(64,16,32,36)", "AllLocalNearRings(64,16,32,37)", 
  "AllLocalNearRings(64,16,32,39)", "AllLocalNearRings(64,16,32,40)", 
  "AllLocalNearRings(64,16,32,43)", "AllLocalNearRings(64,16,32,45)", 
  "AllLocalNearRings(64,16,32,46)", "AllLocalNearRings(64,16,32,47)", 
  "AllLocalNearRings(64,16,32,48)" ]
gap> InfoLocalNearRing(B);
There are 2384 local nearrings on this group.   
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,16,32,5)                           (96)  
AllLocalNearRings(64,16,32,9)                           (32)  
AllLocalNearRings(64,16,32,36)                          (64)  
AllLocalNearRings(64,16,32,37)                          (192) 
AllLocalNearRings(64,16,32,39)                          (408) 
AllLocalNearRings(64,16,32,40)                          (408) 
AllLocalNearRings(64,16,32,43)                          (800) 
AllLocalNearRings(64,16,32,45)                          (32)  
AllLocalNearRings(64,16,32,46)                          (32)  
AllLocalNearRings(64,16,32,47)                          (32)  
AllLocalNearRings(64,16,32,48)                          (288) 
gap> C:=SmallGroup(64,23);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(C);
[ "AllLocalNearRings(64,23,32,6)", "AllLocalNearRings(64,23,32,7)", 
  "AllLocalNearRings(64,23,32,22)", "AllLocalNearRings(64,23,32,27)", 
  "AllLocalNearRings(64,23,32,28)", "AllLocalNearRings(64,23,32,30)", 
  "AllLocalNearRings(64,23,32,31)", "AllLocalNearRings(64,23,32,34)", 
  "AllLocalNearRings(64,23,32,46)", "AllLocalNearRings(64,23,32,48)", 
  "AllLocalNearRings(64,23,32,49)" ]
gap> InfoLocalNearRing(C);
There are 111758 local nearrings on this group.  
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,23,32,6)                          (710)   
AllLocalNearRings(64,23,32,7)                          (34)    
AllLocalNearRings(64,23,32,22)                         (14977) 
AllLocalNearRings(64,23,32,27)                         (29048) 
AllLocalNearRings(64,23,32,28)                         (29184) 
AllLocalNearRings(64,23,32,30)                         (7808) 
AllLocalNearRings(64,23,32,31)                         (3896) 
AllLocalNearRings(64,23,32,34)                         (6840) 
AllLocalNearRings(64,23,32,46)                         (11709) 
AllLocalNearRings(64,23,32,48)                         (3776) 
AllLocalNearRings(64,23,32,49)                         (3776) 
gap> D:=SmallGroup(64,24);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(D);
[ "AllLocalNearRings(64,24,32,6)", "AllLocalNearRings(64,24,32,22)", 
  "AllLocalNearRings(64,24,32,25)", "AllLocalNearRings(64,24,32,27)", 
  "AllLocalNearRings(64,24,32,28)", "AllLocalNearRings(64,24,32,30)", 
  "AllLocalNearRings(64,24,32,31)", "AllLocalNearRings(64,24,32,34)", 
  "AllLocalNearRings(64,24,32,46)", "AllLocalNearRings(64,24,32,48)", 
  "AllLocalNearRings(64,24,32,49)" ]
gap> InfoLocalNearRing(D);
There are 109189 local nearrings on this group. 
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,24,32,6)                           (640)   
AllLocalNearRings(64,24,32,22)                          (12481) 
AllLocalNearRings(64,24,32,25)                          (8676)  
AllLocalNearRings(64,24,32,27)                          (26856) 
AllLocalNearRings(64,24,32,28)                          (27488) 
AllLocalNearRings(64,24,32,30)                          (6624)  
AllLocalNearRings(64,24,32,31)                          (3312)  
AllLocalNearRings(64,24,32,34)                          (5364)  
AllLocalNearRings(64,24,32,46)                          (11124) 
AllLocalNearRings(64,24,32,48)                          (3312)  
AllLocalNearRings(64,24,32,49)                          (3312)  
gap> H:=SmallGroup(64,29);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(H);
[ "AllLocalNearRings(64,29,32,21)", "AllLocalNearRings(64,29,32,22)", 
  "AllLocalNearRings(64,29,32,23)", "AllLocalNearRings(64,29,32,24)", 
  "AllLocalNearRings(64,29,32,25)", "AllLocalNearRings(64,29,32,28)", 
  "AllLocalNearRings(64,29,32,29)", "AllLocalNearRings(64,29,32,30)", 
  "AllLocalNearRings(64,29,32,45)", "AllLocalNearRings(64,29,32,46)", 
  "AllLocalNearRings(64,29,32,47)", "AllLocalNearRings(64,29,32,48)" ]
gap> InfoLocalNearRing(H);
There are 28185 local nearrings on this group.  
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,29,32,21)                           (784)  
AllLocalNearRings(64,29,32,22)                           (1488) 
AllLocalNearRings(64,29,32,23)                           (2192) 
AllLocalNearRings(64,29,32,24)                           (1488) 
AllLocalNearRings(64,29,32,25)                           (7641) 
AllLocalNearRings(64,29,32,28)                           (3616) 
AllLocalNearRings(64,29,32,29)                           (3616) 
AllLocalNearRings(64,29,32,30)                           (2976) 
AllLocalNearRings(64,29,32,45)                           (784)  
AllLocalNearRings(64,29,32,46)                           (352)  
AllLocalNearRings(64,29,32,47)                           (352)  
AllLocalNearRings(64,29,32,48)                           (2896) 
gap> F:=SmallGroup(64,44);
<pc group of size 64 with 6 generators>
gap> TheLibraryOfLNRsOnGroup(F);
[ "AllLocalNearRings(64,44,32,21)", "AllLocalNearRings(64,44,32,22)", 
  "AllLocalNearRings(64,44,32,23)", "AllLocalNearRings(64,44,32,24)", 
  "AllLocalNearRings(64,44,32,25)", "AllLocalNearRings(64,44,32,28)", 
  "AllLocalNearRings(64,44,32,29)", "AllLocalNearRings(64,44,32,30)", 
  "AllLocalNearRings(64,44,32,45)", "AllLocalNearRings(64,44,32,46)", 
  "AllLocalNearRings(64,44,32,47)", "AllLocalNearRings(64,44,32,48)" ]
gap> InfoLocalNearRing(F);
There are 28500 local nearrings on this group.  
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,44,32,21)                           (864)  
AllLocalNearRings(64,44,32,22)                           (1632) 
AllLocalNearRings(64,44,32,23)                           (2400) 
AllLocalNearRings(64,44,32,24)                           (1632) 
AllLocalNearRings(64,44,32,25)                           (7188) 
AllLocalNearRings(64,44,32,28)                           (3360) 
AllLocalNearRings(64,44,32,29)                           (3360) 
AllLocalNearRings(64,44,32,30)                           (3264) 
AllLocalNearRings(64,44,32,45)                           (864)  
AllLocalNearRings(64,44,32,46)                           (384)  
AllLocalNearRings(64,44,32,47)                           (384)  
AllLocalNearRings(64,44,32,48)                           (3168) 
gap> G:=SmallGroup(64,45);      
<pc group of size 64 with 6 generators>
gap> InfoLocalNearRing(G);
There are 1920 local nearrings on this group.   
They are sorted by their multiplicative groups. 
AllLocalNearRings(64,45,32,36)                           (64)  
AllLocalNearRings(64,45,32,37)                           (192) 
AllLocalNearRings(64,45,32,40)                           (128) 
AllLocalNearRings(64,45,32,41)                           (128) 
AllLocalNearRings(64,45,32,42)                           (128) 
AllLocalNearRings(64,45,32,43)                           (320) 
AllLocalNearRings(64,45,32,44)                           (576) 
AllLocalNearRings(64,45,32,45)                           (32)  
AllLocalNearRings(64,45,32,46)                           (32)  
AllLocalNearRings(64,45,32,47)                           (32)  
AllLocalNearRings(64,45,32,48)                           (288) 
gap> TheLibraryOfLNRsOnGroup(G);
[ "AllLocalNearRings(64,45,32,36)", "AllLocalNearRings(64,45,32,37)", 
  "AllLocalNearRings(64,45,32,40)", "AllLocalNearRings(64,45,32,41)", 
  "AllLocalNearRings(64,45,32,42)", "AllLocalNearRings(64,45,32,43)", 
  "AllLocalNearRings(64,45,32,44)", "AllLocalNearRings(64,45,32,45)", 
  "AllLocalNearRings(64,45,32,46)", "AllLocalNearRings(64,45,32,47)", 
  "AllLocalNearRings(64,45,32,48)" ]
gap> K:=SmallGroup(121,2); 
<pc group of size 121 with 2 generators>
gap> TheLibraryOfLNRsOnGroup(K);
[ "AllLocalNearRings(121,2,110,1)", "AllLocalNearRings(121,2,110,2)", 
  "AllLocalNearRings(121,2,110,4)", "AllLocalNearRings(121,2,110,6)", 
  "AllLocalNearRings(121,2,120,4)", "AllLocalNearRings(121,2,120,5)", 
  "AllLocalNearRings(121,2,120,15)", "AllLocalNearRings(121,2,120,21)" ]
gap> InfoLocalNearRing(K);
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
gap> K:=SmallGroup(125,5);
<pc group of size 125 with 3 generators>
gap> TheLibraryOfLNRsOnGroup(K);
[ "AllLocalNearRings(125,5,100,6)", "AllLocalNearRings(125,5,100,7)", 
  "AllLocalNearRings(125,5,100,8)", "AllLocalNearRings(125,5,100,9)", 
  "AllLocalNearRings(125,5,100,10)", "AllLocalNearRings(125,5,100,11)", 
  "AllLocalNearRings(125,5,100,12)", "AllLocalNearRings(125,5,124,2)" ]
gap> InfoLocalNearRing(K);
There are 30 local nearrings on this group.     
They are sorted by their multiplicative groups. 
AllLocalNearRings(125,5,100,6)                          (5) 
AllLocalNearRings(125,5,100,7)                          (1) 
AllLocalNearRings(125,5,100,8)                          (7) 
AllLocalNearRings(125,5,100,9)                          (3) 
AllLocalNearRings(125,5,100,10)                         (5) 
AllLocalNearRings(125,5,100,11)                         (5) 
AllLocalNearRings(125,5,100,12)                         (3) 
AllLocalNearRings(125,5,124,2)                          (1) 
gap> L:=SmallGroup(169,2);
<pc group of size 169 with 2 generators>
gap> TheLibraryOfLNRsOnGroup(L);
[ "AllLocalNearRings(169,2,156,1)", "AllLocalNearRings(169,2,156,2)", 
  "AllLocalNearRings(169,2,156,4)", "AllLocalNearRings(169,2,156,6)", 
  "AllLocalNearRings(169,2,156,7)", "AllLocalNearRings(169,2,156,9)", 
  "AllLocalNearRings(169,2,168,4)", "AllLocalNearRings(169,2,168,6)" ]
gap> InfoLocalNearRing(L);
There are 15 local nearrings on this group.     
They are sorted by their multiplicative groups. 
AllLocalNearRings(169,2,156,1)                         (2) 
AllLocalNearRings(169,2,156,2)                         (2) 
AllLocalNearRings(169,2,156,4)                         (1) 
AllLocalNearRings(169,2,156,6)                         (1) 
AllLocalNearRings(169,2,156,7)                         (5) 
AllLocalNearRings(169,2,156,9)                         (2) 
AllLocalNearRings(169,2,168,4)                         (1) 
AllLocalNearRings(169,2,168,6)                         (1) 
gap> P:=SmallGroup(243,10);
<pc group of size 243 with 5 generators>
gap> TheLibraryOfLNRsOnGroup(P);
[ "AllLocalNearRings(243,10,162,3)", "AllLocalNearRings(243,10,162,6)", 
  "AllLocalNearRings(243,10,162,23)", "AllLocalNearRings(243,10,162,25)", 
  "AllLocalNearRings(243,10,162,30)", "AllLocalNearRings(243,10,162,31)", 
  "AllLocalNearRings(243,10,162,47)", "AllLocalNearRings(243,10,162,49)", 
  "AllLocalNearRings(243,10,162,50)" ]
gap> InfoLocalNearRing(P);
There are 119298 local nearrings on this group. 
They are sorted by their multiplicative groups. 
AllLocalNearRings(243,10,162,3)                           (477)   
AllLocalNearRings(243,10,162,6)                           (811)   
AllLocalNearRings(243,10,162,23)                          (21372) 
AllLocalNearRings(243,10,162,25)                          (96531) 
AllLocalNearRings(243,10,162,30)                          (36)    
AllLocalNearRings(243,10,162,31)                          (27)    
AllLocalNearRings(243,10,162,47)                          (6)     
AllLocalNearRings(243,10,162,49)                          (6)     
AllLocalNearRings(243,10,162,50)                          (32)    
gap> R:=SmallGroup(243,2); 
<pc group of size 243 with 5 generators>
gap> TheLibraryOfLNRsOnGroup(R);
[ "AllLocalNearRings(243,2,162,32)", "AllLocalNearRings(243,2,162,33)", 
  "AllLocalNearRings(243,2,162,35)", "AllLocalNearRings(243,2,162,36)", 
  "AllLocalNearRings(243,2,162,37)", "AllLocalNearRings(243,2,162,51)" ]
gap> InfoLocalNearRing(R);
There are 119629 local nearrings on this group. 
They are sorted by their multiplicative groups. 
AllLocalNearRings(243,2,162,32)                          (12879) 
AllLocalNearRings(243,2,162,33)                          (3351)  
AllLocalNearRings(243,2,162,35)                          (87)    
AllLocalNearRings(243,2,162,36)                          (96472) 
AllLocalNearRings(243,2,162,37)                          (6810)  
AllLocalNearRings(243,2,162,51)                          (30)    
gap> T:=SmallGroup(243,13);
<pc group of size 243 with 5 generators>
gap> TheLibraryOfLNRsOnGroup(T);
[ "AllLocalNearRings(243,13,162,32)", "AllLocalNearRings(243,13,162,33)", 
  "AllLocalNearRings(243,13,162,34)", "AllLocalNearRings(243,13,162,35)", 
  "AllLocalNearRings(243,13,162,36)", "AllLocalNearRings(243,13,162,37)", 
  "AllLocalNearRings(243,13,162,51)", "AllLocalNearRings(243,13,162,52)" ]
gap> InfoLocalNearRing(T);
There are 139672 local nearrings on this group. 
They are sorted by their multiplicative groups. 
AllLocalNearRings(243,13,162,32)                          (2430)  
AllLocalNearRings(243,13,162,33)                          (90)    
AllLocalNearRings(243,13,162,34)                          (81811) 
AllLocalNearRings(243,13,162,35)                          (6723)  
AllLocalNearRings(243,13,162,36)                          (32076) 
AllLocalNearRings(243,13,162,37)                          (342)   
AllLocalNearRings(243,13,162,51)                          (3321)  
AllLocalNearRings(243,13,162,52)                          (12879) 
gap> S:=SmallGroup(243,14);
<pc group of size 243 with 5 generators>
gap> TheLibraryOfLNRsOnGroup(S);
[ "AllLocalNearRings(243,14,162,32)", "AllLocalNearRings(243,14,162,33)", 
  "AllLocalNearRings(243,14,162,36)", "AllLocalNearRings(243,14,162,37)" ]
gap> InfoLocalNearRing(S);      
There are 115020 local nearrings on this group. 
They are sorted by their multiplicative groups. 
AllLocalNearRings(243,14,162,32)                          (12393) 
AllLocalNearRings(243,14,162,33)                          (3321)  
AllLocalNearRings(243,14,162,36)                          (92583) 
AllLocalNearRings(243,14,162,37)                          (6723)  
gap> V:=SmallGroup(243,15);
<pc group of size 243 with 5 generators>
gap> TheLibraryOfLNRsOnGroup(V);
[ "AllLocalNearRings(243,15,162,32)", "AllLocalNearRings(243,15,162,33)", 
  "AllLocalNearRings(243,15,162,34)", "AllLocalNearRings(243,15,162,36)", 
  "AllLocalNearRings(243,15,162,37)", "AllLocalNearRings(243,15,162,52)" ]
gap> InfoLocalNearRing(V);
There are 117783 local nearrings on this group. 
They are sorted by their multiplicative groups. 
AllLocalNearRings(243,15,162,32)                          (11961) 
AllLocalNearRings(243,15,162,33)                          (3432)  
AllLocalNearRings(243,15,162,34)                          (5832)  
AllLocalNearRings(243,15,162,36)                          (89127) 
AllLocalNearRings(243,15,162,37)                          (6702)  
AllLocalNearRings(243,15,162,52)                          (729)   
gap> W:=SmallGroup(289,2); 
<pc group of size 289 with 2 generators>
gap>  TheLibraryOfLNRsOnGroup(W);
[ "AllLocalNearRings(289,2,272,1)", "AllLocalNearRings(289,2,272,2)", 
  "AllLocalNearRings(289,2,272,3)", "AllLocalNearRings(289,2,272,28)", 
  "AllLocalNearRings(289,2,272,50)", "AllLocalNearRings(289,2,288,1)", 
  "AllLocalNearRings(289,2,288,2)" ]
gap> InfoLocalNearRing(W);
There are 19 local nearrings on this group.     
They are sorted by their multiplicative groups. 
AllLocalNearRings(289,2,272,1)                           (1) 
AllLocalNearRings(289,2,272,2)                           (1) 
AllLocalNearRings(289,2,272,3)                           (2) 
AllLocalNearRings(289,2,272,28)                          (4) 
AllLocalNearRings(289,2,272,50)                          (9) 
AllLocalNearRings(289,2,288,1)                           (1) 
AllLocalNearRings(289,2,288,2)                           (1) 
gap> U:=SmallGroup(343,5);
<pc group of size 343 with 3 generators>
gap> TheLibraryOfLNRsOnGroup(U);
[ "AllLocalNearRings(343,5,294,8)", "AllLocalNearRings(343,5,294,9)", 
  "AllLocalNearRings(343,5,294,10)", "AllLocalNearRings(343,5,294,11)", 
  "AllLocalNearRings(343,5,294,12)", "AllLocalNearRings(343,5,294,13)", 
  "AllLocalNearRings(343,5,294,14)", "AllLocalNearRings(343,5,294,15)", 
  "AllLocalNearRings(343,5,294,16)", "AllLocalNearRings(343,5,294,17)", 
  "AllLocalNearRings(343,5,294,18)", "AllLocalNearRings(343,5,294,19)", 
  "AllLocalNearRings(343,5,294,23)", "AllLocalNearRings(343,5,342,2)", 
  "AllLocalNearRings(343,5,342,6)" ]
gap> InfoLocalNearRing(U);      
There are 46 local nearrings on this group.     
They are sorted by their multiplicative groups. 
AllLocalNearRings(343,5,294,8)                           (3) 
AllLocalNearRings(343,5,294,9)                           (2) 
AllLocalNearRings(343,5,294,10)                          (4) 
AllLocalNearRings(343,5,294,11)                          (5) 
AllLocalNearRings(343,5,294,12)                          (3) 
AllLocalNearRings(343,5,294,13)                          (5) 
AllLocalNearRings(343,5,294,14)                          (2) 
AllLocalNearRings(343,5,294,15)                          (3) 
AllLocalNearRings(343,5,294,16)                          (3) 
AllLocalNearRings(343,5,294,17)                          (3) 
AllLocalNearRings(343,5,294,18)                          (2) 
AllLocalNearRings(343,5,294,19)                          (2) 
AllLocalNearRings(343,5,294,23)                          (9) 
gap> A:=SmallGroup(361,2);
<pc group of size 361 with 2 generators>
gap> TheLibraryOfLNRsOnGroup(A);
[ "AllLocalNearRings(361,2,342,1)", "AllLocalNearRings(361,2,342,2)", 
  "AllLocalNearRings(361,2,342,4)", "AllLocalNearRings(361,2,342,6)", 
  "AllLocalNearRings(361,2,342,7)", "AllLocalNearRings(361,2,342,8)", 
  "AllLocalNearRings(361,2,360,4)", "AllLocalNearRings(361,2,360,15)" ]
gap> InfoLocalNearRing(A);
There are 21 local nearrings on this group.     
They are sorted by their multiplicative groups. 
AllLocalNearRings(361,2,342,1)                           (2) 
AllLocalNearRings(361,2,342,2)                           (2) 
AllLocalNearRings(361,2,342,4)                           (1) 
AllLocalNearRings(361,2,342,6)                           (1) 
AllLocalNearRings(361,2,342,7)                           (7) 
AllLocalNearRings(361,2,342,8)                           (6) 
AllLocalNearRings(361,2,360,4)                           (1) 
AllLocalNearRings(361,2,360,15)                          (1) 
gap> B:=SmallGroup(1331,5);
<pc group of size 1331 with 3 generators>
gap> TheLibraryOfLNRsOnGroup(B);
[ "AllLocalNearRings(1331,5,1210,8)", "AllLocalNearRings(1331,5,1210,9)", 
  "AllLocalNearRings(1331,5,1210,10)", "AllLocalNearRings(1331,5,1210,11)", 
  "AllLocalNearRings(1331,5,1210,12)", "AllLocalNearRings(1331,5,1210,13)", 
  "AllLocalNearRings(1331,5,1210,14)", "AllLocalNearRings(1331,5,1210,15)", 
  "AllLocalNearRings(1331,5,1210,16)", "AllLocalNearRings(1331,5,1210,17)", 
  "AllLocalNearRings(1331,5,1210,18)", "AllLocalNearRings(1331,5,1210,19)", 
  "AllLocalNearRings(1331,5,1210,20)", "AllLocalNearRings(1331,5,1210,21)", 
  "AllLocalNearRings(1331,5,1210,22)", "AllLocalNearRings(1331,5,1210,23)", 
  "AllLocalNearRings(1331,5,1210,27)" ]
gap> InfoLocalNearRing(B);
There are 96 local nearrings on this group. 
AllLocalNearRings(1331,5,1210,8)                           (5)  
AllLocalNearRings(1331,5,1210,9)                           (7)  
AllLocalNearRings(1331,5,1210,10)                          (4)  
AllLocalNearRings(1331,5,1210,11)                          (7)  
AllLocalNearRings(1331,5,1210,12)                          (5)  
AllLocalNearRings(1331,5,1210,13)                          (5)  
AllLocalNearRings(1331,5,1210,14)                          (5)  
AllLocalNearRings(1331,5,1210,15)                          (9)  
AllLocalNearRings(1331,5,1210,16)                          (6)  
AllLocalNearRings(1331,5,1210,17)                          (4)  
AllLocalNearRings(1331,5,1210,18)                          (5)  
AllLocalNearRings(1331,5,1210,19)                          (5)  
AllLocalNearRings(1331,5,1210,20)                          (3)  
AllLocalNearRings(1331,5,1210,21)                          (9)  
AllLocalNearRings(1331,5,1210,22)                          (2)  
AllLocalNearRings(1331,5,1210,23)                          (2)  
AllLocalNearRings(1331,5,1210,27)                          (13) 


## Each test file should finish with the call of STOP_TEST.
## The argument of STOP_TEST should be the name of the test file.
gap> STOP_TEST( "man-examples.tst" );

#############################################################################
##
#E
