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
  end);

##
############################################################################
##
# TheAdditiveGroupsOfLibraryOfLNRsOfOrder
InstallGlobalFunction(TheAdditiveGroupsOfLibraryOfLNRsOfOrder, function(n)
local t,cont,i,h,j,f,g,r,us;
t:=DirectoriesPackageLibrary("LocalNR", Concatenation("Endom/", String(n)));
if IsEmpty(t) then Error("the order must be PrimePowerInt and 3<n and n<362 ");
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

#4
if IdGroup(G)=[4,1] then
Print(
"There is 1 local nearring on this group.\n",
"AllLocalNearRings(4,1,2,1)                         (1) \n"); 

elif IdGroup(G)=[4,2] then
Print(
"There are 3 local nearrings on this group.      \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(4,2,2,1)                        (2) \n",
"AllLocalNearRings(4,2,3,1)                        (1) \n" ); 

#8
elif IdGroup(G)=[8,1] then
Print(
"There is 1 local nearring on this group.\n",
"AllLocalNearRings(8,1,4,2)                        (1) \n");

elif IdGroup(G)=[8,2] then
Print(
"There are 5 local nearrings on this group.      \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(8,2,4,1)                        (2) \n",
"AllLocalNearRings(8,2,4,2)                        (3) \n"); 

elif IdGroup(G)=[8,5] then
Print( 
"There are 7 local nearrings on this group.      \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(8,5,4,1)                        (2) \n",
"AllLocalNearRings(8,5,4,2)                        (4) \n",
"AllLocalNearRings(8,5,7,1)                        (1) \n" );

#9
elif IdGroup(G)=[9,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(9,1,6,2)                        (1) \n");

elif IdGroup(G)=[9,2] then
Print(
"There are 5 local nearrings on this group.      \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(9,2,6,1)                        (2) \n", 
"AllLocalNearRings(9,2,6,2)                        (1) \n",
"AllLocalNearRings(9,2,8,1)                        (1) \n",
"AllLocalNearRings(9,2,8,4)                        (1) \n" ); 

#16
elif IdGroup(G)=[16,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(16,1,8,2)                         (1) \n" );

elif IdGroup(G)=[16,2] then
Print( 
"There are 29 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(16,2,8,2)                          (10) \n", 
"AllLocalNearRings(16,2,8,3)                          (9)  \n", 
"AllLocalNearRings(16,2,8,5)                          (6)  \n", 
"AllLocalNearRings(16,2,12,3)                         (2)  \n", 
"AllLocalNearRings(16,2,12,5)                         (2)  \n"); 

elif IdGroup(G)=[16,3] then
Print(
"There are 37 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(16,3,8,2)                         (14) \n", 
"AllLocalNearRings(16,3,8,3)                         (17) \n", 
"AllLocalNearRings(16,3,8,5)                         (6)  \n"); 

elif IdGroup(G)=[16,4] then
Print(
"There are 24 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(16,4,8,2)                         (7)  \n",
"AllLocalNearRings(16,4,8,3)                         (10) \n",
"AllLocalNearRings(16,4,8,5)                         (7)  \n"); 

elif IdGroup(G)=[16,5] then
Print(
"There are 33 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(16,5,8,2)                         (8)  \n",
"AllLocalNearRings(16,5,8,3)                         (16) \n",
"AllLocalNearRings(16,5,8,5)                         (9)  \n"); 

elif IdGroup(G)=[16,6] then
Print(
"There are 33 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(16,6,8,2)                         (8)  \n",
"AllLocalNearRings(16,6,8,3)                         (17) \n",
"AllLocalNearRings(16,6,8,5)                         (8)  \n" );

elif IdGroup(G)=[16,10] then
Print(
"There are 251 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(16,10,8,2)                        (96) \n",
"AllLocalNearRings(16,10,8,3)                        (90) \n",
"AllLocalNearRings(16,10,8,4)                        (24) \n",
"AllLocalNearRings(16,10,8,5)                        (41) \n"); 

elif IdGroup(G)=[16,12] then
Print(
"There are 2 local nearrings on this group. \n",
"AllLocalNearRings(16,12,12,3)                       (2) \n" ); 

elif IdGroup(G)=[16,14] then
Print(
"There are 230 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(16,14,8,2)                        (84) \n",
"AllLocalNearRings(16,14,8,3)                        (77) \n",
"AllLocalNearRings(16,14,8,4)                        (24) \n",
"AllLocalNearRings(16,14,8,5)                        (37) \n",
"AllLocalNearRings(16,14,12,3)                       (5)  \n",
"AllLocalNearRings(16,14,12,5)                       (2)  \n",
"AllLocalNearRings(16,14,15,1)                       (1)  \n" );

#25
elif IdGroup(G)=[25,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(25,1,20,2)                       (1) \n" ); 

elif IdGroup(G)=[25,2] then
Print(
"There are 8 local nearrings on this group.      \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(25,2,20,1)                       (1) \n",
"AllLocalNearRings(25,2,20,2)                       (1) \n",
"AllLocalNearRings(25,2,20,3)                       (3) \n",
"AllLocalNearRings(25,2,24,1)                       (1) \n",
"AllLocalNearRings(25,2,24,2)                       (1) \n",
"AllLocalNearRings(25,2,24,3)                       (1) \n" ); 

#27
elif IdGroup(G)=[27,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(27,1,18,2)                        (1) \n"); 

elif IdGroup(G)=[27,2] then
Print(
"There are 13 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(27,2,18,3)                        (4) \n",
"AllLocalNearRings(27,2,18,5)                        (9) \n");

elif IdGroup(G)=[27,3] then
Print(
"There are 4 local nearrings on this group. \n",
"AllLocalNearRings(27,3,18,3)                        (4) \n");

elif IdGroup(G)=[27,4] then
Print(
"There are 4 local nearrings on this group. \n",
"AllLocalNearRings(27,4,18,3)                        (4) \n"); 

elif IdGroup(G)=[27,5] then
Print(
"There are 13 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(27,5,18,3)                        (3) \n", 
"AllLocalNearRings(27,5,18,4)                        (4) \n", 
"AllLocalNearRings(27,5,18,5)                        (5) \n", 
"AllLocalNearRings(27,5,26,2)                        (1) \n"); 

#32
elif IdGroup(G)=[32,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(32,1,16,5)                         (1) \n");

elif IdGroup(G)=[32,2] then
Print(
"There are 1397 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,2,16,3)                         (369) \n", 
"AllLocalNearRings(32,2,16,10)                        (198) \n", 
"AllLocalNearRings(32,2,16,11)                        (764) \n", 
"AllLocalNearRings(32,2,16,14)                        (66)  \n");

elif IdGroup(G)=[32,3] then
Print(
"There are 880 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,3,16,3)                         (208) \n", 
"AllLocalNearRings(32,3,16,10)                        (128) \n", 
"AllLocalNearRings(32,3,16,11)                        (489) \n", 
"AllLocalNearRings(32,3,16,14)                        (55)  \n");

elif IdGroup(G)=[32,4] then
Print(
"There are 798 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,4,16,3)                         (238) \n", 
"AllLocalNearRings(32,4,16,10)                        (100) \n", 
"AllLocalNearRings(32,4,16,11)                        (424) \n", 
"AllLocalNearRings(32,4,16,14)                        (36)  \n");

elif IdGroup(G)=[32,5] then
Print(
"There are 1945 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,5,16,3)                         (548)  \n", 
"AllLocalNearRings(32,5,16,10)                        (232)  \n", 
"AllLocalNearRings(32,5,16,11)                        (1077) \n", 
"AllLocalNearRings(32,5,16,14)                        (88)   \n");

elif IdGroup(G)=[32,6] then
Print(
"There are 433 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,6,16,3)                         (64)  \n", 
"AllLocalNearRings(32,6,16,11)                        (225) \n", 
"AllLocalNearRings(32,6,16,13)                        (144) \n");

elif IdGroup(G)=[32,7] then
Print(
"There are 225 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,7,16,3)                         (32)  \n", 
"AllLocalNearRings(32,7,16,11)                        (121) \n", 
"AllLocalNearRings(32,7,16,13)                        (72)  \n");

elif IdGroup(G)=[32,8] then
Print(
"There are 208 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,8,16,3)                         (32)  \n", 
"AllLocalNearRings(32,8,16,11)                        (104) \n", 
"AllLocalNearRings(32,8,16,13)                        (72)  \n");

elif IdGroup(G)=[32,12] then
Print(
"There are 2406 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,12,16,3)                        (624)  \n", 
"AllLocalNearRings(32,12,16,10)                       (312)  \n", 
"AllLocalNearRings(32,12,16,11)                       (1350) \n", 
"AllLocalNearRings(32,12,16,14)                       (120)  \n");

elif IdGroup(G)=[32,16] then
Print(
"There are 129 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,16,16,10)                      (33) \n", 
"AllLocalNearRings(32,16,16,11)                      (16) \n", 
"AllLocalNearRings(32,16,16,12)                      (16) \n", 
"AllLocalNearRings(32,16,16,13)                      (64) \n");

elif IdGroup(G)=[32,17] then
Print(
"There are 129 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,17,16,10)                      (32) \n", 
"AllLocalNearRings(32,17,16,11)                      (16) \n", 
"AllLocalNearRings(32,17,16,12)                      (16) \n", 
"AllLocalNearRings(32,17,16,13)                      (65) \n");

elif IdGroup(G)=[32,21] then
Print(
"There are 135558 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,21,16,2)                        (256)   \n", 
"AllLocalNearRings(32,21,16,3)                        (634)   \n",
"AllLocalNearRings(32,21,16,4)                        (136)   \n", 
"AllLocalNearRings(32,21,16,5)                        (4)     \n", 
"AllLocalNearRings(32,21,16,6)                        (2)     \n", 
"AllLocalNearRings(32,21,16,10)                       (13630) \n",
"AllLocalNearRings(32,21,16,11)                       (62910) \n",
"AllLocalNearRings(32,21,16,12)                       (4368)  \n", 
"AllLocalNearRings(32,21,16,13)                       (49152) \n",
"AllLocalNearRings(32,21,16,14)                       (4466)  \n");

elif IdGroup(G)=[32,22] then
Print(
"There are 149374 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,22,16,2)                        (1024)  \n",
"AllLocalNearRings(32,22,16,3)                        (5936)  \n",
"AllLocalNearRings(32,22,16,4)                        (3120)  \n", 
"AllLocalNearRings(32,22,16,5)                        (20)    \n", 
"AllLocalNearRings(32,22,16,6)                        (30)    \n", 
"AllLocalNearRings(32,22,16,10)                       (14457) \n",
"AllLocalNearRings(32,22,16,11)                       (66579) \n", 
"AllLocalNearRings(32,22,16,12)                       (4368)  \n",
"AllLocalNearRings(32,22,16,13)                       (49368) \n",
"AllLocalNearRings(32,22,16,14)                       (4472)  \n");

elif IdGroup(G)=[32,23] then
Print(
"There are 157905 local nearrings on this group  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,23,16,3)                        (458)   \n",
"AllLocalNearRings(32,23,16,4)                        (4)     \n",
"AllLocalNearRings(32,23,16,10)                       (13414) \n",
"AllLocalNearRings(32,23,16,11)                       (85208) \n",
"AllLocalNearRings(32,23,16,12)                       (4416)  \n",
"AllLocalNearRings(32,23,16,13)                       (49920) \n",
"AllLocalNearRings(32,23,16,14)                       (4485)  \n");

elif IdGroup(G)=[32,24] then
Print(
"There are 262544 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,24,16,10)                       (24576)  \n",
"AllLocalNearRings(32,24,16,11)                       (123080) \n",
"AllLocalNearRings(32,24,16,12)                       (8192)   \n", 
"AllLocalNearRings(32,24,16,13)                       (98504)  \n",
"AllLocalNearRings(32,24,16,14)                       (8192)   \n");

elif IdGroup(G)=[32,36] then
Print(
"There are 177175 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,36,16,3)                        (448)   \n", 
"AllLocalNearRings(32,36,16,10)                       (16770) \n",
"AllLocalNearRings(32,36,16,11)                       (83244) \n",
"AllLocalNearRings(32,36,16,12)                       (5472)  \n",
"AllLocalNearRings(32,36,16,13)                       (65536) \n",
"AllLocalNearRings(32,36,16,14)                       (5705)  \n");

elif IdGroup(G)=[32,37] then
Print(
"There are 527419 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,37,16,3)                        (496)    \n", 
"AllLocalNearRings(32,37,16,10)                       (49514)  \n",
"AllLocalNearRings(32,37,16,11)                       (247431) \n",
"AllLocalNearRings(32,37,16,12)                       (16384)  \n",
"AllLocalNearRings(32,37,16,13)                       (197008) \n",
"AllLocalNearRings(32,37,16,14)                       (16586)  \n");

elif IdGroup(G)=[32,45] then
Print(
"There are more than 6684533 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,45,16,2)                        (16435)   \n",
"AllLocalNearRings(32,45,16,3)                        (40447)   \n",
"AllLocalNearRings(32,45,16,4)                        (47904)   \n",
"AllLocalNearRings(32,45,16,5)                        (24)      \n", 
"AllLocalNearRings(32,45,16,6)                        (32)      \n", 
"AllLocalNearRings(32,45,16,8)                        (14)      \n", 
"AllLocalNearRings(32,45,16,9)                        (14)      \n",
"AllLocalNearRings(32,45,16,10)                       (741652)  \n",
"AllLocalNearRings(32,45,16,11)                       (2190035)  \n",
"AllLocalNearRings(32,45,16,12)                       (710359)  \n",
"AllLocalNearRings(32,45,16,13)                       (2847717) \n",
"AllLocalNearRings(32,45,16,14)                       (>89900)   \n"); 


elif IdGroup(G)=[32,51] then
Print(
"There are more than 7007053 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(32,51,16,2)                        (5983)    \n",
"AllLocalNearRings(32,51,16,3)                        (23205)   \n",
"AllLocalNearRings(32,51,16,4)                        (17100)   \n",
"AllLocalNearRings(32,51,16,5)                        (24)      \n",
"AllLocalNearRings(32,51,16,6)                        (32)      \n",
"AllLocalNearRings(32,51,16,8)                        (14)      \n",
"AllLocalNearRings(32,51,16,9)                        (14)      \n",
"AllLocalNearRings(32,51,16,10)                       (789167)  \n",
"AllLocalNearRings(32,51,16,11)                       (2566765) \n",
"AllLocalNearRings(32,51,16,12)                       (703803)  \n",
"AllLocalNearRings(32,51,16,13)                       (2808419) \n",
"AllLocalNearRings(32,51,16,14)                       (>92527)  \n");

#49
elif IdGroup(G)=[49,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(49,1,42,6)                         (1) \n"); 

elif IdGroup(G)=[49,2] then
Print(
"There are 10 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(49,2,42,1)                         (3) \n",
"AllLocalNearRings(49,2,42,2)                         (2) \n",
"AllLocalNearRings(49,2,42,4)                         (1) \n",
"AllLocalNearRings(49,2,42,6)                         (1) \n",
"AllLocalNearRings(49,2,48,2)                         (1) \n",
"AllLocalNearRings(49,2,48,27)                        (1) \n",
"AllLocalNearRings(49,2,48,28)                        (1) \n");

#64
elif IdGroup(G)=[64,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(64,1,32,16)                         (1) \n"); 

elif IdGroup(G)=[64,2] then
Print(
"There are 1683 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,2,32,5)                          (96)  \n",
"AllLocalNearRings(64,2,32,9)                          (64)  \n",
"AllLocalNearRings(64,2,32,21)                         (24)  \n",
"AllLocalNearRings(64,2,32,23)                         (40)  \n",
"AllLocalNearRings(64,2,32,24)                         (36)  \n",
"AllLocalNearRings(64,2,32,36)                         (64)  \n",
"AllLocalNearRings(64,2,32,37)                         (164) \n",
"AllLocalNearRings(64,2,32,39)                         (160) \n",
"AllLocalNearRings(64,2,32,40)                         (160) \n",
"AllLocalNearRings(64,2,32,43)                         (321) \n",
"AllLocalNearRings(64,2,32,45)                         (68)  \n",
"AllLocalNearRings(64,2,32,46)                         (48)  \n",
"AllLocalNearRings(64,2,32,47)                         (48)  \n",
"AllLocalNearRings(64,2,32,48)                         (388) \n",
"AllLocalNearRings(64,2,48,44)                         (2)   \n"); 

elif IdGroup(G)=[64,3] then
Print(
"There are 1628 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,3,32,5)                           (96)  \n",
"AllLocalNearRings(64,3,32,9)                           (64)  \n",
"AllLocalNearRings(64,3,32,21)                          (12)  \n",
"AllLocalNearRings(64,3,32,23)                          (20)  \n",
"AllLocalNearRings(64,3,32,24)                          (24)  \n",
"AllLocalNearRings(64,3,32,36)                          (60)  \n",
"AllLocalNearRings(64,3,32,37)                          (160) \n",
"AllLocalNearRings(64,3,32,39)                          (160) \n",
"AllLocalNearRings(64,3,32,40)                          (160) \n",
"AllLocalNearRings(64,3,32,43)                          (320) \n",
"AllLocalNearRings(64,3,32,45)                          (68)  \n",
"AllLocalNearRings(64,3,32,46)                          (48)  \n",
"AllLocalNearRings(64,3,32,47)                          (48)  \n",
"AllLocalNearRings(64,3,32,48)                          (388) \n");

elif IdGroup(G)=[64,4] then
Print(
"There are 167245 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,4,32,6)                           (1024)  \n",
"AllLocalNearRings(64,4,32,22)                          (23424) \n",
"AllLocalNearRings(64,4,32,25)                          (10736) \n",
"AllLocalNearRings(64,4,32,27)                          (43006) \n",
"AllLocalNearRings(64,4,32,28)                          (34688) \n",
"AllLocalNearRings(64,4,32,30)                          (8384)  \n",
"AllLocalNearRings(64,4,32,31)                          (3712)  \n",
"AllLocalNearRings(64,4,32,34)                          (7726)  \n",
"AllLocalNearRings(64,4,32,46)                          (21361) \n",
"AllLocalNearRings(64,4,32,48)                          (5632)  \n",
"AllLocalNearRings(64,4,32,49)                          (7552)  \n");


elif IdGroup(G)=[64,5] then
Print(
"There are 118190 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,5,32,6)                           (1024)  \n",
"AllLocalNearRings(64,5,32,22)                          (21888) \n",
"AllLocalNearRings(64,5,32,25)                          (7176)  \n",
"AllLocalNearRings(64,5,32,27)                          (31992) \n",
"AllLocalNearRings(64,5,32,28)                          (23846) \n",
"AllLocalNearRings(64,5,32,30)                          (7144)  \n",
"AllLocalNearRings(64,5,32,31)                          (3136)  \n",
"AllLocalNearRings(64,5,32,34)                          (4040)  \n",
"AllLocalNearRings(64,5,32,46)                          (6440)  \n",
"AllLocalNearRings(64,5,32,48)                          (4880)  \n",
"AllLocalNearRings(64,5,32,49)                          (6624)  \n"); 

elif IdGroup(G)=[64,10] then
Print(
"There are 7424 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,10,32,6)                            (64)   \n",
"AllLocalNearRings(64,10,32,22)                           (1792) \n",
"AllLocalNearRings(64,10,32,25)                           (320)  \n",
"AllLocalNearRings(64,10,32,27)                           (2496) \n",
"AllLocalNearRings(64,10,32,28)                           (960)  \n",
"AllLocalNearRings(64,10,32,30)                           (256)  \n",
"AllLocalNearRings(64,10,32,31)                           (128)  \n",
"AllLocalNearRings(64,10,32,34)                           (192)  \n",
"AllLocalNearRings(64,10,32,46)                           (960)  \n",
"AllLocalNearRings(64,10,32,48)                           (128)  \n",
"AllLocalNearRings(64,10,32,49)                           (128)  \n"); 

elif IdGroup(G)=[64,12] then
Print(
"There are 5633 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,12,32,6)                            (64)   \n",
"AllLocalNearRings(64,12,32,22)                           (1344) \n",
"AllLocalNearRings(64,12,32,25)                           (240)  \n",
"AllLocalNearRings(64,12,32,27)                           (1921) \n",
"AllLocalNearRings(64,12,32,28)                           (720)  \n",
"AllLocalNearRings(64,12,32,30)                           (192)  \n",
"AllLocalNearRings(64,12,32,31)                           (96)   \n",
"AllLocalNearRings(64,12,32,34)                           (144)  \n",
"AllLocalNearRings(64,12,32,46)                           (720)  \n",
"AllLocalNearRings(64,12,32,48)                           (96)   \n",
"AllLocalNearRings(64,12,32,49)                           (96)   \n"); 

elif IdGroup(G)=[64,14] then
Print(
"There are 5520 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,14,32,6)                            (48)   \n",
"AllLocalNearRings(64,14,32,22)                           (1344) \n",
"AllLocalNearRings(64,14,32,25)                           (240)  \n",
"AllLocalNearRings(64,14,32,27)                           (1824) \n",
"AllLocalNearRings(64,14,32,28)                           (720)  \n",
"AllLocalNearRings(64,14,32,30)                           (192)  \n",
"AllLocalNearRings(64,14,32,31)                           (96)   \n",
"AllLocalNearRings(64,14,32,34)                           (144)  \n",
"AllLocalNearRings(64,14,32,46)                           (720)  \n",
"AllLocalNearRings(64,14,32,48)                           (96)   \n",
"AllLocalNearRings(64,14,32,49)                           (96)   \n"); 

elif IdGroup(G)=[64,15] then
Print(
"There are 2384 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,15,32,5)                           (96)  \n",
"AllLocalNearRings(64,15,32,9)                           (32)  \n",
"AllLocalNearRings(64,15,32,36)                          (64)  \n",
"AllLocalNearRings(64,15,32,37)                          (192) \n",
"AllLocalNearRings(64,15,32,39)                          (408) \n",
"AllLocalNearRings(64,15,32,40)                          (408) \n",
"AllLocalNearRings(64,15,32,43)                          (800) \n",
"AllLocalNearRings(64,15,32,45)                          (32)  \n",
"AllLocalNearRings(64,15,32,46)                          (32)  \n",
"AllLocalNearRings(64,15,32,47)                          (32)  \n",
"AllLocalNearRings(64,15,32,48)                          (288) \n");

elif IdGroup(G)=[64,16] then
Print(
"There are 2384 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,16,32,5)                           (96)  \n",
"AllLocalNearRings(64,16,32,9)                           (32)  \n",
"AllLocalNearRings(64,16,32,36)                          (64)  \n",
"AllLocalNearRings(64,16,32,37)                          (192) \n",
"AllLocalNearRings(64,16,32,39)                          (408) \n",
"AllLocalNearRings(64,16,32,40)                          (408) \n",
"AllLocalNearRings(64,16,32,43)                          (800) \n",
"AllLocalNearRings(64,16,32,45)                          (32)  \n",
"AllLocalNearRings(64,16,32,46)                          (32)  \n",
"AllLocalNearRings(64,16,32,47)                          (32)  \n",
"AllLocalNearRings(64,16,32,48)                          (288) \n");


elif IdGroup(G)=[64,17] then
Print(
"There are 433060 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,17,32,22)                          (210641)  \n",
"AllLocalNearRings(64,17,32,27)                          (208752)  \n",
"AllLocalNearRings(64,17,32,45)                          (13667)  \n");


elif IdGroup(G)=[64,23] then
Print(
"There are 111758 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,23,32,6)                          (710)   \n",
"AllLocalNearRings(64,23,32,7)                          (34)    \n",
"AllLocalNearRings(64,23,32,22)                         (14977) \n",
"AllLocalNearRings(64,23,32,27)                         (29048) \n",
"AllLocalNearRings(64,23,32,28)                         (29184) \n",
"AllLocalNearRings(64,23,32,30)                         (7808) \n",
"AllLocalNearRings(64,23,32,31)                         (3896) \n",
"AllLocalNearRings(64,23,32,34)                         (6840) \n",
"AllLocalNearRings(64,23,32,46)                         (11709) \n",
"AllLocalNearRings(64,23,32,48)                         (3776) \n",
"AllLocalNearRings(64,23,32,49)                         (3776) \n");

elif IdGroup(G)=[64,24] then
Print(
"There are 109189 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,24,32,6)                           (640)   \n",
"AllLocalNearRings(64,24,32,22)                          (12481) \n",
"AllLocalNearRings(64,24,32,25)                          (8676)  \n",
"AllLocalNearRings(64,24,32,27)                          (26856) \n",
"AllLocalNearRings(64,24,32,28)                          (27488) \n",
"AllLocalNearRings(64,24,32,30)                          (6624)  \n",
"AllLocalNearRings(64,24,32,31)                          (3312)  \n",
"AllLocalNearRings(64,24,32,34)                          (5364)  \n",
"AllLocalNearRings(64,24,32,46)                          (11124) \n",
"AllLocalNearRings(64,24,32,48)                          (3312)  \n",
"AllLocalNearRings(64,24,32,49)                          (3312)  \n");

elif IdGroup(G)=[64,26] then
Print(
"There are 11467 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,26,32,5)                            (16)   \n",
"AllLocalNearRings(64,26,32,11)                           (36)   \n",
"AllLocalNearRings(64,26,32,21)                           (346)  \n",
"AllLocalNearRings(64,26,32,22)                           (576)  \n",
"AllLocalNearRings(64,26,32,23)                           (832)  \n",
"AllLocalNearRings(64,26,32,24)                           (528)  \n",
"AllLocalNearRings(64,26,32,25)                           (2305) \n",
"AllLocalNearRings(64,26,32,28)                           (1024) \n",
"AllLocalNearRings(64,26,32,29)                           (1024) \n",
"AllLocalNearRings(64,26,32,30)                           (1024) \n",
"AllLocalNearRings(64,26,32,36)                           (84)   \n",
"AllLocalNearRings(64,26,32,37)                           (232)  \n",
"AllLocalNearRings(64,26,32,40)                           (32)   \n",
"AllLocalNearRings(64,26,32,41)                           (32)   \n",
"AllLocalNearRings(64,26,32,42)                           (288)  \n",
"AllLocalNearRings(64,26,32,43)                           (144)  \n",
"AllLocalNearRings(64,26,32,44)                           (208)  \n",
"AllLocalNearRings(64,26,32,45)                           (456)  \n",
"AllLocalNearRings(64,26,32,46)                           (212)  \n",
"AllLocalNearRings(64,26,32,47)                           (212)  \n",
"AllLocalNearRings(64,26,32,48)                           (1856) \n");

elif IdGroup(G)=[64,27] then
Print(
"There are 11467 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,27,32,5)                            (16)   \n",
"AllLocalNearRings(64,27,32,11)                           (36)   \n",
"AllLocalNearRings(64,27,32,21)                           (272)  \n",
"AllLocalNearRings(64,27,32,22)                           (512)  \n",
"AllLocalNearRings(64,27,32,23)                           (768)  \n",
"AllLocalNearRings(64,27,32,24)                           (602)  \n",
"AllLocalNearRings(64,27,32,25)                           (2177) \n",
"AllLocalNearRings(64,27,32,28)                           (1088) \n",
"AllLocalNearRings(64,27,32,29)                           (1088) \n",
"AllLocalNearRings(64,27,32,30)                           (1152) \n",
"AllLocalNearRings(64,27,32,36)                           (84)   \n",
"AllLocalNearRings(64,27,32,37)                           (232)  \n",
"AllLocalNearRings(64,27,32,40)                           (32)   \n",
"AllLocalNearRings(64,27,32,41)                           (32)   \n",
"AllLocalNearRings(64,27,32,42)                           (288)  \n",
"AllLocalNearRings(64,27,32,43)                           (144)  \n",
"AllLocalNearRings(64,27,32,44)                           (208)  \n",
"AllLocalNearRings(64,27,32,45)                           (376)  \n",
"AllLocalNearRings(64,27,32,46)                           (212)  \n",
"AllLocalNearRings(64,27,32,47)                           (212)  \n",
"AllLocalNearRings(64,27,32,48)                           (1936) \n");

elif IdGroup(G)=[64,29] then
Print(
"There are 28185 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,29,32,21)                           (784)  \n",
"AllLocalNearRings(64,29,32,22)                           (1488) \n",
"AllLocalNearRings(64,29,32,23)                           (2192) \n",
"AllLocalNearRings(64,29,32,24)                           (1488) \n",
"AllLocalNearRings(64,29,32,25)                           (7641) \n",
"AllLocalNearRings(64,29,32,28)                           (3616) \n",
"AllLocalNearRings(64,29,32,29)                           (3616) \n",
"AllLocalNearRings(64,29,32,30)                           (2976) \n",
"AllLocalNearRings(64,29,32,45)                           (784)  \n",
"AllLocalNearRings(64,29,32,46)                           (352)  \n",
"AllLocalNearRings(64,29,32,47)                           (352)  \n",
"AllLocalNearRings(64,29,32,48)                           (2896) \n"); 

elif IdGroup(G)=[64,30] then
Print(
"There are 4433 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRingsNC(64,30,32,25)                           (769)  \n",
"AllLocalNearRingsNC(64,30,32,28)                           (384)  \n",
"AllLocalNearRingsNC(64,30,32,29)                           (384)  \n",
"AllLocalNearRingsNC(64,30,32,48)                           (1488) \n",
"AllLocalNearRingsNC(64,30,32,49)                           (704)  \n",
"AllLocalNearRingsNC(64,30,32,50)                           (704)  \n"); 

elif IdGroup(G)=[64,34] then
Print(
"There are 16177 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,34,32,6)                            (576)  \n",
"AllLocalNearRings(64,34,32,11)                           (4736) \n",
"AllLocalNearRings(64,34,32,22)                           (64)   \n",
"AllLocalNearRings(64,34,32,24)                           (64)   \n",
"AllLocalNearRings(64,34,32,25)                           (304)  \n",
"AllLocalNearRings(64,34,32,27)                           (704)  \n",
"AllLocalNearRings(64,34,32,28)                           (1193) \n",
"AllLocalNearRings(64,34,32,29)                           (128)  \n",
"AllLocalNearRings(64,34,32,30)                           (752)  \n",
"AllLocalNearRings(64,34,32,31)                           (192)  \n",
"AllLocalNearRings(64,34,32,33)                           (144)  \n",
"AllLocalNearRings(64,34,32,34)                           (96)   \n",
"AllLocalNearRings(64,34,32,42)                           (2304) \n",
"AllLocalNearRings(64,34,32,43)                           (2688) \n",
"AllLocalNearRings(64,34,32,44)                           (2048) \n",
"AllLocalNearRings(64,34,32,46)                           (120)  \n",
"AllLocalNearRings(64,34,32,48)                           (64)   \n"); 

elif IdGroup(G)=[64,35] then
Print(
"There are 15504 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,35,32,6)                            (512)  \n",
"AllLocalNearRings(64,35,32,11)                           (4608) \n",
"AllLocalNearRings(64,35,32,22)                           (64)   \n",
"AllLocalNearRings(64,35,32,24)                           (80)   \n",
"AllLocalNearRings(64,35,32,25)                           (288)  \n",
"AllLocalNearRings(64,35,32,27)                           (680)  \n",
"AllLocalNearRings(64,35,32,28)                           (1152) \n",
"AllLocalNearRings(64,35,32,29)                           (128)  \n",
"AllLocalNearRings(64,35,32,30)                           (704)  \n",
"AllLocalNearRings(64,35,32,31)                           (208)  \n",
"AllLocalNearRings(64,35,32,33)                           (128)  \n",
"AllLocalNearRings(64,35,32,34)                           (120)  \n",
"AllLocalNearRings(64,35,32,42)                           (2048) \n",
"AllLocalNearRings(64,35,32,43)                           (2560) \n",
"AllLocalNearRings(64,35,32,44)                           (2048) \n",
"AllLocalNearRings(64,35,32,46)                           (96)   \n",
"AllLocalNearRings(64,35,32,48)                           (80)   \n"); 

elif IdGroup(G)=[64,36] then
Print(
"There are 15761 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,36,32,6)                            (512)  \n",
"AllLocalNearRings(64,36,32,11)                           (4608) \n",
"AllLocalNearRings(64,36,32,22)                           (64)   \n",
"AllLocalNearRings(64,36,32,24)                           (80)   \n",
"AllLocalNearRings(64,36,32,25)                           (288)  \n",
"AllLocalNearRings(64,36,32,27)                           (680)  \n",
"AllLocalNearRings(64,36,32,28)                           (1153) \n",
"AllLocalNearRings(64,36,32,29)                           (128)  \n",
"AllLocalNearRings(64,36,32,30)                           (704)  \n",
"AllLocalNearRings(64,36,32,31)                           (208)  \n",
"AllLocalNearRings(64,36,32,33)                           (128)  \n",
"AllLocalNearRings(64,36,32,34)                           (120)  \n",
"AllLocalNearRings(64,36,32,42)                           (2304) \n",
"AllLocalNearRings(64,36,32,43)                           (2560) \n",
"AllLocalNearRings(64,36,32,44)                           (2048) \n",
"AllLocalNearRings(64,36,32,46)                           (96)   \n",
"AllLocalNearRings(64,36,32,48)                           (80)   \n"); 

elif IdGroup(G)=[64,37] then
Print(
"There are 15920 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,37,32,6)                            (576)  \n",
"AllLocalNearRings(64,37,32,11)                           (4736) \n",
"AllLocalNearRings(64,37,32,22)                           (64)   \n",
"AllLocalNearRings(64,37,32,24)                           (64)   \n",
"AllLocalNearRings(64,37,32,25)                           (304)  \n",
"AllLocalNearRings(64,37,32,27)                           (704)  \n",
"AllLocalNearRings(64,37,32,28)                           (1192) \n",
"AllLocalNearRings(64,37,32,29)                           (128)  \n",
"AllLocalNearRings(64,37,32,30)                           (752)  \n",
"AllLocalNearRings(64,37,32,31)                           (192)  \n",
"AllLocalNearRings(64,37,32,33)                           (144)  \n",
"AllLocalNearRings(64,37,32,34)                           (96)   \n",
"AllLocalNearRings(64,37,32,42)                           (2048) \n",
"AllLocalNearRings(64,37,32,43)                           (2688) \n",
"AllLocalNearRings(64,37,32,44)                           (2048) \n",
"AllLocalNearRings(64,37,32,46)                           (120)  \n",
"AllLocalNearRings(64,37,32,48)                           (64)   \n"); 

elif IdGroup(G)=[64,44] then
Print(
"There are 28500 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,44,32,21)                           (864)  \n",
"AllLocalNearRings(64,44,32,22)                           (1632) \n",
"AllLocalNearRings(64,44,32,23)                           (2400) \n",
"AllLocalNearRings(64,44,32,24)                           (1632) \n",
"AllLocalNearRings(64,44,32,25)                           (7188) \n",
"AllLocalNearRings(64,44,32,28)                           (3360) \n",
"AllLocalNearRings(64,44,32,29)                           (3360) \n",
"AllLocalNearRings(64,44,32,30)                           (3264) \n",
"AllLocalNearRings(64,44,32,45)                           (864)  \n",
"AllLocalNearRings(64,44,32,46)                           (384)  \n",
"AllLocalNearRings(64,44,32,47)                           (384)  \n",
"AllLocalNearRings(64,44,32,48)                           (3168) \n");

elif IdGroup(G)=[64,45] then
Print(
"There are 1920 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,45,32,36)                           (64)  \n",
"AllLocalNearRings(64,45,32,37)                           (192) \n",
"AllLocalNearRings(64,45,32,40)                           (128) \n",
"AllLocalNearRings(64,45,32,41)                           (128) \n",
"AllLocalNearRings(64,45,32,42)                           (128) \n",
"AllLocalNearRings(64,45,32,43)                           (320) \n",
"AllLocalNearRings(64,45,32,44)                           (576) \n",
"AllLocalNearRings(64,45,32,45)                           (32)  \n",
"AllLocalNearRings(64,45,32,46)                           (32)  \n",
"AllLocalNearRings(64,45,32,47)                           (32)  \n",
"AllLocalNearRings(64,45,32,48)                           (288) \n");

elif IdGroup(G)=[64,50] then
Print(
"There are 257 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,50,32,36)                          (65)  \n",
"AllLocalNearRings(64,50,32,37)                          (64)  \n",
"AllLocalNearRings(64,50,32,38)                          (128) \n");

elif IdGroup(G)=[64,51] then
Print(
"There are 257 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,51,32,36)                          (64)  \n",
"AllLocalNearRings(64,51,32,37)                          (64)  \n",
"AllLocalNearRings(64,51,32,38)                          (129) \n");

elif IdGroup(G)=[64,55] then
Print(
"There are more than 9 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,55,56,11)                          (6)  \n",
"AllLocalNearRings(64,55,56,13)                          (3)  \n");

elif IdGroup(G)=[64,82] then
Print(
"There are more than 9 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(64,82,56,11)                          (9)  \n");

#81
elif IdGroup(G)=[81,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(81,1,54,2)                          (1) \n");

elif IdGroup(G)=[81,2] then
Print(
"There are 268 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(81,2,54,3)                          (27)  \n",
"AllLocalNearRings(81,2,54,6)                          (55)  \n",
"AllLocalNearRings(81,2,54,9)                          (49)  \n",
"AllLocalNearRings(81,2,54,10)                         (11)  \n",
"AllLocalNearRings(81,2,54,11)                         (110) \n",
"AllLocalNearRings(81,2,54,15)                         (4)   \n",
"AllLocalNearRings(81,2,72,14)                         (2)   \n",
"AllLocalNearRings(81,2,72,19)                         (2)   \n",
"AllLocalNearRings(81,2,72,24)                         (4)   \n",
"AllLocalNearRings(81,2,72,26)                         (4)   \n");

elif IdGroup(G)=[81,3] then
Print(
"There are 46 local nearrings on this group. \n",
"AllLocalNearRings(81,3,54,12)                        (46) \n");

elif IdGroup(G)=[81,5] then
Print(
"There are 388 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(81,5,54,4)                         (10)  \n",
"AllLocalNearRings(81,5,54,9)                         (135) \n",
"AllLocalNearRings(81,5,54,11)                        (243) \n");

elif IdGroup(G)=[81,6] then
Print(
"There are 10 local nearrings on this group. \n",
"AllLocalNearRings(81,6,54,4)                          (10) \n");

elif IdGroup(G)=[81,11] then
Print(
"There are 22989 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(81,11,54,5)                         (45)    \n",
"AllLocalNearRings(81,11,54,8)                         (16)    \n",
"AllLocalNearRings(81,11,54,9)                         (13)    \n",
"AllLocalNearRings(81,11,54,10)                        (15006) \n",
"AllLocalNearRings(81,11,54,11)                        (24)    \n",
"AllLocalNearRings(81,11,54,12)                        (175)   \n",
"AllLocalNearRings(81,11,54,13)                        (30)    \n",
"AllLocalNearRings(81,11,54,15)                        (7680)  \n");

elif IdGroup(G)=[81,12] then
Print(
"There are 807 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(81,12,54,5)                          (417) \n",
"AllLocalNearRings(81,12,54,8)                          (30)  \n",
"AllLocalNearRings(81,12,54,12)                         (108) \n",
"AllLocalNearRings(81,12,54,13)                         (248) \n",
"AllLocalNearRings(81,12,72,39)                         (4)   \n");  

elif IdGroup(G)=[81,13] then
Print(
"There are 337 local nearrings on this group.    \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(81,13,54,5)                          (45)  \n",
"AllLocalNearRings(81,13,54,8)                          (55)  \n",
"AllLocalNearRings(81,13,54,12)                         (175) \n",
"AllLocalNearRings(81,13,54,13)                         (62)  \n");  

elif IdGroup(G)=[81,15] then
Print(
"There are 12352 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(81,15,54,3)                          (9)    \n",
"AllLocalNearRings(81,15,54,5)                          (391)  \n",
"AllLocalNearRings(81,15,54,6)                          (18)   \n",
"AllLocalNearRings(81,15,54,8)                          (10)   \n",
"AllLocalNearRings(81,15,54,9)                          (9)    \n",
"AllLocalNearRings(81,15,54,10)                         (7527) \n",
"AllLocalNearRings(81,15,54,11)                         (17)   \n",
"AllLocalNearRings(81,15,54,12)                         (87)   \n",
"AllLocalNearRings(81,15,54,13)                         (191)  \n",
"AllLocalNearRings(81,15,54,14)                         (167)  \n",
"AllLocalNearRings(81,15,54,15)                         (3896) \n",
"AllLocalNearRings(81,15,72,13)                         (2) \n",
"AllLocalNearRings(81,15,72,14)                         (2) \n",
"AllLocalNearRings(81,15,72,19)                         (4) \n",
"AllLocalNearRings(81,15,72,24)                         (4) \n",
"AllLocalNearRings(81,15,72,39)                         (10) \n");

#121
elif IdGroup(G)=[121,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(121,1,110,6)                           (1) \n");

elif IdGroup(G)=[121,2] then
Print(
"There are 15 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(121,2,110,1)                          (5) \n",
"AllLocalNearRings(121,2,110,2)                          (4) \n",
"AllLocalNearRings(121,2,110,4)                          (1) \n",
"AllLocalNearRings(121,2,110,6)                          (1) \n",
"AllLocalNearRings(121,2,120,4)                          (1) \n",
"AllLocalNearRings(121,2,120,5)                          (1) \n",
"AllLocalNearRings(121,2,120,15)                         (1) \n",
"AllLocalNearRings(121,2,120,21)                         (1) \n"); 

#125
elif IdGroup(G)=[125,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(125,1,100,2)                         (1) \n");

elif IdGroup(G)=[125,2] then
Print(
"There are 31 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(125,2,100,6)                         (15) \n",
"AllLocalNearRings(125,2,100,8)                         (13) \n",
"AllLocalNearRings(125,2,100,9)                         (3)  \n");

elif IdGroup(G)=[125,3] then
Print(
"There are 6 local nearrings on this group.      \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(125,3,100,9)                           (3) \n",
"AllLocalNearRings(125,3,100,10)                          (3) \n");

elif IdGroup(G)=[125,4] then
Print(
"There is 2 local nearring on this group. \n",
"AllLocalNearRings(125,4,100,9)                          (2) \n");

elif IdGroup(G)=[125,5] then
Print(
"There are 30 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(125,5,100,6)                          (5) \n",
"AllLocalNearRings(125,5,100,7)                          (1) \n",
"AllLocalNearRings(125,5,100,8)                          (7) \n",
"AllLocalNearRings(125,5,100,9)                          (3) \n",
"AllLocalNearRings(125,5,100,10)                         (5) \n",
"AllLocalNearRings(125,5,100,11)                         (5) \n",
"AllLocalNearRings(125,5,100,12)                         (3) \n",
"AllLocalNearRings(125,5,124,2)                          (1) \n");

#169
elif IdGroup(G)=[169,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(169,1,156,6)                         (1) \n");

elif IdGroup(G)=[169,2] then
Print(
"There are 15 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(169,2,156,1)                         (2) \n",
"AllLocalNearRings(169,2,156,2)                         (2) \n",
"AllLocalNearRings(169,2,156,4)                         (1) \n",
"AllLocalNearRings(169,2,156,6)                         (1) \n",
"AllLocalNearRings(169,2,156,7)                         (5) \n",
"AllLocalNearRings(169,2,156,9)                         (2) \n",
"AllLocalNearRings(169,2,168,4)                         (1) \n",
"AllLocalNearRings(169,2,168,6)                         (1) \n"); 

#243
elif IdGroup(G)=[243,2] then
Print(
"There are 119629 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,2,162,32)                          (12879) \n",
"AllLocalNearRings(243,2,162,33)                          (3351)  \n",
"AllLocalNearRings(243,2,162,35)                          (87)    \n",
"AllLocalNearRings(243,2,162,36)                          (96472) \n",
"AllLocalNearRings(243,2,162,37)                          (6810)  \n",
"AllLocalNearRings(243,2,162,51)                          (30)    \n");

elif IdGroup(G)=[243,10] then
Print(
"There are 119298 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,10,162,3)                           (477)   \n",
"AllLocalNearRings(243,10,162,6)                           (811)   \n",
"AllLocalNearRings(243,10,162,23)                          (21372) \n",
"AllLocalNearRings(243,10,162,25)                          (96531) \n",
"AllLocalNearRings(243,10,162,30)                          (36)    \n",
"AllLocalNearRings(243,10,162,31)                          (27)    \n",
"AllLocalNearRings(243,10,162,47)                          (6)     \n",
"AllLocalNearRings(243,10,162,49)                          (6)     \n",
"AllLocalNearRings(243,10,162,50)                          (32)    \n");

elif IdGroup(G)=[243,11] then
Print(
"There are 1288 local nearrings on this group.   \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,11,162,3)                          (477) \n",
"AllLocalNearRings(243,11,162,6)                          (811) \n");

elif IdGroup(G)=[243,12] then
Print(
"There are 29989 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,12,162,33)                          (10306) \n",
"AllLocalNearRings(243,12,162,37)                          (19683) \n");

elif IdGroup(G)=[243,13] then
Print(
"There are 139672 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,13,162,32)                          (2430)  \n",
"AllLocalNearRings(243,13,162,33)                          (90)    \n",
"AllLocalNearRings(243,13,162,34)                          (81811) \n",
"AllLocalNearRings(243,13,162,35)                          (6723)  \n",
"AllLocalNearRings(243,13,162,36)                          (32076) \n",
"AllLocalNearRings(243,13,162,37)                          (342)   \n",
"AllLocalNearRings(243,13,162,51)                          (3321)  \n",
"AllLocalNearRings(243,13,162,52)                          (12879) \n");

elif IdGroup(G)=[243,14] then
Print(
"There are 115020 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,14,162,32)                          (12393) \n",
"AllLocalNearRings(243,14,162,33)                          (3321)  \n",
"AllLocalNearRings(243,14,162,36)                          (92583) \n",
"AllLocalNearRings(243,14,162,37)                          (6723)  \n");

elif IdGroup(G)=[243,15] then
Print(
"There are 117783 local nearrings on this group. \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,15,162,32)                          (11961) \n",
"AllLocalNearRings(243,15,162,33)                          (3432)  \n",
"AllLocalNearRings(243,15,162,34)                          (5832)  \n",
"AllLocalNearRings(243,15,162,36)                          (89127) \n",
"AllLocalNearRings(243,15,162,37)                          (6702)  \n",
"AllLocalNearRings(243,15,162,52)                          (729)   \n");

elif IdGroup(G)=[243,16] then
Print(
"There are 59049 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,16,162,33)                          (19683) \n",
"AllLocalNearRings(243,16,162,37)                          (39366) \n");

elif IdGroup(G)=[243,23] then
Print(
"There are 3349 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,23,162,8)                           (28) \n",
"AllLocalNearRings(243,23,162,26)                          (1134) \n",
"AllLocalNearRings(243,23,162,27)                          (2187) \n");

elif IdGroup(G)=[243,24] then
Print(
"There are 28 local nearrings on this group.  \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(243,24,162,8)                          (28) \n");

#289
elif IdGroup(G)=[289,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(289,1,272,2)                          (1) \n");

elif IdGroup(G)=[289,2] then
Print(
"There are 19 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(289,2,272,1)                           (1) \n",
"AllLocalNearRings(289,2,272,2)                           (1) \n",
"AllLocalNearRings(289,2,272,3)                           (2) \n",
"AllLocalNearRings(289,2,272,28)                          (4) \n",
"AllLocalNearRings(289,2,272,50)                          (9) \n",
"AllLocalNearRings(289,2,288,1)                           (1) \n",
"AllLocalNearRings(289,2,288,2)                           (1) \n");

#343
elif IdGroup(G)=[343,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(343,1,294,6)                           (1) \n");

elif IdGroup(G)=[343,2] then
Print(
"There are 31 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(343,2,294,8)                            (3)  \n",
"AllLocalNearRings(343,2,294,15)                           (8)  \n",
"AllLocalNearRings(343,2,294,18)                           (3)  \n",
"AllLocalNearRings(343,2,294,23)                           (17) \n");

elif IdGroup(G)=[343,3] then
Print(
"There are 8 local nearrings on this group.      \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(343,3,294,8)                           (3) \n",
"AllLocalNearRings(343,3,294,9)                           (2) \n",
"AllLocalNearRings(343,3,294,11)                          (3) \n");

elif IdGroup(G)=[343,4] then
Print(
"There are 2 local nearrings on this group. \n",
"AllLocalNearRings(343,4,294,8)                           (2) \n");

elif IdGroup(G)=[343,5] then
Print(
"There are 46 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(343,5,294,8)                           (3) \n",
"AllLocalNearRings(343,5,294,9)                           (2) \n",
"AllLocalNearRings(343,5,294,10)                          (4) \n",
"AllLocalNearRings(343,5,294,11)                          (5) \n",
"AllLocalNearRings(343,5,294,12)                          (3) \n",
"AllLocalNearRings(343,5,294,13)                          (5) \n",
"AllLocalNearRings(343,5,294,14)                          (2) \n",
"AllLocalNearRings(343,5,294,15)                          (3) \n",
"AllLocalNearRings(343,5,294,16)                          (3) \n",
"AllLocalNearRings(343,5,294,17)                          (3) \n",
"AllLocalNearRings(343,5,294,18)                          (2) \n",
"AllLocalNearRings(343,5,294,19)                          (2) \n",
"AllLocalNearRings(343,5,294,23)                          (9) \n");

#361
elif IdGroup(G)=[361,1] then
Print(
"There is 1 local nearring on this group. \n",
"AllLocalNearRings(361,1,342,6)                          (1) \n"); 

elif IdGroup(G)=[361,2] then
Print(
"There are 21 local nearrings on this group.     \n",
"They are sorted by their multiplicative groups. \n",
"AllLocalNearRings(361,2,342,1)                           (2) \n",
"AllLocalNearRings(361,2,342,2)                           (2) \n",
"AllLocalNearRings(361,2,342,4)                           (1) \n",
"AllLocalNearRings(361,2,342,6)                           (1) \n",
"AllLocalNearRings(361,2,342,7)                           (7) \n",
"AllLocalNearRings(361,2,342,8)                           (6) \n",
"AllLocalNearRings(361,2,360,4)                           (1) \n",
"AllLocalNearRings(361,2,360,15)                          (1) \n"); 

#1331
elif IdGroup(G)=[1331,2] then
Print(
"There are 47 local nearrings on this group. \n",
"AllLocalNearRings(1331,2,1210,8)                           (5)  \n",
"AllLocalNearRings(1331,2,1210,18)                          (14) \n",
"AllLocalNearRings(1331,2,1210,22)                          (3)  \n",
"AllLocalNearRings(1331,2,1210,27)                          (25) \n"); 

elif IdGroup(G)=[1331,3] then
Print(
"There are 12 local nearrings on this group. \n",
"AllLocalNearRings(1331,3,1210,8)                           (3) \n",
"AllLocalNearRings(1331,3,1210,13)                          (2) \n",
"AllLocalNearRings(1331,3,1210,14)                          (2) \n",
"AllLocalNearRings(1331,3,1210,15)                          (3) \n",
"AllLocalNearRings(1331,3,1210,17)                          (2) \n"); 

elif IdGroup(G)=[1331,4] then
Print(
"There are 2 local nearrings on this group. \n",
"AllLocalNearRings(1331,4,1210,8)                           (2) \n"); 

elif IdGroup(G)=[1331,5] then
Print(
"There are 96 local nearrings on this group. \n",
"AllLocalNearRings(1331,5,1210,8)                           (5)  \n",
"AllLocalNearRings(1331,5,1210,9)                           (7)  \n",
"AllLocalNearRings(1331,5,1210,10)                          (4)  \n",
"AllLocalNearRings(1331,5,1210,11)                          (7)  \n",
"AllLocalNearRings(1331,5,1210,12)                          (5)  \n",
"AllLocalNearRings(1331,5,1210,13)                          (5)  \n",
"AllLocalNearRings(1331,5,1210,14)                          (5)  \n",
"AllLocalNearRings(1331,5,1210,15)                          (9)  \n",
"AllLocalNearRings(1331,5,1210,16)                          (6)  \n",
"AllLocalNearRings(1331,5,1210,17)                          (4)  \n",
"AllLocalNearRings(1331,5,1210,18)                          (5)  \n",
"AllLocalNearRings(1331,5,1210,19)                          (5)  \n",
"AllLocalNearRings(1331,5,1210,20)                          (3)  \n",
"AllLocalNearRings(1331,5,1210,21)                          (9)  \n",
"AllLocalNearRings(1331,5,1210,22)                          (2)  \n",
"AllLocalNearRings(1331,5,1210,23)                          (2)  \n",
"AllLocalNearRings(1331,5,1210,27)                          (13) \n"); 

else Error("group is not recognized in the library"); fi; 
end);

