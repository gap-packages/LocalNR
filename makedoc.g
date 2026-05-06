LoadPackage("AutoDoc");

AutoDoc(rec(
    scaffold := true,
    extract_examples := true,
    autodoc := rec(
        scan_dirs := [ "lib" ],
    ),
));

QUIT;
