##
############################################################################
##
# IsMinimalNonAbelianGroup(<G>)
InstallMethod( IsMinimalNonAbelianGroup,
    "Is minimal non-abelian group",
    [ IsGroup ],
    function( G )
      return not IsAbelian( G ) and ForAll( MaximalSubgroups( G ), IsAbelian );
    end );

##
############################################################################
##
# IsMetacyclicPGroup(<G>)
InstallMethod( IsMetacyclicPGroup,
    "Is metacyclic p-group",
    [ IsPGroup ],
    function( G )
      local p;

      p := Factors( Size( G ) )[1];
      if p = 2 then
        if Maximum( List( List( MaximalSubgroups( G ), MinimalGeneratingSet ), Size ) ) <= 2
        then
          return true;
        fi;
      else
        if Size( FactorGroup( G, Agemo( G, p ) ) ) <= p^2 then
          return true;
        fi;
      fi;
      return false;
    end );

##
############################################################################
##
# EndoOrbitsOfGroup(<G>)
InstallMethod( EndoOrbitsOfGroup,
    "Compute endo-orbits of group",
    [ IsGroup ],
    function( G )
      local A, En, F, H, M, Or, T, x, y;

      A := AutomorphismGroup( G );
      En := Endomorphisms( G );
      Or := OrbitsDomain( A, G );
      T := List( Or, Representative );
      F := [];
      repeat
        M := Filtered( T, x -> Order( x ) = Maximum( List( T, Order ) ) );
        x := M[1];
        H := Set( En, y -> x^y );
        Add( F, [ x, H ] );
        T := Difference( T, H );
      until Size( T ) = 0;
      return F;
    end );

##
############################################################################
##
# IsEndoCyclicGroup(<G>)
InstallMethod( IsEndoCyclicGroup,
    "Is endocyclic group",
    [ IsGroup ],
    function( G )
      local F, h, i, t;

      F := EndoOrbitsOfGroup( G );
      t := Size( F );
      h := [];
      for i in [1..t] do
        if Size( F[i][2] ) = Size( G ) then
          Add( h, F[i][2] );
        fi;
      od;
      return Size( h ) > 0;
    end );

##
############################################################################
##
# UnitsOfNearRing(<R>)
InstallMethod( UnitsOfNearRing,
    "Compute all units of nearring",
    [ IsNearRing ], 0,
    function( R )
      local A, G, one, x;

      if not IsNearRingWithIdentity( R ) then
        return [];
      else
        G := GroupReduct( R );
        A := AutomorphismGroup( G );
        one := Identity( R );
        return Filtered( R, x -> x^Size( A ) = one );
      fi;
    end );

##
############################################################################
##
# IsLocalNearRing(<R>)
InstallMethod( IsLocalNearRing,
    "Is local nearring",
    [ IsNearRing ],
    0,
    function( R )
      local L, one, U, V, x, y;

      one := Identity( R );
      U := UnitsOfNearRing( R );
      L := Difference( R, U );;
      V := List( L, x -> one + x );
      return IsSubset( U, V );
    end );

##
############################################################################
##
# IsDistributiveElementOfNearRing(<R,r>)
InstallMethod( IsDistributiveElementOfNearRing,
    "Is Distributive Element of Nearring",
    [ IsNearRing, IsNearRingElement ],
    0,
    function( R, r )
      local map;

      map := MappingByFunction( R, R, x -> x * r );
      return IsAdditiveGroupHomomorphism( map );
    end );

##
############################################################################
##
# IsLocalRing(<R>)
InstallMethod( IsLocalRing,
    "Is local ring",
    [ IsNearRing ],
    0,
    function( R )
      local elm, G, mg, x, y;

      G := GroupReduct( R );
      mg := MinimalGeneratingSet( G );
      elm := List( mg, x -> AsNearRingElement( R, x ) );
      return IsAbelian( G ) and IsLocalNearRing( R ) and
         ForAll( elm, y -> IsDistributiveElementOfNearRing( R, y ) );
    end );
  
##
############################################################################
##
# NearRingNonUnits(<R>)
InstallMethod( NearRingNonUnits,
    "Compute nearring non-units",
    [ IsNearRing ],
    function( R )
      if not IsNearRingWithIdentity( R ) then
        return List( R );
      else
        return Difference( R, UnitsOfNearRing( R ) );
      fi;
    end );

