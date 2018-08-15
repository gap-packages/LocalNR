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
#! @Chapter Local nearrings
##
###################################

#! A set $R$ with two binary operations $+$ and $\cdot$ is called 
#! a <Emph>(left) nearring</Emph> if the following statements hold:
#! $ \\ $
#!  1) $(R,+)=R^{+}$ is a (not necessarily abelian) group with neutral element $0$;
#! $ \\ $
#!  2) $(R,\cdot)$ is a semigroup;
#! $ \\ $
#!  3) $x(y+z)=xy+xz$ for all $x$, $y$, $z\in R$.
#! $\\ $
#! $ \\ $
#! If $R$ is a nearring, then the group $R^+$  is called 
#! the <Emph>additive group</Emph> of $R$. 
#! If in addition $0\cdot x=0$, then the nearring $R$ is 
#! called <Emph>zero-symmetric</Emph>, and if the 
#! semigroup $(R,\cdot)$ is a monoid, i.e. it has 
#! an identity element $i$, then  $R$ is 
#! a <Emph>nearring with identity</Emph> $i$. In the 
#! latter case the group $R^*$ of all invertible elements of  
#! the monoid $(R,\cdot)$ is called the <Emph>multiplicative group</Emph> of $R$.   
#! $ \\ $
#! $ \\ $
#! A nearring $R$ with identity is said to be 
#! <Emph>local</Emph> if the set $L=R\setminus R^*$ of all 
#! non-invertible elements of $R$ is a subgroup of $R^{+}$. 
#! $ \\ $
#! $ \\ $
#! It is clear that if $L$ is an 
#! ideal of $R$, then the factor nearring $R/L$ is a <Emph>nearfield</Emph>. For example, 
#! every local ring $R$ is a zero-symmetric local nearring whose 
#! subgroup $L$ coincides 
#! with the Jacobson radical of $R$.

###################################
##
#! @Section The local nearrings library
##
###################################

###################################

#! @Description
#! The argument is $n$. 
#! The output a list of <C>IdGroup</C> of the additive groups 
#! of local nearrings from <C>Library</C> of order $n$.
#! @Returns information
#! @Arguments n
#! @Label 
DeclareGlobalFunction( "TheAdditiveGroupsOfLibraryOfLNRsOfOrder");

#! @BeginExample
#! gap> List(TheAdditiveGroupsOfLibraryOfLNRsOfOrder(81),IdGroup);
#! [ [ 81, 1 ], [ 81, 2 ], [ 81, 3 ], [ 81, 5 ], [ 81, 6 ],  
#!  [ 81, 11 ], [ 81, 12 ], [ 81, 13 ], [ 81, 15 ] ]
#! @EndExample

###################################

#! @Description
#! The argument is a group $G$. 
#! The output a list of the catalogues of local nearrings 
#! from <C>Library</C> on $G$.
#! @Returns information
#! @Arguments G
#! @Label 
DeclareGlobalFunction( "TheLibraryOfLNRsOnGroup");

#! @BeginExample
#! gap> TheLibraryOfLNRsOnGroup(SmallGroup([81,12]));   
#![ "AllLocalNearRings(81,12,54,5)", "AllLocalNearRings(81,12,54,8)", 
#!  "AllLocalNearRings(81,12,54,12)", "AllLocalNearRings(81,12,54,13)", 
#!  "AllLocalNearRings(81,12,72,39)" ]
#! @EndExample

###################################

#! @Description
#! The arguments are $k$, $l$, $m$, $n$, $w$.
#! The output is local nearring from <C>Library</C> without 
#! check. The arguments $k$, $l$, $m$, $n$, $w$ are as above.
#! @Returns a list
#! @Arguments k,l,m,n,w
#! @Label
DeclareOperation( "LocalNearRing", [ IsInt, IsInt, IsInt, IsInt, IsInt ]);

#! @BeginExample
#! gap> L:=LocalNearRing(81,12,54,8,3);
#! ExplicitMultiplicationNearRing ( <pc group of size 81 with 
#! 4 generators> , multiplication )
#! @EndExample

###################################

#! @Description
#! The arguments are $k$, $l$, $m$, $n$.
#! The output are all local nearrings from <C>Library</C> without 
#! check. The arguments $k$, $l$, $m$, $n$ are as above.
#! @Returns a list
#! @Arguments k,l,m,n
#! @Label
DeclareOperation( "AllLocalNearRings", [ IsInt, IsInt, IsInt, IsInt ]);

#! @BeginExample
#! gap> L:=AllLocalNearRings(81,12,54,8);;
#! gap> Size(L);
#! 30
#! @EndExample

###################################

#! @Description
#! The argument is a group $G$. 
#! The output is <C>true</C> if in <C>Library</C> there exists a local nearring 
#! whose additive group is isomorphic to $G$  
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments G
#! @Label 
DeclareGlobalFunction( "IsAdditiveGroupOfLibraryOfLNRs");

#! @BeginExample
#! gap> G:=SmallGroup(361,2);
#! <pc group of size 361 with 2 generators>
#! gap> IsAdditiveGroupOfLibraryOfLNRs(G);
#! true
#! @EndExample

###################################

#! @Description
#! The argument is a group $G$. 
#! The output some information about local nearrings 
#! from <C>Library</C> on $G$.
#! @Returns information
#! @Arguments G
#! @Label 
DeclareGlobalFunction( "InfoLocalNearRing");

#! @BeginExample
#! gap> InfoLocalNearRing(G);
#! There are 21 local nearrings on this group.     
#! They are sorted by their multiplicative groups. 
#! AllLocalNearRings(361,2,342,1)                           (2) 
#! AllLocalNearRings(361,2,342,2)                           (2) 
#! AllLocalNearRings(361,2,342,4)                           (1) 
#! AllLocalNearRings(361,2,342,6)                           (1) 
#! AllLocalNearRings(361,2,342,7)                           (7) 
#! AllLocalNearRings(361,2,342,8)                           (6) 
#! AllLocalNearRings(361,2,360,4)                           (1) 
#! AllLocalNearRings(361,2,360,15)                          (1) 
#! @EndExample
##
#! @EndSection
##
