##
############################################################################
##
# LocalNearRing(<k,l,m,n,w>)
 InstallMethod( LocalNearRing,
    "Local nearring",
    [ IsInt, IsInt, IsInt, IsInt, IsInt ],
  function( k,l,m,n,w )
local h, dio, G,  P, P1, H, R, Li, t, gr, Pos, x, y, d, z, hom, f, const, constructor, u, B, A, k1, Or, a, g, Em, ma, mul, Nr;
h:=DirectoriesPackageLibrary("LocalNR", Concatenation("Endom/", String(k)));
if IsEmpty(h) then return false;
else
dio:=Filename(h,Concatenation("Endom", String(k),"_",String(l),"-",String(m),"_",String(n),".txt"));
G:=SmallGroup(k,l);
P1:=ReadAsFunction(dio)();
P:=P1[w];
H:=[];
R:=[];
Li:=AsSortedList(G);
t:=Size(P);
gr:=MinimalGeneratingSet(G);
Pos:=[];
for x in gr do
Add(Pos,Position(Li,x));
od;
for y in [1..t] do
d:=[];
for z in Pos do
Add(d,Li[P[y][z]]);
od;
Add(H,d);   
od;
hom:=[];
for x in H do   
d:=GroupHomomorphismByImagesNC(G,G,gr,x);
Add(hom,d);   
od;
f:=function(x,y) return x*y;end;
const:=function(y) return function(x) return y^x; end;end;
constructor:=function(z) return function(u) return function(x,y) return  u^(PreImage(z,y)*PreImage(z,x));end;end;end;
B:=Filtered(hom,x->IsInjective(x));
A:=GroupByGenerators(B);
k1:=Position(OrbitLengths(A,G),Size(A));
Or:=OrbitsDomain(A,G)[k1];
a:=Or[1];
g:=const(a);
Em:=MagmaWithOne(hom);
ma:=MappingByFunction(Em,G,g);
mul:=constructor(ma)(a);
Nr:=ExplicitMultiplicationNearRingNC(G, mul);
return Nr;
fi;
end);

##
############################################################################
##
# AllLocalNearRings(<k,l,m,n>)
 InstallMethod( AllLocalNearRings,
    "All local nearrings",
    [ IsInt, IsInt, IsInt, IsInt ],
  function( k,l,m,n )
  local G, P1, w, h, H, s, t, Li, hom, En, R, gr, Pos, x, i, y, z, d, f, const, constructor, u, I, J, T, B, j, A, k1, Or, a, g, Em, ma, mul, Nr;
 h:=DirectoriesPackageLibrary("LocalNR", Concatenation("Endom/", String(k)));
if IsEmpty(h) then return false;
else
w:=Filename(h,Concatenation("Endom", String(k),"_",String(l),"-",String(m),"_",String(n),".txt"));
G:=SmallGroup(k,l);
P1:=ReadAsFunction(w)();
H:=[];
s:=Size(P1);
t:=List(P1,Size);;
Li:=AsSortedList(G);;
hom:=[];
En:=[];
R:=[];
gr:=MinimalGeneratingSet(G);
Pos:=[];
for x in gr do
Add(Pos,Position(Li,x));
od;
for i in [1..s] do
H[i]:=[];
for y in [1..t[i]] do
d:=[];
for z in Pos do
Add(d,Li[P1[i][y][z]]);
od;
Add(H[i],d);
od;
hom[i]:=[];
for x in H[i] do
d:=GroupHomomorphismByImagesNC(G,G,gr,x);
Add(hom[i],d);
od;
od;
f:=function(x,y) return x*y;end;
const:=function(y) return function(x) return y^x; end;end;
constructor:=function(z) return function(u) return function(x,y) return  
u^(PreImage(z,y)*PreImage(z,x));end;end;end;
s:=Size(hom);
I:=[1..s];
repeat
J:=[];
T:=[];
B:=Filtered(hom[I[1]],x->IsInjective(x));;
for i in I do
if IsSubset(hom[i],B) then Add(J,i);fi;
od;
j:=Size(J);
A:=GroupByGenerators(B);
k1:=Position(OrbitLengths(A,G),Size(A));              
Or:=OrbitsDomain(A,G)[k1];
a:=Or[1];
g:=const(a);
for l in J do
Em:=MagmaWithOne(hom[l]);
ma:=MappingByFunction(Em,G,g);
mul:=constructor(ma)(a);
Nr:=ExplicitMultiplicationNearRingNC(G, mul);
Add(T,Nr);
od;
Add(R,T);
I:=Difference(I,J);;
until Size(I)=0;
R:=Concatenation(R);;
return R;
fi;
end);

