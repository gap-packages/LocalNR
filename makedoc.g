LoadPackage("AutoDoc");

AutoDoc( "LocalNR" : scaffold := true, autodoc :=
         rec(
  extract_examples := true,
         scan_dirs := [ "lib"] )
);

QUIT;
