##
############################################################################
##
# IsMinimalNonAbelianGroup(<G>)
InstallMethod( IsMinimalNonAbelianGroup,
    "Is minimal non-abelian group",
    [ IsGroup ],
  function( G )
  if IsAbelian(G) then 
  return false; 
  else 
  if ForAll( MaximalSubgroups(G), x->IsAbelian(x)) then 
  return true;
  else return false;
  fi;
  fi;
  end);

##
############################################################################
##
# IsMetacyclicPGroup(<G>)
InstallMethod( IsMetacyclicPGroup, 
    "Is metacyclic p-group",
    [ IsPGroup ],
  function(G)
  local p;
    p:=Factors(Size(G))[1];
  if p=2 then 
    if Maximum(List(List(MaximalSubgroups(G),MinimalGeneratingSet),Size))<=2 
    then return true;
    fi;
  else 
    if Size(FactorGroup(G,Agemo(G,p)))<=p^2 then
    return true;
    fi;
  fi;
  return false; 
  end);

##
############################################################################
##
# EndoOrbitsOfGroup(<G>)
InstallMethod( EndoOrbitsOfGroup,
    "Compute endo-orbits of group",
    [ IsGroup ],
  function(G)
  local A, En, F, H, M, Or, T, x, y;
A:=AutomorphismGroup(G);
En:=Endomorphisms(G);
Or:=OrbitsDomain(A,G);
T:=[];
for x in Or do
Add(T,Representative(x));
od;
F:=[];
repeat
M:=Filtered(T,x->Order(x)=Maximum(List(T,Order)));
x:=M[1];
H:=[];
for y in En do
Add(H,x^y);
H:=Unique(H);
od;
Add(F,[x,H]);
T:=Difference(T,H);
until Size(T)=0;
return F;
  end);

##
############################################################################
##
# IsEndoCyclicGroup(<G>)
InstallMethod( IsEndoCyclicGroup,
    "Is endocyclic group",
    [ IsGroup ],        
  function(G)
  local F, h, i, t;
    F:=EndoOrbitsOfGroup(G);
    t:=Size(F);
    h:=[];
  for i in [1..t] do  
  if Size(F[i][2])=Size(G) then Add(h,F[i][2]);fi;
  od;
  if Size(h)>0 then 
  return true;
  else return false;fi;
  end);

##
############################################################################
##
# UnitsOfNearRing(<R>)
InstallMethod( UnitsOfNearRing,
    "Compute all units of nearring",
    true,
    [ IsNearRing ], 0, 
  function(R)
  local A, G, one, x;
  
  one:=Identity(R);
  if one=fail then 
  return Error("no units exist");
  else
  G:=GroupReduct(R);
  A:=AutomorphismGroup(G);
  return Filtered(R,x->x^Size(A)=one);
  fi; 
  end);

##
############################################################################
##
# IsLocalNearRing(<R>)
InstallMethod( IsLocalNearRing,
    "Is local nearring",
	true,
    [ IsNearRing ],   
	0,      
  function( R )
  local L,one,U,V,x,y;
  
  one:=Identity(R);
  U:=UnitsOfNearRing(R);
  L:=Difference(R,U);;
  V:=[];
  for x in L do
  Add(V,one+x);
  od;
  if IsSubset(U,V) then
  return true;  
  else return false;
  fi;
  end);

##
############################################################################
##
# IsDistributiveElementOfNearRing(<R,r>)
InstallMethod( IsDistributiveElementOfNearRing,
    "Is Distributive Element of Nearring",
    [ IsNearRing, IsNearRingElement ], 
          0,
     function(R,r)
     local map, x;
    map:=MappingByFunction(R,R,x->x*r);
  if IsAdditiveGroupHomomorphism(map) then 
  return true; 
  else return false; 
  fi;
 end);

##
############################################################################
##
# IsLocalRing(<R>)
InstallMethod( IsLocalRing,
    "Is local ring",
    [ IsNearRing  ],
          0,
     function( R )
 local elm, G, mg, x, y;
  
  G:=GroupReduct(R);
  mg:=MinimalGeneratingSet(G);
  elm:=[];
  for x in mg do
  Add(elm,AsNearRingElement(R,x));
  od;
  if IsAbelian(G) and IsLocalNearRing(R) and 
  ForAll(elm,y->IsDistributiveElementOfNearRing(R,y))  
  then return true; 
  else return false;
  fi;
 end);
  
##
############################################################################
##
# NearRingNonUnits(<R>)
InstallMethod( NearRingNonUnits,
    "Compute nearring non-units",
    [ IsNearRing ], 
  function(R)
  if Identity(R)=fail then 
  return R; 
  else return 
    Difference(R,UnitsOfNearRing(R)); 
  fi; 
  end);