##
############################################################################
##
# TheAdditiveGroupsOfLibraryOfLNRsOfOrder
InstallGlobalFunction(TheAdditiveGroupsOfLibraryOfLNRsOfOrder, function(n)
local t,cont,i,h,j,f,g,r,us;
t:=DirectoriesPackageLibrary("LocalNR", Concatenation("Endom/", String(n)));
if IsEmpty(t) then Error("the order must be PrimePowerInt and 3<n and n<1331 (except orders 128, 256, 512, 625, 729, 1024)");
else
cont:=DirectoryContents(t[1]);;
Size(cont);
for i in cont do
RemoveCharacters(i, "Endom\.txt\.gz");
od;
h:=[];
for j in cont do
f:=SplitStringInternal(j, "_","-");
Add(h,f);
od;
g:=[];
for i in h do
if Size(i)>0 then 
Add(g,i[2]);
fi;
od;
us:=Unique(g);
Sort( us, function(b,w) return Int(b) < Int(w); end );
r:=[];
for i in us do
Add(r,EvalString(Concatenation("SmallGroup(",String(n),",",i,")")));
od;
return r;
fi; 
  end);


##
############################################################################
##
# IsAdditiveGroupOfLibraryOfLNRs
InstallGlobalFunction(IsAdditiveGroupOfLibraryOfLNRs, function(G)
local s,t,cont,i,h,j,f,g,r,us,d,k;
s:=Size(G);
t:=DirectoriesPackageLibrary("LocalNR", Concatenation("Endom/", String(s)));
if IsEmpty(t) then Error("false");
else
cont:=DirectoryContents(t[1]);;
Size(cont);
for i in cont do
RemoveCharacters(i, "Endom\.txt\.gz");
od;
h:=[];
for j in cont do
f:=SplitStringInternal(j, "_","-");
Add(h,f);
od;
g:=[];
for i in h do
if Size(i)>0 then 
Add(g,i[2]);
fi;
od;
us:=Unique(g);
Sort( us, function(b,w) return Int(b) < Int(w); end );
r:=[];
for i in us do
Add(r,EvalString(Concatenation("[",String(s),",",i,"]")));
od;
fi;
k:=Size(r);
d:=Filtered([1..k],x->IdGroup(G)=r[x]);
if Size(d)>0 then Print("true");
else Print("false"); fi; 
end);


##
############################################################################
##
# TheLibraryOfLNRsOnGroup
InstallGlobalFunction(TheLibraryOfLNRsOnGroup, function(G) 

local s,t,cont,i,h,j,f,hj,g,r,ee,ww,b,w;
s:=Size(G);
t:=DirectoriesPackageLibrary("LocalNR", Concatenation("Endom/", String(s)));
if IsEmpty(t) then Error("false");
else
cont:=DirectoryContents(t[1]); 
Size(cont);
for i in cont do
RemoveCharacters(i, "Endom\.txt\.gz");
od;
h:=[];
for j in cont do
f:=SplitStringInternal(j, "_","-");
Add(h,f);
od;
fi;
hj:=IdGroup(G);
g:=[];
for i in h do
if Size(i)>0 and EvalString(i[2])=hj[2] then
Add(g,i);
fi;
od;
ww:=function(b,w)
if Int(b[3])=Int(w[3]) then 
return Int(b[4]) < Int(w[4]);
else 
return Int(b[3]) < Int(w[3]);
fi;
end;
Sort(g,ww);
ee:=[];
for i in g do 
if Size(i)>0 then
Add(ee,Concatenation("AllLocalNearRings(",i[1],",",i[2],",",i[3],",",i[4],")")); 
fi;
od;
return ee;
end);


##
############################################################################
##
# InfoLocalNearRing
InstallGlobalFunction(InfoLocalNearRing, function(G)

local R,s,T,i,K,t,h;
h:=DirectoriesPackageLibrary("LocalNR", "Endom/");
t:=Filename(h,Concatenation("info", ".txt"));
R:=ReadAsFunction(t)();
K:=IdGroup(G);
s:=Size(R);
T:=[];
for i in [1..s] do
if R[i][1]=K[1] and R[i][2]=K[2] then 
Add(T,Concatenation("AllLocalNearRings(",String(R[i][1]),",",String(R[i][2]),",",String(R[i][3]),",",String(R[i][4]),") (", String(R[i][5]), ")"));
fi;
od; 
if Size(T)>1 then Print("The local nearrings are sorted by their multiplicative groups.\n", T);
elif Size(T)=1 then Print(T);
else return Error("group is not recognized in the library"); fi; 
end);
