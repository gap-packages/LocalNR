#############################################################################
##
##                           LocalNR - a GAP package of local nearrings
##
##  Copyright (C) 2019-2026        Yaroslav Sysak with contributions by
##                                      Iryna Raievska, Maryna Raievska
##                  
##  Institute of Mathematics of National Academy of Sciences of Ukraine,
##  Kyiv, Ukraine
##
#############################################################################


###################################
##
#! @Chapter Local nearrings
##
###################################
#! 
#!
#! A set $R$ with two binary operations $+$ and $\cdot$ is called
#! a <Emph>(left) nearring</Emph> if the following statements hold:
#! 
#! <Enum>
#! <Item>
#! $(R,+)=R^+$ is a (not necessarily abelian) group with neutral element $0$;
#! </Item>
#! <Item>
#! $(R,\cdot)$ is a semigroup;
#! </Item>
#! <Item>
#! $x(y+z)=xy+xz$ for all $x$, $y$, $z\in R$.
#! </Item>
#! </Enum>
#! 
#! If $R$ is a nearring, then the group $R^+$  is called
#! the <Emph>additive group</Emph> of $R$.
#! If in addition $0\cdot x=0$, then the nearring $R$ is
#! called <Emph>zero-symmetric</Emph>, and if the
#! semigroup $(R,\cdot)$ is a monoid, i.e. it has
#! an identity element $i$, then  $R$ is
#! a <Emph>nearring with identity</Emph> $i$. In the
#! latter case the group $R^*$ of all invertible elements of  
#! the monoid $(R,\cdot)$ is called the <Emph>multiplicative group</Emph> of $R$.  
#! 
#! The concepts of a subnearring and a nearring homomorphism are defined
#! by the same way as for rings. In particular,
#! if $\lambda$ is a nearring homomorphism of $(R,+, \cdot)$,
#! then its kernel $Ker \lambda$ is a subnearring of $(R,+, \cdot)$
#! whose additive subgroup is normal in $R^+$.
#! 
#! A subnearring $I$ of $(R,+, \cdot)$ is an ideal
#! of $(R,+, \cdot)$ if $I = Ker \lambda$  for some $\lambda$.
#! 
#! It can simply be verified that $I$ is an ideal of $R$
#! if and only if its additive group $I^+$ is a normal subgroup
#! of $R^+$ and for any elements $r$, $s\in R$ and $a\in I$
#! the inclusions $ra\in I$ and
#! $(r + a)s − rs\in I$ hold.
#! Main results accumulated for local nearrings
#! can be found in the surveys
#!  <Cite Key="MR2799412"/> and <Cite Key="MR4943879"/>. 
#!
#! A nearring $R$ with identity is said to be
#! <Emph>local</Emph> if the set $L=R\setminus R^*$ of all
#! non-invertible elements of $R$ is a subgroup of $R^+$.
#! 
#! It is clear that if $L$ is an
#! ideal of $R$, then the factor nearring $R/L$ is a <Emph>nearfield</Emph>. For example,
#! every local ring $R$ is a zero-symmetric local nearring whose
#! subgroup $L$ coincides
#! with the Jacobson radical of $R$. Reference: 
#!  <Cite Key="MR230773"/>. 
###################################
##
#! @Section The local nearrings library
##
###################################

###################################

#! @Description
#! The argument is $n$.
#! The output is a list of additive groups of local nearrings in the
#! library of this package of order $n$.
#! @Returns a list
#! @Arguments n
#! @Label 
DeclareGlobalFunction( "AdditiveGroupsOfLibraryOfLNRsOfOrder");

#! @BeginExample
#! gap> List(AdditiveGroupsOfLibraryOfLNRsOfOrder(81),IdGroup);
#! [ [ 81, 1 ], [ 81, 2 ], [ 81, 3 ], [ 81, 5 ], [ 81, 6 ], [ 81, 11 ], 
#!   [ 81, 12 ], [ 81, 13 ], [ 81, 15 ] ]
#! @EndExample

###################################