##
############################################################################
##
# GroupOfUnitsAsGroupOfAutomorphisms(<R>)
InstallMethod( GroupOfUnitsAsGroupOfAutomorphisms,
    "Compute a group isomorphic to the group of units of a nearring",
    [ IsNearRing ],
    function( R )
      local A, U;

      if not IsNearRingWithIdentity( R ) then
        Error( "no units exist" );
      else
        U := UnitsOfNearRing( R );;
        A := AutomorphismsAssociatedWithNearRingUnits( R, U );;
        A := AsGroup( A );;
        return A;
      fi;
    end );


##
############################################################################
##
# SubNearRingByGenerators(<R,elm>)
InstallMethod( SubNearRingByGenerators,
    "Compute subnearring by generators",
    [ IsNearRing, IsNearRingElementCollection ],
    function( R, elm )
      local a, b, c, G, M, N, S;

      G := GroupReduct( R );
      S := SemigroupByGenerators( elm );
      repeat
        M := List( S, AsGroupReductElement );
        M := Subgroup( G, M );
        N := List( M, b -> AsNearRingElement( R, b ) );
        S := SemigroupByGenerators( N );
      until Size( M ) = Size( S );
      c := SubNearRingBySubgroupNC( R, M );
      return c;
    end );

##
############################################################################
##
# NonUnitsAsAdditiveSubgroup(<R>)
InstallMethod( NonUnitsAsAdditiveSubgroup,
    "the additive subgroup of all non-units in local nearring",
    [ IsNearRing ],
    function( R )
      local a, N, g, L;

      if IsLocalNearRing( R ) then
        N := NearRingNonUnits( R );
        g := List( N, AsGroupReductElement );
        L := Subgroup( GroupReduct( R ), g );
        return L;
      else
        return fail;
      fi;
    end );

##
############################################################################
##
# NonUnitsAsNearRingIdeal(<R>)
InstallMethod( NonUnitsAsNearRingIdeal,
    "the maximal ideal in local nearring",
    [ IsNearRing ],
    function( R )
      local N, S;

      if IsLocalNearRing( R ) then
        N := NonUnitsAsAdditiveSubgroup( R );
        S := NearRingIdealBySubgroupNC( R, N );
        return S;
      else
        return fail;
      fi;
    end );

##
############################################################################
##
# MultiplicativeSemigroupOfNearRing(<R>)
InstallMethod( MultiplicativeSemigroupOfNearRing,
    "Multiplicative semigroup of nearring",
    [ IsNearRing ],
    function( R )
      return AsSemigroup( List( R ) );
    end );


##
############################################################################
##
# NonUnitsAsMultiplicativeSemigroup(<R>)
InstallMethod( NonUnitsAsMultiplicativeSemigroup,
    "the multiplicative semigroup generated by all non-units",
    [ IsNearRing ],
    function( R )
      local M, n, S;

      M := MultiplicativeSemigroupOfNearRing( R );
      n := NearRingNonUnits( R );
      S := Subsemigroup( M, n );
      return S;
    end );

##
############################################################################
##
# IsOneGeneratedNearRing(<R>)
InstallMethod( IsOneGeneratedNearRing,
    "Is one generated nearring",
    [ IsNearRing ],
    function( R )
      local S, T, U, x;

      S := SubNearRings( R );
      T := Filtered( S, x -> Size( x ) < Size( R ) );
      U := Union( T );
      return Size( U ) < Size( R );
    end );

############################################################################
##
# AutomorphismsAssociatedWithNearRingUnits(<R,un>)
InstallMethod( AutomorphismsAssociatedWithNearRingUnits,
    "Automorphisms associated with nearring units",
    [ IsNearRing, IsNearRingElementCollection ],
    function( R, un )
      local A, Aut, d, G, g, gen, m, mg, r, u, x;

      G := GroupReduct( R );
      mg := SmallGeneratingSet( G );
      Aut := AutomorphismGroup( G );
      m := Size( Aut );
      if ForAll( un, u -> u^m = Identity( R ) ) then
        A := [];
        for r in un do
          gen := List( mg, x -> AsGroupReductElement( r^(m - 1) * AsNearRingElement( R, x ) ) );
          g := GroupHomomorphismByImages( G, G, mg, gen );
          Add( A, g );
        od;
        return A;
      else
        return fail;
      fi;
    end );

