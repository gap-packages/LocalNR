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

gap> H:=SmallGroup(120,4);       
<pc group of size 120 with 5 generators>
gap> IsMinimalNonAbelianGroup(H);
false
gap> K:=SmallGroup(16,6);
<pc group of size 16 with 4 generators>
gap> IsMinimalNonAbelianGroup(K);
true
gap> IsMetacyclicPGroup(K);
true
gap> D:=SmallGroup(32,25);   
<pc group of size 32 with 5 generators>
gap> T:=EndoOrbitsOfGroup(D);;
gap> Length(T);
1
gap>  Size(T[1][2]);
32
gap> IsEndoCyclicGroup(D);
true
gap> N:=LocalNearRing(32,5,16,3,8);
ExplicitMultiplicationNearRing ( <pc group of size 32 with 
5 generators> , multiplication )
gap> U:=UnitsOfNearRing(N);
[ (f1), (f1*f5), (f1*f4), (f1*f4*f5), (f1*f3), (f1*f3*f5), (f1*f3*f4),  
 (f1*f3*f4*f5), (f1*f2), (f1*f2*f5), (f1*f2*f4), (f1*f2*f4*f5), (f1*f2*f3), 
 (f1*f2*f3*f5), (f1*f2*f3*f4), (f1*f2*f3*f4*f5) ]
gap> Un:=NearRingUnits(N);;
gap> U=Un;
true
gap> H:=SmallGroup(64,3);
<pc group of size 64 with 6 generators>
gap> A:= AutomorphismNearRing(H);
AutomorphismNearRing( <pc group of size 64 with 6 generators> )
gap> Size(A);
2048
gap> IsLocalNearRing(A);
true
gap> L:=AllLocalNearRings(32,3,16,14);;
gap> Size(L);                          
55
gap> F:=Filtered(L,x->IsLocalRing(x));;
gap> Size(F);                          
1
gap> T:=LocalNearRing(49,2,42,1,1); 
ExplicitMultiplicationNearRing ( <pc group of size 49 with 
2 generators> , multiplication )
gap> Nu:=NearRingNonUnits(T);
[ (<identity> of ...), (f2), (f2^2), (f2^3), (f2^4), (f2^5), (f2^6) ]
gap> Size(Nu);
7
gap> g:=InverseUnitOfNearRing(K,S[4]);
(f1*f4*f5)
gap> B:=LocalNearRing(32,45,16,5,4); 
ExplicitMultiplicationNearRing ( <pc group of size 32 with 
5 generators> , multiplication )
gap> D:=DistributiveElements(B);
[ (<identity> of ...), (f5), (f1*f2*f3*f4), (f1*f2*f3*f4*f5) ]
gap> Rs:=SubNearRingByGenerators(B,D);
ExplicitMultiplicationNearRing ( Group([ <identity> of ..., f5, 
f1*f2*f3*f4,  f1*f2*f3*f4*f5 ]) , multiplication )
gap> Size(Rs);
4
gap> IsDgNearRing(B);
false
gap> IsDgNearRing(Rs);
true
gap> T:=LocalNearRing(32,3,16,14,5);
ExplicitMultiplicationNearRing ( <pc group of size 32 with 
5 generators> , multiplication )
gap> L:=NonUnitsAsAdditiveSubgroup(T);
Group([ <identity> of ..., f2, f3, f4, f5, f2*f3, f2*f4,  
f2*f5, f3*f4, f3*f5, f4*f5, f2*f3*f4, f2*f3*f5, f2*f4*f5, 
f3*f4*f5, f2*f3*f4*f5 ])
gap> IdGroup(L);
[ 16, 2 ]
gap> I:=NonUnitsAsNearRingIdeal(T);
< nearring ideal >
gap> Size(I);
16
gap> B:=LocalNearRing(32,21,16,2,14); 
ExplicitMultiplicationNearRing ( <pc group of size 32 with 
5 generators> , multiplication )
gap> M:=MultiplicativeSemigroupOfNearRing(B);
<monoid with 32 generators>
gap> Size(M);
32
gap> Nm:=NonUnitsAsMultiplicativeSemigroup(B);
<semigroup with 16 generators>
gap> Size(Nm);
16
gap> D:=LocalNearRing(32,3,16,3,7);           
ExplicitMultiplicationNearRing ( <pc group of size 32 with 
5 generators> , multiplication )
gap> IsOneGeneratedNearRing(D);
true
gap> S:=UnitsOfNearRing(D);
[ (f1), (f1*f5), (f1*f4), (f1*f4*f5), (f1*f3), (f1*f3*f5), (f1*f3*f4),  
 (f1*f3*f4*f5), (f1*f2), (f1*f2*f5), (f1*f2*f4), (f1*f2*f4*f5), (f1*f2*f3), 
 (f1*f2*f3*f5), (f1*f2*f3*f4), (f1*f2*f3*f4*f5) ]