#! @Description
#! The argument is a group $G$.
#! The output is a list of catalogue entries for the local nearrings in
#! the library of this package whose additive group is isomorphic to $G$.
#! @Returns a list
#! @Arguments G
#! @Label 
DeclareGlobalFunction( "LibraryOfLNRsOnGroup");

#! The local nearrings are sorted by their multiplicative groups.


#! @BeginExample
#! gap> G:=SmallGroup(81,2);
#! <pc group of size 81 with 4 generators>
#! gap> LibraryOfLNRsOnGroup(G);
#! [ "AllLocalNearRings(81,2,54,3)", "AllLocalNearRings(81,2,54,6)", 
#!   "AllLocalNearRings(81,2,54,9)", "AllLocalNearRings(81,2,54,10)", 
#!   "AllLocalNearRings(81,2,54,11)", "AllLocalNearRings(81,2,54,15)", 
#!   "AllLocalNearRings(81,2,72,14)", "AllLocalNearRings(81,2,72,19)", 
#!   "AllLocalNearRings(81,2,72,24)", "AllLocalNearRings(81,2,72,26)" ]
#! @EndExample

###################################

#! @Description
#! The arguments are $k$, $l$, $m$, $n$, $w$.
#! The output is the $w$-th local nearring from the library of this
#! package whose additive group has <C>IdGroup</C> value <C>[k,l]</C>
#! and whose multiplicative group has <C>IdGroup</C> value <C>[m,n]</C>.
#! No validation of the arguments is performed.
#! @Returns a nearring
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
#! The output is the list of all local nearrings from the library of this
#! package whose additive group has <C>IdGroup</C> value <C>[k,l]</C>
#! and whose multiplicative group has <C>IdGroup</C> value <C>[m,n]</C>.
#! No validation of the arguments is performed.
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
#! The arguments are $k$, $l$, $m$, $n$.
#! The output is the number of local nearrings in the library of this
#! package whose additive group has <C>IdGroup</C> value <C>[k,l]</C>
#! and whose multiplicative group has <C>IdGroup</C> value <C>[m,n]</C>.
#! No validation of the arguments is performed.
#! @Returns a number
#! @Arguments k,l,m,n
#! @Label
DeclareOperation( "NumberLocalNearRings", [ IsInt, IsInt, IsInt, IsInt ]);

#! @BeginExample
#! gap> NumberLocalNearRings(81,15,54,8);
#! 10
#! @EndExample

DeclareSynonym("NrLocalNearRings", NumberLocalNearRings);

###################################

#! @Description
#! The argument is a group $G$.
#! The output is <C>true</C> if the library of this package contains a
#! local nearring whose additive group is isomorphic to $G$, and
#! <C>false</C> otherwise.
#! @Returns a boolean
#! @Arguments G
#! @Label 
DeclareGlobalFunction( "IsAdditiveGroupOfLibraryOfLNRs");

#! @BeginExample
#! gap> G:=SmallGroup(25,2);
#! <pc group of size 25 with 2 generators>
#! gap> IsAdditiveGroupOfLibraryOfLNRs(G);
#! true
#! gap> IsAdditiveGroupOfLibraryOfLNRs(SmallGroup(81,14));
#! false
#! @EndExample

###################################

#! @Description
#! The argument is a group $G$.
#! The output is summary information about the local nearrings in the
#! library of this package whose additive group is isomorphic to $G$.
#! @Returns information
#! @Arguments G
#! @Label 
DeclareGlobalFunction( "InfoLocalNearRing");

#! @BeginExample
#! gap> InfoLocalNearRing(SmallGroup(361,2));
#! The local nearrings are sorted by their multiplicative groups.
#! [ "AllLocalNearRings(361,2,342,1) (2)", "AllLocalNearRings(361,2,342,2) (2)", \
#! "AllLocalNearRings(361,2,342,4) (1)",
#!   "AllLocalNearRings(361,2,342,6) (1)", "AllLocalNearRings(361,2,342,7) (7)",\
#!  "AllLocalNearRings(361,2,342,8) (6)",
#!   "AllLocalNearRings(361,2,360,4) (1)", "AllLocalNearRings(361,2,360,15) (1)"\
#!  ]
#! @EndExample
##
