LoadPackage("AutoDoc");

AutoDoc(rec(
    scaffold := true,
    autodoc := rec(
        scan_dirs := [ "lib" ],
    ),
));

QUIT;
