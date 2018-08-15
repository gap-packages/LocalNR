#############################################################################
##
##                                               LocalNR package
##
##  Copyright 2017, Iryna Raievska, 
##                  Maryna Raievska,   
##                  Yaroslav Sysak
## Institute of Mathematics of National Academy of Sciences of Ukraine
##
#############################################################################

###################################
##
#! @Chapter Functions
##
###################################

###################################
##
#! @Section Group functions
##
###################################

#! @Description
#! The argument is a group $G$.
#! The output is <C>true</C> if $G$ is a minimal non-abelian group,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments G
#! @Label 
DeclareProperty( "IsMinimalNonAbelianGroup", IsGroup );

#! Recall that each finite non-abelian group whose proper subgroups are 
#! abelian is called a <Emph>Miller-Moreno group</Emph> or in other terminology 
#! a <Emph>minimal non-abelian group</Emph>.

#! @BeginExample
#! gap> H:=SmallGroup(120,4);       
#! <pc group of size 120 with 5 generators>
#! gap> IsMinimalNonAbelianGroup(H);
#! false
#! gap> K:=SmallGroup(16,6);
#! <pc group of size 16 with 4 generators>
#! gap> IsMinimalNonAbelianGroup(K);
#! true
#! @EndExample

###################################

#! @Description
#! The argument is a group $G$.
#! The output is <C>true</C> if $G$ is a metacyclic $p$-group,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments G
#! @Label 
DeclareProperty( "IsMetacyclicPGroup", IsPGroup );

#! @BeginExample
#! gap> IsMetacyclicPGroup(K);
#! true
#! @EndExample

###################################

#! @Description
#! The argument is a group $G$.
#! The output is 
#! @Returns EndoOrbitsOfGroup
#! @Arguments G
#! @Label 
DeclareOperation( "EndoOrbitsOfGroup", [ IsGroup ] ); 

#! @BeginExample
#! gap> D:=SmallGroup(32,25);   
#! <pc group of size 32 with 5 generators>
#! gap> T:=EndoOrbitsOfGroup(D);
#! [ [ f1, [ <identity> of ..., f1, f1*f5, f2*f3*f5, f2*f3, f2*f3*f4*f5, f2*f3*f4, 
#!          f1*f4*f5, f1*f4, f2, f2*f5, f2*f4, f1*f3*f4*f5, f1*f3*f5, f2*f4*f5, 
#!          f1*f3*f4, f1*f3, f3, f3*f4, f3*f5, f3*f4*f5, f4, f5, f1*f2, f1*f2*f4, 
#!          f1*f2*f5, f1*f2*f4*f5, f4*f5, f1*f2*f3, f1*f2*f3*f4, f1*f2*f3*f5, 
#!          f1*f2*f3*f4*f5 ] ] ]
#! gap>  Size(T[1][2]);
#! 32
#! @EndExample

###################################

#! @Description
#! The argument is a group $G$.
#! The output is <C>true</C> if $G$ is a endocyclic group,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments G
#! @Label 
DeclareProperty( "IsEndoCyclicGroup", IsGroup );

#! @BeginExample
#! gap> IsEndoCyclicGroup(D);
#! true
#! @EndExample

#! @EndSection


###################################
##
#! @Section Nearring functions
##
###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is <C>true</C> if $R$ is a nearring with identity,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments  R
#! @Label 
DeclareAttribute( "UnitsOfNearRing", IsNearRing  );

#! @BeginExample
#! gap> N:=LocalNearRing(32,5,16,3,8);
#! ExplicitMultiplicationNearRing ( <pc group of size 32 with 
#! 5 generators> , multiplication )
#! gap> U:=UnitsOfNearRing(N);
#! [ (f1), (f1*f5), (f1*f4), (f1*f4*f5), (f1*f3), (f1*f3*f5), (f1*f3*f4),  
#!  (f1*f3*f4*f5), (f1*f2), (f1*f2*f5), (f1*f2*f4), (f1*f2*f4*f5), (f1*f2*f3), 
#!  (f1*f2*f3*f5), (f1*f2*f3*f4), (f1*f2*f3*f4*f5) ]
#! gap> Un:=NearRingUnits(N);;
#! U=Un;
#! true
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is <C>true</C> if $R$ is a local nearring,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments R
#! @Label 
DeclareProperty( "IsDistributiveElementOfNearRing",  IsNearRing );

