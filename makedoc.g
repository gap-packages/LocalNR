LoadPackage("AutoDoc");

AutoDoc(rec(
    scaffold := true,
    autodoc := rec(
        extract_examples := true,
        scan_dirs := [ "lib" ],
    ),
));

QUIT;
