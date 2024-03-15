#############################################################################
##
##                            LocalNR - a GAP package of local nearrings
##
##  Copyright 2019,                Yaroslav Sysak with contributions by
##                                      Iryna Raievska, Maryna Raievska
##         
##  Institute of Mathematics of National Academy of Sciences of Ukraine
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
#! gap> IsMinimalNonAbelianGroup(SmallGroup(16,8));
#! false
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
#! gap> IsMetacyclicPGroup(SmallGroup(81,4));
#! true
#! gap> IsMetacyclicPGroup(SmallGroup(81,15));
#! false
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
#! gap> D:=SmallGroup(81,2); 
#! <pc group of size 81 with 4 generators>
#! gap> T:=EndoOrbitsOfGroup(D);;
#! gap> Length(T);
#! 1
#! gap> Size(T[1][2]);
#! 81
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

#!Let $G$ be a group and $End G$ be the set of all its endomorphisms, 
#!which can be considered as a semigroup with respect to the composition operation of endomorphisms. 
#!For each $g\in G$ we denote by $g^{End G}$ the set $\{g^\alpha| \alpha\in End G\}$ 
#!of all images of the element $g$ with respect to endomorphisms of $End G$.

#!A group $G$ is called <Emph>endocyclic</Emph> if it contains an element $g$ with $G=g^{End G}$.

#! @BeginExample
#! gap> IsEndoCyclicGroup(D);
#! true
#! @EndExample


###################################
##
#! @Section Nearring functions
##
###################################

#! @Description
#! The argument is a nearring $R$.
#! The output is <C>true</C> if $R$ is a nearring with identity,
#! otherwise the output is <C>Error, no units exist</C>.
#! @Returns a set
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
DeclareProperty( "IsLocalNearRing",  IsNearRing );

#! @BeginExample
#! gap> H:=SmallGroup(16,6);
#! <pc group of size 16 with 4 generators>
#! gap> A:= AutomorphismNearRing(H);
#! AutomorphismNearRing( <pc group of size 16 with 4 generators> )
#! gap>  Size(A);
#! 64
#! gap> IsLocalNearRing(A);
#! true
#! gap> K:=LibraryNearRingWithOne(SmallGroup(8,2),1);  
#! #I  using isomorphic copy of the group
#! LibraryNearRing(8/2, 814)
#! gap> IsLocalNearRing(K);
#! false
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
#! gap> L:=AllLocalNearRings(16,14,8,4);;
#! gap> Size(L);
#! 24
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
#! gap> R:=LibraryNearRing(SmallGroup(8,4),3);
#! #I  using isomorphic copy of the group
#! LibraryNearRing(8/5, 3)
#! gap> N:=NearRingNonUnits(R); 
#! [ (()), ((1,2,3,4)(5,6,7,8)), ((1,3)(2,4)(5,7)(6,8)), ((1,4,3,2)(5,8,7,6)), 
#!   ((1,5,3,7)(2,8,4,6)), ((1,6,3,8)(2,5,4,7)), ((1,7,3,5)(2,6,4,8)), 
#!   ((1,8,3,6)(2,7,4,5)) ]
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
#! gap> B:=LocalNearRing(25,2,20,3,1); 
#! ExplicitMultiplicationNearRing ( <pc group of size 25 with 2 generators> , multiplication )
#! gap> D:=DistributiveElements(B);;
#! gap> Size(D);
#! 5
#! gap> Rs:=SubNearRingByGenerators(B,D);;
#! gap> Size(Rs);
#! 5
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
#! gap> T:=LocalNearRing(125,4,100,9,1); 
#! ExplicitMultiplicationNearRing ( <pc group of size 125 with 
#! 3 generators> , multiplication )
#! gap> L:=NonUnitsAsAdditiveSubgroup(T);
#! Group([ <identity> of ..., f2, f3, f2^2, f2*f3, f3^2, f2^3, f2^2*f3, f2*f3^2, f3^3, f2^4, 
#!   f2^3*f3, f2^2*f3^2, f2*f3^3, f3^4, f2^4*f3, f2^3*f3^2, f2^2*f3^3, f2*f3^4, f2^4*f3^2, 
#!   f2^3*f3^3, f2^2*f3^4, f2^4*f3^3, f2^3*f3^4, f2^4*f3^4 ])
#! gap> IdGroup(L);
#! [ 25, 2 ]
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
#! 25
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
#! gap> B:=LocalNearRing(16,10,8,2,7);          
#! ExplicitMultiplicationNearRing ( <pc group of size 16 with 4 generators> , multiplication )
#! gap> M:=MultiplicativeSemigroupOfNearRing(B);
#! Semigroup with identity (f1)
#! <semigroup of size 16, with 7 generators>
#! gap> Size(M);
#! 16
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
#! <semigroup with 8 generators>
#! gap> Size(Nm);
#! 8
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
#! gap> D:=LocalNearRing(49,2,42,4,1);
#! ExplicitMultiplicationNearRing ( <pc group of size 49 with 2 generators> , multiplication )
#! gap> IsOneGeneratedNearRing(D);
#! true
#! gap> H:=LocalNearRing(16,14,8,2,3);   
#! ExplicitMultiplicationNearRing ( <pc group of size 16 with 
#! 4 generators> , multiplication )
#! gap> IsOneGeneratedNearRing(H);    
#! false
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
#! [ (f1), (f1*f2), (f1*f2^2), (f1*f2^3), (f1*f2^4), (f1*f2^5), (f1*f2^6), (f1^2), (f1^2*f2), 
#!   (f1^2*f2^2), (f1^2*f2^3), (f1^2*f2^4), (f1^2*f2^5), (f1^2*f2^6), (f1^3), (f1^3*f2), 
#!   (f1^3*f2^2), (f1^3*f2^3), (f1^3*f2^4), (f1^3*f2^5), (f1^3*f2^6), (f1^4), (f1^4*f2), 
#!   (f1^4*f2^2), (f1^4*f2^3), (f1^4*f2^4), (f1^4*f2^5), (f1^4*f2^6), (f1^5), (f1^5*f2), 
#!   (f1^5*f2^2), (f1^5*f2^3), (f1^5*f2^4), (f1^5*f2^5), (f1^5*f2^6), (f1^6), (f1^6*f2), 
#!   (f1^6*f2^2), (f1^6*f2^3), (f1^6*f2^4), (f1^6*f2^5), (f1^6*f2^6) ]
#! gap> A:=AutomorphismsAssociatedWithNearRingUnits(D,S);;
#! gap> Size(A);
#! 42
#! @EndExample