#! @BeginExample
#! gap> 
#! 
#! gap> 
#! 
#! gap> 
#! 
#! gap> 
#!
#! @EndExample

###################################


#! @Description
#! The argument is a nearring $R$.
#! The output is <C>true</C> if $R$ is a local nearring,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments R
#! @Label 
DeclareProperty( "IsLocalNearRing",  IsNearRing );

#! @BeginExample
#! gap> H:=SmallGroup(64,3);
#! <pc group of size 64 with 6 generators>
#! gap> A:= AutomorphismNearRing(H);
#! AutomorphismNearRing( <pc group of size 64 with 6 generators> )
#! gap> Size(A);
#! 2048
#! gap> IsLocalNearRing(A);
#! true
#! @EndExample

###################################

#! @Description
#! The argument is a local nearring $R$.
#! The output is <C>true</C> if $R$ is a local ring,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments R
#! @Label 
DeclareProperty( "IsLocalRing", IsNearRing );

#! @BeginExample
#! gap> L:=AllLocalNearRings(32,3,16,14);;
#! gap> Size(L);                          
#! 55
#! gap> F:=Filtered(L,x->IsLocalRing(x));;
#! gap> Size(F);                          
#! 1
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is the set of non-invertible elements of $R$. 
#! @Returns a set
#! @Arguments R
#! @Label 
DeclareAttribute( "NearRingNonUnits", IsNearRing );

#! @BeginExample
#! gap> T:=LocalNearRing(49,2,42,1,1); 
#! ExplicitMultiplicationNearRing ( <pc group of size 49 with 
#! 2 generators> , multiplication )
#! gap> Nu:=NearRingNonUnits(T);
#! [ (<identity> of ...), (f2), (f2^2), (f2^3), (f2^4), (f2^5), (f2^6) ]
#! gap> Size(Nu);
#! 7
#! @EndExample


###################################

#! @Description
#! The arguments are nearring $R$ with identity and a unit $u$.
#! The output is the inverse element of the unit $u$ of $R$.
#! @Returns an element
#! @Arguments R,u
#! @Label 
DeclareOperation( "InverseUnitOfNearRing", [ IsNearRing, IsNearRingElement ]); 

#! @BeginExample
#! gap> g:=InverseUnitOfNearRing(K,S[4]);
#! (f1*f4*f5)
#! @EndExample

###################################

#! @Description
#! The arguments are a nearring $R$ and generators $gens$ of $R$.
#! The output is the subnearring generated by $gens$.
#! @Returns a subnearring
#! @Arguments  R,gens
#! @Label 
DeclareOperation( "SubNearRingByGenerators", [ IsNearRing, IsNearRingElementCollection ] );

#! @BeginExample
#! gap> B:=LocalNearRing(32,45,16,5,4); 
#! ExplicitMultiplicationNearRing ( <pc group of size 32 with 
#! 5 generators> , multiplication )
#! gap> D:=DistributiveElements(B);
#! [ (<identity> of ...), (f5), (f1*f2*f3*f4), (f1*f2*f3*f4*f5) ]
#! gap> Rs:=SubNearRingByGenerators(B,D);
#! ExplicitMultiplicationNearRing ( Group([ <identity> of ..., f5, 
#! f1*f2*f3*f4,  f1*f2*f3*f4*f5 ]) , multiplication )
#! gap> Size(Rs);
#! 4
#! gap> IsDgNearRing(B);
#! false
#! gap> IsDgNearRing(Rs);
#! true
#! @EndExample

###################################

#! @Description
#! The argument is a local nearring $R$.
#! The output is the additive subgroup of non-units of $R$.
#! @Returns a subgroup 
#! @Arguments  R
#! @Label 
DeclareAttribute( "NonUnitsAsAdditiveSubgroup", IsNearRing );

#! @BeginExample
#! gap> T:=LocalNearRing(32,3,16,14,5);
#! ExplicitMultiplicationNearRing ( <pc group of size 32 with 
#! 5 generators> , multiplication )
#! gap> L:=NonUnitsAsAdditiveSubgroup(T);
#! Group([ <identity> of ..., f2, f3, f4, f5, f2*f3, f2*f4,  
#! f2*f5, f3*f4, f3*f5, f4*f5, f2*f3*f4, f2*f3*f5, f2*f4*f5, 
#! f3*f4*f5, f2*f3*f4*f5 ])
#! gap> IdGroup(L);
#! [ 16, 2 ]
#! @EndExample