##
############################################################################
##
# EndomorphismsAssociatedWithNearRingElements(<R,elm>)
InstallMethod( EndomorphismsAssociatedWithNearRingElements,
    "Endomorphisms associated with nearring elements",
    [ IsNearRing, IsNearRingElementCollection ],
    function( R, elm )
      local a, d, En, G, g, mg, x, y;

      G := GroupReduct( R );
      mg := MinimalGeneratingSet( G );
      En := [];
      for x in elm do
        a := List( mg, y -> AsGroupReductElement( x * AsNearRingElement( R, y ) ) );
        g := GroupHomomorphismByImages( G, G, mg, a );
        Add( En, g );
      od;
      return En;
    end );

##
############################################################################
##
# SemidirectProductAssociatedWithNearRing(<R>)
InstallMethod( SemidirectProductAssociatedWithNearRing,
    "Semidirect product associated with nearring",
    [ IsNearRing ],
    function( R )
      local A, S, G, Un;

      if not IsNearRingWithIdentity( R ) then
        return fail;
      else
        G := GroupReduct( R );
        Un := UnitsOfNearRing( R );
        A := AutomorphismsAssociatedWithNearRingUnits( R, Un );
        A := AsGroup( A );
        S := SemidirectProduct( A, G );
        return S;
      fi;
    end );

############################################################################
##
#  IsCircleSubgroupOfNearRing        
InstallMethod( IsCircleSubgroupOfNearRing,
    "Is circle subgroup of nearring",
    [ IsNearRing, IsGroup ],
    function( R, H )
      local a, d, F, G, Un, x;

      if not IsNearRingWithIdentity( R ) then
        Error( "must be a nearring with one" );
      else
        Un := UnitsOfNearRing( R );
        a := AsGroupReductElement( One( R ) );
        F := List( H, x -> AsNearRingElement( R, a * x ) );
      fi;
      return IsSubset( Un, F ) and Size( Unique( ListX( F, F, \* ) ) ) = Size( F );
    end );

##
############################################################################
##
#  FactorizedGroupAssociatedWithCircleSubgroupOfNearRing        
InstallMethod( FactorizedGroupAssociatedWithCircleSubgroupOfNearRing,
    "Factorized group associated with circle subgroup of nearring",
    [ IsNearRing, IsGroup ],
    function( R, H )
      local A, a, S, d, F, x;

      if IsCircleSubgroupOfNearRing( R, H ) then
        a := AsGroupReductElement( One( R ) );
        F := List( H, x -> AsNearRingElement( R, a * x ) );
        A := AutomorphismsAssociatedWithNearRingUnits( R, F );
        A := AsGroup( A );
        S := SemidirectProduct( A, H );
        return S;
      else
        Error( "the subgroup of nearring is not circle" );
      fi;
    end );

##
############################################################################
##
# ConstantPartOfNearRing(<R>)
InstallMethod( ConstantPartOfNearRing,
    "Constant part of nearring",
    [ IsNearRing ],
    function( R )
      local g, Rc;

      g := EndomorphismsAssociatedWithNearRingElements( R, [ Zero( R ) ] )[1];
      Rc := SubNearRingBySubgroupNC( R, Image( g ) );
      return Rc;
    end );

##
############################################################################
##
# ZeroSymmetricPartOfNearRing(<R>)
InstallMethod( ZeroSymmetricPartOfNearRing,
    "Zero-symmetric part of nearring",
    [ IsNearRing ],
    function( R )
      local g, R0;

      g := EndomorphismsAssociatedWithNearRingElements( R, [ Zero( R ) ] )[1];
      R0 := SubNearRingBySubgroupNC( R, Kernel( g ) );
      return R0;
    end );

############################################################################
##
#M  IsSemiDistributiveNearRing 

InstallMethod(
    IsSemiDistributiveNearRing,
    "test all elements",
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
    [IsNearRing],
    0,
    function ( R )
      return Identity( R ) <> fail;
    end );

##
############################################################################
##
# IsSubNearRing(<R,H>)
InstallMethod( IsSubNearRing,
    "Is the subgroup of the additive group a subnearring",
    [ IsNearRing, IsGroup],
    function( R, H )
      local a, G, M, S;

      G := GroupReduct( R );
      if IsSubgroup( G, H ) = false then
        return false;
      fi;
      M := List( H, a -> AsNearRingElement( R, a ) );
      S := SemigroupByGenerators( M );
      return Size( H ) = Size( S );
    end );