###################################

#! @Description
#! The arguments are a nearring $R$ and a set $Elm$ of nearring elements.
#! The output is the endomorphisms associated with nearring elements.
#! @Returns endomorphisms
#! @Arguments  R, Elm
#! @Label 
DeclareOperation( "EndomorphismsAssociatedWithNearRingElements", [ IsNearRing, IsNearRingElementCollection ] );

#! @BeginExample
#! gap> Nu:=NearRingNonUnits(D);
#! [ (<identity> of ...), (f2), (f2^2), (f2^3), (f2^4), (f2^5), (f2^6) ]
#! gap> En:=EndomorphismsAssociatedWithNearRingElements(D,Nu);;
#! gap> Size(En);
#! 7
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
#! gap> T:=LocalNearRing(25,2,20,2,1);             
#! ExplicitMultiplicationNearRing ( <pc group of size 25 with 2 generators> , multiplication )
#! gap> SemidirectProductAssociatedWithNearRing(T);
#! <pc group with 5 generators>
#! gap> Size(last);
#! 500
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
#! 8
#! gap> F:=Filtered(Sg,x->IsCircleSubgroupOfNearRing(T,x));
#! [ Group([  ]), Group([ f2 ]) ]
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
#! gap> H:=LocalNearRing(361,2,342,7,7);
#! ExplicitMultiplicationNearRing ( <pc group of size 361 with 
#! 2 generators> , multiplication )
#! gap> C:=ConstantPartOfNearRing(H);;
#! gap> Size(C);
#! 19
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
#! gap> ZeroSymmetricPartOfNearRing(H);;
#! gap> Size(last);
#! 19
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
#! gap> M:=LocalNearRing(27,4,18,3,2);  
#! ExplicitMultiplicationNearRing ( <pc group of size 27 with 3 generators> , multiplication )
#! gap> GroupOfUnitsAsGroupOfAutomorphisms(M);
#! <group of size 18 with 2 generators>
#! gap> Size(last);
#! 18                
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
#! gap> N:=LocalNearRing(16,10,8,2,7); 
#! ExplicitMultiplicationNearRing ( <pc group of size 16 with 4 generators> , multiplication )
#! gap> IsSemiDistributiveNearRing(N);
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
#! gap> N:=LocalNearRing(343,5,294,8,2);    
#! ExplicitMultiplicationNearRing ( <pc group of size 343 with 
#! 3 generators> , multiplication )
#! gap> IsNearRingWithOne(N);
#! false
#! gap> Identity(N);
#! (f1)
#! gap> IsNearRingWithIdentity(N);
#! true
#! @EndExample

###################################

#! @Description
#! The arguments are a nearring $R$ with identity and 
#! a subgroup $H$ of the additive group of $R$.
#! The output is <C>true</C> if $H$ is the additive group of a subnearring of $R$,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments R,H
#! @Label 
DeclareOperation( "IsSubNearRing",[ IsNearRing, IsGroup ] );

#! @BeginExample
#! gap> T:=LocalNearRing(49,2,42,1,2);        
#! ExplicitMultiplicationNearRing ( <pc group of size 49 with 
#! 2 generators> , multiplication )
#! gap> G:=GroupReduct(T);                    
#! <pc group of size 49 with 2 generators>
#! gap> S:=Subgroups(G);;
#! gap> Size(S);
#! 10
#! gap> IsSubNearRing(T,S[3]);
#! true
#! gap> IsSubNearRing(T,S[9]); 
#! false
#! gap> D:=SmallGroup(7,1);
#! <pc group of size 7 with 1 generators>
#! gap> IsSubNearRing(T,D);   
#! false
#! @EndExample