###################################

#! @Description
#! The argument is a local nearring $R$.
#! The output is the ideal generated by all non-invertible elements of $R$.
#! @Returns an ideal
#! @Arguments R
#! @Label 
DeclareAttribute( "NonUnitsAsNearRingIdeal",  IsNearRing  );

#! @BeginExample
#! gap> I:=NonUnitsAsNearRingIdeal(T);
#! < nearring ideal >
#! gap> Size(I);
#! 16
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is the multiplicative semigroup of $R$.
#! @Returns a semigroup
#! @Arguments R
#! @Label 
DeclareAttribute( "MultiplicativeSemigroupOfNearRing", IsNearRing );

#! @BeginExample
#! gap> B:=LocalNearRing(32,21,16,2,14); 
#! ExplicitMultiplicationNearRing ( <pc group of size 32 with 
#! 5 generators> , multiplication )
#! gap> M:=MultiplicativeSemigroupOfNearRing(B);
#! <monoid with 32 generators>
#! gap> Size(M);
#! 32
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is the multiplicative semigroup of non-units of $R$.
#! @Returns a semigroup
#! @Arguments R
#! @Label 
DeclareAttribute( "NonUnitsAsMultiplicativeSemigroup", IsNearRing );

#! @BeginExample
#! gap> Nm:=NonUnitsAsMultiplicativeSemigroup(B);
#! <semigroup with 16 generators>
#! gap> Size(Nm);
#! 16
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is <C>true</C> if $R$ is a nearring generated by one element,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments R
#! @Label 
DeclareProperty( "IsOneGeneratedNearRing", IsNearRing );

#! @BeginExample
#! gap> D:=LocalNearRing(32,3,16,3,7);           
#! ExplicitMultiplicationNearRing ( <pc group of size 32 with 
#! 5 generators> , multiplication )
#! gap> IsOneGeneratedNearRing(D);
#! true
#! @EndExample

###################################

#! @Description
#! The arguments are a nearring $R$ with identity and a set of units $Un$ of $R$.
#! The output are the automorphisms associated with nearring units.
#! @Returns automorphisms
#! @Arguments R,Un
#! @Label 
DeclareOperation( "AutomorphismsAssociatedWithNearRingUnits", [ IsNearRing, IsNearRingElementCollection ] );

#! A subgroup $A$ of the automorphism group $Aut R^+$ of the additive group of 
#! the nearring $R$ with identity isomorphic to the multiplicative group $R^*$ 
#! and satisfies the condition $$i^A=\{i^a\mid a\in A\}=R^*$$ is called 
#! the subgroup of $Aut R^+$ associated with the group $R^*$.


#! @BeginExample
#! gap> S:=UnitsOfNearRing(D);
#! [ (f1), (f1*f5), (f1*f4), (f1*f4*f5), (f1*f3), (f1*f3*f5), (f1*f3*f4),  
#!  (f1*f3*f4*f5), (f1*f2), (f1*f2*f5), (f1*f2*f4), (f1*f2*f4*f5), (f1*f2*f3), 
#!  (f1*f2*f3*f5), (f1*f2*f3*f4), (f1*f2*f3*f4*f5) ]
#! gap> AutomorphismsAssociatedWithNearRingUnits(D,S);
#! [ [ f2, f1*f3 ] -> [ f2, f1*f3 ], [ f2, f1*f3 ] -> [ f2, f1*f3*f5 ], 
#!   [ f2, f1*f3 ] -> [ f2, f1*f3*f4 ], [ f2, f1*f3 ] -> [ f2, f1*f3*f4*f5 ], 
#!   [ f2, f1*f3 ] -> [ f2*f4*f5, f1 ], [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f5 ], 
#!   [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f4 ], [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f4*f5 ], 
#!   [ f2, f1*f3 ] -> [ f2, f1*f2*f3 ], [ f2, f1*f3 ] -> [ f2, f1*f2*f3*f5 ], 
#!   [ f2, f1*f3 ] -> [ f2, f1*f2*f3*f4 ], [ f2, f1*f3 ] -> [ f2, f1*f2*f3*f4*f5 ], 
#!   [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f2*f5 ], [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f2 ], 
#!   [ f2, f1*f3 ] -> [ f2*f4*f5, f1*f2*f4*f5 ], [ f2, f1*f3 ] -> [ f2*f4*f5, 
#! f1*f2*f4 ] ]
#! @EndExample

