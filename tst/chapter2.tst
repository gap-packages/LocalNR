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
gap> Q:=SmallGroup(16,8);
<pc group of size 16 with 4 generators>
gap> IsMinimalNonAbelianGroup(Q);
false
gap> S:=SmallGroup(81,4);
<pc group of size 81 with 4 generators>
gap> IsMetacyclicPGroup(S);
true
gap> IsMetacyclicPGroup(SmallGroup(81,15));
false
gap> D:=SmallGroup(81,2); 
<pc group of size 81 with 4 generators>
gap> T:=EndoOrbitsOfGroup(D);;
gap> Length(T);
1
gap> Size(T[1][2]);
81
gap> IsEndoCyclicGroup(D);
true
gap> N:=LocalNearRing(49,2,42,2,2);
ExplicitMultiplicationNearRing ( <pc group of size 49 with 2 generators> , multiplication )
gap> U:=UnitsOfNearRing(N);
[ (f1), (f1*f2), (f1*f2^2), (f1*f2^3), (f1*f2^4), (f1*f2^5), (f1*f2^6), (f1^2), (f1^2*f2), 
  (f1^2*f2^2), (f1^2*f2^3), (f1^2*f2^4), (f1^2*f2^5), (f1^2*f2^6), (f1^3), (f1^3*f2), 
  (f1^3*f2^2), (f1^3*f2^3), (f1^3*f2^4), (f1^3*f2^5), (f1^3*f2^6), (f1^4), (f1^4*f2), 
  (f1^4*f2^2), (f1^4*f2^3), (f1^4*f2^4), (f1^4*f2^5), (f1^4*f2^6), (f1^5), (f1^5*f2), 
  (f1^5*f2^2), (f1^5*f2^3), (f1^5*f2^4), (f1^5*f2^5), (f1^5*f2^6), (f1^6), (f1^6*f2), 
  (f1^6*f2^2), (f1^6*f2^3), (f1^6*f2^4), (f1^6*f2^5), (f1^6*f2^6) ]
gap> Un:=NearRingUnits(N);;
gap> U=Un;
true
gap> H:=SmallGroup(16,6);
<pc group of size 16 with 4 generators>
gap> A:= AutomorphismNearRing(H);
AutomorphismNearRing( <pc group of size 16 with 4 generators> )
gap>  Size(A);
64
gap> IsLocalNearRing(A);
true
gap> K:=LibraryNearRingWithOne(SmallGroup(8,2),1);  
#I  using isomorphic copy of the group
LibraryNearRing(8/2, 814)
gap> IsLocalNearRing(K);
false
gap> L:=AllLocalNearRings(16,14,8,4);;
gap> Size(L);
24
gap> F:=Filtered(L,x->IsLocalRing(x));
[ ExplicitMultiplicationNearRing ( <pc group of size 16 with 4 generators> , multiplication ) ]
gap> T:=LocalNearRing(49,2,42,1,1); 
ExplicitMultiplicationNearRing ( <pc group of size 49 with 
2 generators> , multiplication )
gap> Nu:=NearRingNonUnits(T);
[ (<identity> of ...), (f2), (f2^2), (f2^3), (f2^4), (f2^5), (f2^6) ]
gap> Size(Nu);
7
gap> R:=LibraryNearRing(SmallGroup(8,4),3);
#I  using isomorphic copy of the group
LibraryNearRing(8/5, 3)
gap> N:=NearRingNonUnits(R);;
gap> Size(N);
8
gap> B:=LocalNearRing(25,2,20,3,1); 
ExplicitMultiplicationNearRing ( <pc group of size 25 with 2 generators> , multiplication )
gap> D:=DistributiveElements(B);
[ (<identity> of ...), (f1), (f1^2), (f1^3), (f1^4) ]
gap> Size(D);
5
gap> Rs:=SubNearRingByGenerators(B,D);
ExplicitMultiplicationNearRing ( Group([ <identity> of ..., f1, f1^2, f1^3, f1^4 ]) , multiplication )
gap> Size(Rs);
5
gap> IsDgNearRing(B);
false
gap> IsDgNearRing(Rs);
true
gap> T:=LocalNearRing(125,4,100,9,1); 
ExplicitMultiplicationNearRing ( <pc group of size 125 with 
3 generators> , multiplication )
gap> L:=NonUnitsAsAdditiveSubgroup(T);
Group([ <identity> of ..., f2, f3, f2^2, f2*f3, f3^2, f2^3, f2^2*f3, f2*f3^2, f3^3, f2^4, 
  f2^3*f3, f2^2*f3^2, f2*f3^3, f3^4, f2^4*f3, f2^3*f3^2, f2^2*f3^3, f2*f3^4, f2^4*f3^2, 
  f2^3*f3^3, f2^2*f3^4, f2^4*f3^3, f2^3*f3^4, f2^4*f3^4 ])