##
############################################################################
##
# GroupOfUnitsAsGroupOfAutomorphisms(<R>)
InstallMethod( GroupOfUnitsAsGroupOfAutomorphisms,
    "Compute a group isomorphic to the group of units of a nearring",
    [ IsNearRing ], 
  function(R)
  local A, U; 
  if Identity(R)=fail then Error("no units exist");
  else
    U:=UnitsOfNearRing(R);;
    A:=AutomorphismsAssociatedWithNearRingUnits(R,U);;
    A:=AsGroup(A);;
  return A;
  fi;
  end);


##
############################################################################
##
# SubNearRingByGenerators(<R,elm>)
InstallMethod( SubNearRingByGenerators,
    "Compute subnearring by generators",
    [ IsNearRing, IsNearRingElementCollection], 
  function(R,elm)
  local a, b, c, G, M, N, S;      
    G:=GroupReduct(R);  
    S:=SemigroupByGenerators(elm);
    repeat
    M:=[];
    N:=[];
  for a in S do
    Add(M,AsGroupReductElement(a));
  od;
    M:=Subgroup(G,M);
   for b in M do
    Add(N,AsNearRingElement(R,b));
  od;
    S:=SemigroupByGenerators(N);
    until Size(M)=Size(S);
    c:=SubNearRingBySubgroupNC(R,M);
  return c;
  end);

##
############################################################################
##
# NonUnitsAsAdditiveSubgroup(<R>)
InstallMethod( NonUnitsAsAdditiveSubgroup,
    "the additive subgroup of all non-units in local nearring",
    [ IsNearRing ], 
  function(R)
  local a, N, g, L;
  if IsLocalNearRing(R) then
    N:=NearRingNonUnits(R);
    g:=[];
  for a in N do 
    Add(g,AsGroupReductElement(a));
  od; 
    L:=Subgroup(GroupReduct(R),g);
  return L; 
  else return fail;
  fi;
  end);

##
############################################################################
##
# NonUnitsAsNearRingIdeal(<R>)
InstallMethod( NonUnitsAsNearRingIdeal,
    "the maximal ideal in local nearring",
    [ IsNearRing ], 
  function(R)
  local N, S;
  if IsLocalNearRing(R) then
    N:=NonUnitsAsAdditiveSubgroup(R);
    S:=NearRingIdealBySubgroupNC(R,N);
  return S;
  else return fail;
  fi;
  end);

##
############################################################################
##
# MultiplicativeSemigroupOfNearRing(<R>)
InstallMethod( MultiplicativeSemigroupOfNearRing,
    "Multiplicative semigroup of nearring",
    [ IsNearRing ], 
  function(R)
  local a, u;
  if Identity(R)=fail then a:=AsSemigroup(List(R));
else u:=Identity(R);a:=AsSemigroup(List(R));
Print("Semigroup with Identity"," ",u,"\n");
fi;
return a;
  end);


##
############################################################################
##
# NonUnitsAsMultiplicativeSemigroup(<R>)
InstallMethod( NonUnitsAsMultiplicativeSemigroup,
    "the multiplicative semigroup generated by all non-units",
    [ IsNearRing ],
  function(R)
  local M, n, S;
    M:=MultiplicativeSemigroupOfNearRing(R);
    n:=NearRingNonUnits(R); 
    S:=Subsemigroup(M,n);
  return S;
  end);

##
############################################################################
##
# IsOneGeneratedNearRing(<R>)
InstallMethod( IsOneGeneratedNearRing,
    "Is one generated nearring",
    [ IsNearRing ],
  function(R)
  local S, T, U, x;
    S:=SubNearRings(R);
    T:=[];
  for x in S do
  if Size(x)<Size(R) then 
    Add(T,x); fi;
  od;
    U:=Union(T);
  if Size(U)<Size(R) then
  return true; 
  else return false; 
  fi;
  end);

############################################################################
##
# AutomorphismsAssociatedWithNearRingUnits(<R,un>)
InstallMethod( AutomorphismsAssociatedWithNearRingUnits,
    "Automorphisms associated with nearring units", 
    [ IsNearRing, IsNearRingElementCollection ],
  function(R,un)
  local A, Aut, d, G, g, gen, m, mg, r, u, x;
  G:=GroupReduct(R);
  mg:=SmallGeneratingSet(G);
  Aut:=AutomorphismGroup(G);
  m:=Size(Aut);
  if ForAll(un, u->u^m=Identity(R)) then
    A:=[];
  for r in un do
    gen:=[];
  for x in mg do
    d:=AsGroupReductElement(r^(m-1)*AsNearRingElement(R,x));
    Add(gen,d);
  od;
    g:=GroupHomomorphismByImages(G,G,mg,gen);
    Add(A,g);
  od;
  return A;
  else return fail;
  fi;
  end);