###################################

#! @Description
#! The arguments are a nearring $R$ and a set $Elm$ of nearring elements.
#! The output is the endomorphisms associated with nearring elements.
#! @Returns endomorphisms
#! @Arguments  R,Elm
#! @Label 
DeclareOperation( "EndomorphismsAssociatedWithNearRingElements", [ IsNearRing, IsNearRingElementCollection ] );

#! @BeginExample
#! gap> Nu:=NearRingNonUnits(D);
#! [ (<identity> of ...), (f2), (f3), (f4), (f5), (f2*f3), (f2*f4), (f2*f5), 
#!  (f3*f4), (f3*f5), (f4*f5), (f2*f3*f4), (f2*f3*f5), (f2*f4*f5), (f3*f4*f5),
#!  (f2*f3*f4*f5) ]
#! gap> EndomorphismsAssociatedWithNearRingElements(D,Nu);
#! [ [ f2, f1*f3 ] -> [ <identity> of ..., <identity> of ... ], 
#!   [ f2, f1*f3 ] -> [ f4, f2*f4 ], [ f2, f1*f3 ] -> [ f4*f5, f3*f5 ], 
#!   [ f2, f1*f3 ] -> [ <identity> of ..., f4 ], 
#!   [ f2, f1*f3 ] -> [ <identity> of ..., f5 ], 
#!   [ f2, f1*f3 ] -> [ f4, f2*f3*f4*f5 ], 
#!   [ f2, f1*f3 ] -> [ f4, f2 ], [ f2, f1*f3 ] -> [ f4, f2*f4*f5 ], 
#!   [ f2, f1*f3 ] -> [ f4*f5, f3*f4*f5 ], [ f2, f1*f3 ] -> [ f4*f5, f3 ], 
#!   [ f2, f1*f3 ] -> [ <identity> of ..., f4*f5 ], 
#!   [ f2, f1*f3 ] -> [ f4, f2*f3*f5 ], 
#!   [ f2, f1*f3 ] -> [ f4, f2*f3*f4 ], [ f2, f1*f3 ] -> [ f4, f2*f5 ], 
#!   [ f2, f1*f3 ] -> [ f4*f5, f3*f4 ], [ f2, f1*f3 ] -> [ f4, f2*f3 ] ]
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$ with identity.
#! The output is the semidirect product associated with nearring $R$.
#! @Returns a semidirect product
#! @Arguments R
#! @Label 
DeclareOperation( "SemidirectProductAssociatedWithNearRing", [ IsNearRing ]); 

#! @BeginExample
#! gap> T:=LocalNearRing(125,2,100,8,5); 
#! ExplicitMultiplicationNearRing ( <pc group of size 125 with 
#! 3 generators> , multiplication )
#! gap> SemidirectProductAssociatedWithNearRing(T);
#! <pc group with 7 generators>
#! gap> Size(last);
#! 12500
#! @EndExample

###################################

#! @Description
#! The arguments are a nearring $R$ with identity and 
#! a subgroup $H$ of additive group of $R$.
#! The output is <C>true</C> if $H$ is a constructive subgroup of nearring $R$,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments R,H
#! @Label 
DeclareOperation( "IsCircleSubgroupOfNearRing", [IsNearRing, IsGroup ]);

#! @BeginExample
#! gap> Sg:=Subgroups(GroupReduct(T));;  
#! gap> Size(Sg);
#! 14
#! gap> F:=Filtered(Sg,x->IsCircleSubgroupOfNearRing(T,x)); 
#! [ Group([  ]), Group([ f3 ]), Group([ f3, f2 ]) ]
#! @EndExample

###################################

#! @Description
#! The arguments are a nearring $R$ with identity and 
#! a constructive subgroup $H$ of $R$.
#! The output is the group
#! @Returns a group
#! @Arguments R,H
#! @Label 
DeclareOperation( "FactorizedGroupAssociatedWithCircleSubgroupOfNearRing", [ IsNearRing, IsGroup ]);