gap> AutomorphismsAssociatedWithNearRingUnits(D,S);
[ [ f2, f1*f3 ] -> [ f2, f1*f3 ], [ f2, f1*f3 ] -> [ f2, f1*f3*f5 ], 
  [ f2, f1*f3 ] -> [ f2, f1*f3*f4 ], [ f2, f1*f3 ] -> [ f2, f1*f3*f4*f5 ], 
  [ f2, f1*f3 ] -> [ f2*f4*f5, f1 ], [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f5 ], 
  [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f4 ], [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f4*f5 ], 
  [ f2, f1*f3 ] -> [ f2, f1*f2*f3 ], [ f2, f1*f3 ] -> [ f2, f1*f2*f3*f5 ], 
  [ f2, f1*f3 ] -> [ f2, f1*f2*f3*f4 ], [ f2, f1*f3 ] -> [ f2, f1*f2*f3*f4*f5 ], 
  [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f2*f5 ], [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f2 ], 
  [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f2*f4*f5 ], [ f2, f1*f3 ] -> [ f2*f4*f5, 
f1*f2*f4 ] ]
gap> Nu:=NearRingNonUnits(D);
[ (<identity> of ...), (f2), (f3), (f4), (f5), (f2*f3), (f2*f4), (f2*f5), 
 (f3*f4), (f3*f5), (f4*f5), (f2*f3*f4), (f2*f3*f5), (f2*f4*f5), (f3*f4*f5),
 (f2*f3*f4*f5) ]
gap> EndomorphismsAssociatedWithNearRingElements(D,Nu);
[ [ f2, f1*f3 ] -> [ <identity> of ..., <identity> of ... ], 
  [ f2, f1*f3 ] -> [ f4, f2*f4 ], [ f2, f1*f3 ] -> [ f4*f5, f3*f5 ], 
  [ f2, f1*f3 ] -> [ <identity> of ..., f4 ], 
  [ f2, f1*f3 ] -> [ <identity> of ..., f5 ], 
  [ f2, f1*f3 ] -> [ f4, f2*f3*f4*f5 ], 
  [ f2, f1*f3 ] -> [ f4, f2 ], [ f2, f1*f3 ] -> [ f4, f2*f4*f5 ], 
  [ f2, f1*f3 ] -> [ f4*f5, f3*f4*f5 ], [ f2, f1*f3 ] -> [ f4*f5, f3 ], 
  [ f2, f1*f3 ] -> [ <identity> of ..., f4*f5 ], 
  [ f2, f1*f3 ] -> [ f4, f2*f3*f5 ], 
  [ f2, f1*f3 ] -> [ f4, f2*f3*f4 ], [ f2, f1*f3 ] -> [ f4, f2*f5 ], 
  [ f2, f1*f3 ] -> [ f4*f5, f3*f4 ], [ f2, f1*f3 ] -> [ f4, f2*f3 ] ]
gap> T:=LocalNearRing(125,2,100,8,5); 
ExplicitMultiplicationNearRing ( <pc group of size 125 with 
3 generators> , multiplication )
gap> SemidirectProductAssociatedWithNearRing(T);
<pc group with 7 generators>
gap> Size(last);
12500
gap> Sg:=Subgroups(GroupReduct(T));;  
gap> Size(Sg);
14
gap> F:=Filtered(Sg,x->IsCircleSubgroupOfNearRing(T,x)); 
[ Group([  ]), Group([ f3 ]), Group([ f3, f2 ]) ]
gap> FG:=FactorizedGroupAssociatedWithCircleSubgroupOfNearRing(T,F[2]);
<pc group with 2 generators>
gap> IdGroup(FG);
[ 25, 2 ]
gap> H:=LocalNearRing(64,24,32,22,12481);
ExplicitMultiplicationNearRing ( <pc group of size 64 with 
6 generators> , multiplication )
gap> C:=ConstantPartOfNearRing(H);
ExplicitMultiplicationNearRing ( Group([ f2*f3*f5, f2*f3 ]) , multiplication )
gap> Size(C);
4
gap> ZeroSymmetricPartOfNearRing(H);
ExplicitMultiplicationNearRing ( Group([ f1*f2*f3, f3, f4*f5, f6 ]) , multiplication )
gap> Size(last);                    
16
gap> M:=LocalNearRing(32,5,16,3,5); 
ExplicitMultiplicationNearRing ( <pc group of size 32 with 
5 generators> , multiplication )
gap> GroupOfUnitsAsGroupOfAutomorphisms(M);
<group of size 16 with 2 generators>
gap> Size(last);
16 
gap> D:=LocalNearRing(49,2,42,6,1); 
ExplicitMultiplicationNearRing ( <pc group of size 49 with 
2 generators> , multiplication )
gap> h:=List(D);;
gap> d:=h[3];
(f2^2)
gap> IsDistributiveElementOfNearRing(D,d);
true
gap> N:=LocalNearRing(25,2,20,3,2); 
ExplicitMultiplicationNearRing ( <pc group of size 25 with 
2 generators> , multiplication )
gap> IsSemiDistributiveNearRing(N);
false
gap> P:=LocalNearRing(25,1,20,2,1); 
ExplicitMultiplicationNearRing ( <pc group of size 25 with 
2 generators> , multiplication )
gap> IsSemiDistributiveNearRing(P);
true
gap> IsDistributiveNearRing(N);
true
gap> N:=AllLocalNearRings(32,5,16,3)[8];
ExplicitMultiplicationNearRing ( <pc group of size 32 with 
5 generators> , multiplication )
gap> IsNearRingWithOne(N);
false
gap> Identity(N);
(f1)
gap> IsNearRingWithIdentity(N);
true

## Each test file should finish with the call of STOP_TEST.
## The argument of STOP_TEST should be the name of the test file.
gap> STOP_TEST( "man-examples.tst" );

#############################################################################
##
#E