gap> IdGroup(L);
[ 25, 2 ]
gap> I:=NonUnitsAsNearRingIdeal(T);
< nearring ideal >
gap> Size(I);
25
gap> B:=LocalNearRing(16,10,8,2,7);;
gap> M:=MultiplicativeSemigroupOfNearRing(B);
Semigroup with identity (f1)
<semigroup of size 16, with 7 generators>
gap> Size(M);
16
gap> Nm:=NonUnitsAsMultiplicativeSemigroup(B);
<semigroup with 8 generators>
gap> Size(Nm);
8
gap> D:=LocalNearRing(49,2,42,4,1);
ExplicitMultiplicationNearRing ( <pc group of size 49 with 2 generators> , multiplication )
gap> IsOneGeneratedNearRing(D);
true
gap> H:=LocalNearRing(16,14,8,2,3);   
ExplicitMultiplicationNearRing ( <pc group of size 16 with 
4 generators> , multiplication )
gap> IsOneGeneratedNearRing(H);    
false
gap> S:=UnitsOfNearRing(D);
[ (f1), (f1*f2), (f1*f2^2), (f1*f2^3), (f1*f2^4), (f1*f2^5), (f1*f2^6), (f1^2), (f1^2*f2), 
  (f1^2*f2^2), (f1^2*f2^3), (f1^2*f2^4), (f1^2*f2^5), (f1^2*f2^6), (f1^3), (f1^3*f2), 
  (f1^3*f2^2), (f1^3*f2^3), (f1^3*f2^4), (f1^3*f2^5), (f1^3*f2^6), (f1^4), (f1^4*f2), 
  (f1^4*f2^2), (f1^4*f2^3), (f1^4*f2^4), (f1^4*f2^5), (f1^4*f2^6), (f1^5), (f1^5*f2), 
  (f1^5*f2^2), (f1^5*f2^3), (f1^5*f2^4), (f1^5*f2^5), (f1^5*f2^6), (f1^6), (f1^6*f2), 
  (f1^6*f2^2), (f1^6*f2^3), (f1^6*f2^4), (f1^6*f2^5), (f1^6*f2^6) ]
gap> A:=AutomorphismsAssociatedWithNearRingUnits(D,S);;
gap> Size(A);
42
gap> Nu:=NearRingNonUnits(D);
[ (<identity> of ...), (f2), (f2^2), (f2^3), (f2^4), (f2^5), (f2^6) ]
gap> En:=EndomorphismsAssociatedWithNearRingElements(D,Nu);;
gap> Size(En);
7
gap> T:=LocalNearRing(25,2,20,2,1);             
ExplicitMultiplicationNearRing ( <pc group of size 25 with 2 generators> , multiplication )
gap> SemidirectProductAssociatedWithNearRing(T);
<pc group with 5 generators>
gap> Size(last);
500
gap> Sg:=Subgroups(GroupReduct(T));;
gap> Size(Sg);
8
gap> F:=Filtered(Sg,x->IsCircleSubgroupOfNearRing(T,x));
[ Group([  ]), Group([ f2 ]) ]
gap> FG:=FactorizedGroupAssociatedWithCircleSubgroupOfNearRing(T,F[2]);
<pc group with 2 generators>
gap> IdGroup(FG);
[ 25, 2 ]
gap> H:=LocalNearRing(361,2,342,7,7);
ExplicitMultiplicationNearRing ( <pc group of size 361 with 
2 generators> , multiplication )
gap> C:=ConstantPartOfNearRing(H);;
gap> Size(C);
19
gap> ZeroSymmetricPartOfNearRing(H);;
gap> Size(last);
19
gap> M:=LocalNearRing(27,4,18,3,2);  
ExplicitMultiplicationNearRing ( <pc group of size 27 with 3 generators> , multiplication )
gap> GroupOfUnitsAsGroupOfAutomorphisms(M);
<group of size 18 with 2 generators>
gap> Size(last);
18
gap> D:=LocalNearRing(49,2,42,6,1); 
ExplicitMultiplicationNearRing ( <pc group of size 49 with 
2 generators> , multiplication )
gap> h:=List(D);;
gap> d:=h[3];
(f2^2)
gap> IsDistributiveElementOfNearRing(D,d);
true
gap> N:=LocalNearRing(16,10,8,2,7); 
ExplicitMultiplicationNearRing ( <pc group of size 16 with 4 generators> , multiplication )
gap> IsSemiDistributiveNearRing(N);
true
gap> N:=LocalNearRing(343,5,294,8,2);    
ExplicitMultiplicationNearRing ( <pc group of size 343 with 
3 generators> , multiplication )
gap> IsNearRingWithOne(N);
false
gap> Identity(N);
(f1)
gap> IsNearRingWithIdentity(N);
true
gap> T:=LocalNearRing(49,2,42,1,2);        
ExplicitMultiplicationNearRing ( <pc group of size 49 with 
2 generators> , multiplication )
gap> G:=GroupReduct(T);                    
<pc group of size 49 with 2 generators>
gap> S:=Subgroups(G);;
gap> Size(S);
10
gap> IsSubNearRing(T,S[3]);
true
gap> IsSubNearRing(T,S[9]); 
false
gap> D:=SmallGroup(7,1);;
gap> IsSubNearRing(T,D);   
false

## Each test file should finish with the call of STOP_TEST.
## The argument of STOP_TEST should be the name of the test file.
gap> STOP_TEST( "man-examples.tst" );

#############################################################################
##
#E