#! @BeginExample
#! gap> FG:=FactorizedGroupAssociatedWithCircleSubgroupOfNearRing(T,F[2]);
#! <pc group with 2 generators>
#! gap> IdGroup(FG);
#! [ 25, 2 ]
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is the constant part of nearring $R$.
#! @Returns a constant part 
#! @Arguments  R
#! @Label 
DeclareAttribute("ConstantPartOfNearRing", IsNearRing );

#! @BeginExample
#! gap> H:=LocalNearRing(64,24,32,22,12481);
#! ExplicitMultiplicationNearRing ( <pc group of size 64 with 
#! 6 generators> , multiplication )
#! gap> C:=ConstantPartOfNearRing(H);
#! ExplicitMultiplicationNearRing ( Group([ f2*f3*f5, f2*f3 ]) , multiplication )
#! gap> Size(C);
#! 4
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is the zero-symmetric part of nearring $R$.
#! @Returns a zero-symmetric part
#! @Arguments  R
#! @Label 
DeclareAttribute("ZeroSymmetricPartOfNearRing", IsNearRing );

#! @BeginExample
#! gap> ZeroSymmetricPartOfNearRing(H);
#! ExplicitMultiplicationNearRing ( Group([ f1*f2*f3, f3, f4*f5, f6 ]) , multiplication )
#! gap> Size(last);                    
#! 16
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is the group of units as group of automorphisms $R$.
#! @Returns a group of units
#! @Arguments  R
#! @Label 
DeclareAttribute("GroupOfUnitsAsGroupOfAutomorphisms", IsNearRing );

#! @BeginExample
#! gap> M:=LocalNearRing(32,5,16,3,5); 
#! ExplicitMultiplicationNearRing ( <pc group of size 32 with 
#! 5 generators> , multiplication )
#! gap> GroupOfUnitsAsGroupOfAutomorphisms(M);
#! <group of size 16 with 2 generators>
#! gap> Size(last);
#! 16                  
#! @EndExample


###################################
#! @Description
#! The argument is a nearring $R$ and an element $r$.
#! The output is  <C>true</C> if $r$ is a distributive element of nearring $R$,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments  R, r
#! @Label 
DeclareOperation( "IsDistributiveElementOfNearRing",[ IsNearRing, IsNearRingElement ] );

#! @BeginExample
#! gap> D:=LocalNearRing(49,2,42,6,1); 

#! ExplicitMultiplicationNearRing ( <pc group of size 49 with 
#! 2 generators> , multiplication )
#! gap> h:=List(D);;
#! gap> d:=h[3];
#! (f2^2)
#! gap> IsDistributiveElementOfNearRing(D,d);
#! true
#! @EndExample

###################################
#! @Description
#! The argument is a nearring $R$.
#! The output is <C>true</C> if $R$ is a semidistributive nearring,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments  R
#! @Label 
DeclareProperty( "IsSemiDistributiveNearRing", IsNearRing );

#! @BeginExample
#! gap> N:=LocalNearRing(25,2,20,3,2); 
#! ExplicitMultiplicationNearRing ( <pc group of size 25 with 
#! 2 generators> , multiplication )
#! gap> IsSemiDistributiveNearRing(N);
#! false
#! gap> P:=LocalNearRing(25,1,20,2,1); 
#! ExplicitMultiplicationNearRing ( <pc group of size 25 with 
#! 2 generators> , multiplication )
#! gap> IsSemiDistributiveNearRing(P);
#! true
#! gap> IsDistributiveNearRing(N);
#! true
#! @EndExample

###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is <C>true</C> if $R$ is a nearring with identity,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments  R
#! @Label 
DeclareProperty( "IsNearRingWithIdentity", IsNearRing  );

#! @BeginExample
#! gap> N:=AllLocalNearRings(32,5,16,3)[8];
#! ExplicitMultiplicationNearRing ( <pc group of size 32 with 
#! 5 generators> , multiplication )
#! gap> IsNearRingWithOne(N);
#! false
#! gap> Identity(N);
#! (f1)
#! gap> IsNearRingWithIdentity(N);
#! true
#! @EndExample

##
#! @EndSection
##

DeclareOperation( "IsSubNearRing",[ IsNearRing, IsGroup ] );
