LoadPackage("AutoDoc");

AutoDoc( "LocalNR" : scaffold := true, autodoc :=
         rec(
         scan_dirs := [ "lib"] )
);

QUIT;