##
############################################################################
##
# EndomorphismsAssociatedWithNearRingElements(<R,elm>)
InstallMethod( EndomorphismsAssociatedWithNearRingElements,
    "Endomorphisms associated with nearring elements",
    [ IsNearRing, IsNearRingElementCollection ], 
  function(R,elm)
  local a, d, En, G, g, mg, x, y;
    G:=GroupReduct(R);
    mg:=MinimalGeneratingSet(G);
    En:=[];
  for x in elm do
    a:=[];
  for y in mg do
    d:=AsGroupReductElement(x*AsNearRingElement(R,y));
    Add(a,d);
  od;
    g:=GroupHomomorphismByImages(G,G,mg,a);
    Add(En,g);
  od;
  return En;
  end);

##
############################################################################
##
# SemidirectProductAssociatedWithNearRing(<R>)
InstallMethod( SemidirectProductAssociatedWithNearRing,
    "Semidirect product associated with nearring",
    [ IsNearRing ],
  function(R)  
  local A, S, G, Un;
  if Identity(R)=fail then return fail;
  else 
    G:=GroupReduct(R);
    Un:=UnitsOfNearRing(R);
    A:=AutomorphismsAssociatedWithNearRingUnits(R,Un);
    A:=AsGroup(A);
    S:=SemidirectProduct(A,G);
  return S;
    fi;
  end);

############################################################################
##
#  IsCircleSubgroupOfNearRing        
InstallMethod( IsCircleSubgroupOfNearRing, 
    "Is circle subgroup of nearring",
    [ IsNearRing, IsGroup ],
  function( R, H)
  local a, d, F, G, Un, x;
  if Identity(R)=fail then Error("must be a nearring with one");
  else
    Un:=UnitsOfNearRing(R);
    F:=[];
    a:=AsGroupReductElement(One(R));
  for x in H do
    d:=AsNearRingElement(R,a*x);
    Add(F,d);
  od;
  fi;
  if IsSubset(Un,F) and Size(Unique(ListX(F,F,\*)))=Size(F) then 
  return true;
  else return false;
  fi;
  end);

##
############################################################################
##
#  FactorizedGroupAssociatedWithCircleSubgroupOfNearRing        
InstallMethod(FactorizedGroupAssociatedWithCircleSubgroupOfNearRing, 
    "Factorized group associated with circle subgroup of nearring",
    [ IsNearRing, IsGroup ],
  function( R, H)
  local A, a, S, d, F, x;
  if IsCircleSubgroupOfNearRing(R, H)=true then 
    a:=AsGroupReductElement(One(R));
    F:=[];
  for x in H do
    d:=AsNearRingElement(R,a*x);
    Add(F,d);
  od;
    A:=AutomorphismsAssociatedWithNearRingUnits(R,F);
    A:=AsGroup(A);
    S:=SemidirectProduct(A,H);
  return S;
  else Error("the subgroup of nearring is not circle");
  fi;
  end);

##
############################################################################
##
# ConstantPartOfNearRing(<R>)
InstallMethod( ConstantPartOfNearRing,
    "Constant part of nearring",
    [ IsNearRing ], 
  function(R)
  local g,Rc; 
   g:=EndomorphismsAssociatedWithNearRingElements(R,[Zero(R)])[1];
   Rc:=SubNearRingBySubgroupNC(R,Image(g));
  return Rc;
  end);

##
############################################################################
##
# ZeroSymmetricPartOfNearRing(<R>)
InstallMethod( ZeroSymmetricPartOfNearRing,
    "Zero-symmetric part of nearring",
    [ IsNearRing ], 
  function(R)
  local g,R0; 
   g:=EndomorphismsAssociatedWithNearRingElements(R,[Zero(R)])[1];
   R0:=SubNearRingBySubgroupNC(R,Kernel(g));
  return R0;
  end);

############################################################################
##
#M  IsSemiDistributiveNearRing 

InstallMethod(
	IsSemiDistributiveNearRing,
	"test all elements",
	true,
	[IsNearRing],
	1, # faster in the moment
  function ( nr )
    return ForAll( nr, d -> ForAll( nr, a -> ForAll( nr, b ->
              (a+b+a)*d = (a*d) + (b*d) + (a*d) ) ) );
  end );

##
############################################################################
##
# IsNearRingWithIdentity(<R>)
InstallMethod(IsNearRingWithIdentity,
     "Is nearring with identity",
	true,
     [IsNearRing],
	0,
  function ( R )
  local id;
    id := Identity( R );
  return ( id <> fail );
  end);

##
############################################################################
##
# IsSubNearRing(<R,H>)
InstallMethod( IsSubNearRing,
    "Is the subgroup of the additive group a subnearring",
    [ IsNearRing, IsGroup], 
  function(R,H)
  local a, G, M, S;      
    G:=GroupReduct(R);  
    M:=[];
  if IsSubgroup(G,H)=false then return false;fi;
  for a in H do
    Add(M,AsNearRingElement(R,a));
  od; 
    S:=SemigroupByGenerators(M);
  if Size(H)=Size(S) then  
  return true;fi;
  return false;
  end);

## 
