#############################################################################
##
#W  PackageInfo.g                 LocalNR - a GAP package of local nearrings
##
#Y  Copyright (C) 2019                 Yaroslav Sysak with contributions by 
#Y                                          Iryna Raievska, Maryna Raievska 
##
##  Institute of Mathematics of National Academy of Sciences of Ukraine
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
SetPackageInfo( rec(
PackageName := "LocalNR",
Subtitle := "Package of local nearrings",
Version := "1.0.4",
Date := "15/03/2024",

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/gap-packages/", ~.PackageName ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := Concatenation( "https://gap-packages.github.io/", ~.PackageName ),
README_URL      := Concatenation( ~.PackageWWWHome, "/README.md" ),
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),
ArchiveFormats := ".tar.gz",
License := "GPL-3.0-or-later",
Persons := [
  rec( 
    LastName      := "Raievska",
    FirstNames    := "Iryna",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "raeirina@imath.kiev.ua",
    WWWHome       := "https://www.imath.kiev.ua/~algebra/Raievska_I/",
    PostalAddress := Concatenation( [
                     "Institute of Mathematics\n",
                     "National Academy of Sciences of Ukraine\n",
                     "01024 Ukraine, Kyiv, 3, Tereshchenkivska st." ] ),
    Place         := "Kyiv",
    Institution   := "Institute of Mathematics"
     ),
 rec( 
    LastName      := "Raievska",
    FirstNames    := "Maryna",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "raemarina@imath.kiev.ua",
    WWWHome       := "https://www.imath.kiev.ua/~algebra/Raievska_M/",
    PostalAddress := Concatenation( [
                     "Institute of Mathematics\n",
                     "National Academy of Sciences of Ukraine\n",
                     "01024 Ukraine, Kyiv, 3, Tereshchenkivska st." ] ),
    Place         := "Kyiv",
    Institution   := "Institute of Mathematics"
     ),
 rec( 
    LastName      := "Sysak",
    FirstNames    := "Yaroslav",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "sysak@imath.kiev.ua",
    WWWHome       := "https://www.imath.kiev.ua/~algebra/Sysak/",
    PostalAddress := Concatenation( [
                     "Institute of Mathematics\n",
                     "National Academy of Sciences of Ukraine\n",
                     "01024 Ukraine, Kyiv, 3, Tereshchenkivska st." ] ),
    Place         := "Kyiv",
    Institution   := "Institute of Mathematics"

     )
],  
Status := "dev",
PackageDoc := 
  rec(
  # use same as in GAP            
  BookName  := "LocalNR",
ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0_mj.html",
  PDFFile := "doc/manual.pdf",
  SixFile := "doc/manual.six",
  LongTitle := "a GAP package of local nearrings",

  Autoload  := true
),

AbstractHTML := 
"The <span class=\"pkgname\">LocalNR</span> package \
contains the library of local nearrings up to order 361 \
and some functions to analyze finite nearrings.",
   
Dependencies := rec(
  # GAP version, use version strings for specifying exact versions,
  # prepend a '>=' for specifying a least version.
  GAP := ">=4.7.8",
  # list of pairs [package name, (least) version],  package name is case
  # insensitive, least version denoted with '>=' prepended to version string.
  # without these, the package will not load
  # NeededOtherPackages := [["GAPDoc", ">= 0.99"]],
  NeededOtherPackages := [["SONATA", ">= 2.4"]],
  # without these the package will issue a warning while loading
  # SuggestedOtherPackages := [],
  SuggestedOtherPackages := [],
  # needed external conditions (programs, operating system, ...)  provide
  # just strings as text or
  # pairs [text, URL] where URL  provides further information
  # about that point.
  # (no automatic test will be done for this, do this in your
  # 'AvailabilityTest' function below)
  # ExternalConditions := []
  ExternalConditions := []
),

BannerString := Concatenation( 
"------------------------------------------------------------------------------",
"-------\n",
  "Loading LocalNR ", ~.Version, "\n",
  "by ", ~.Persons[3].FirstNames, " ", ~.Persons[3].LastName,
        " (", ~.Persons[3].WWWHome, ")\n",
  "with contributions by:\n",
  ~.Persons[1].FirstNames, " ", ~.Persons[1].LastName,
        " (", ~.Persons[1].WWWHome, ")\n",
  " and ",~.Persons[2].FirstNames, " ", ~.Persons[2].LastName,
        " (", ~.Persons[2].WWWHome, ")\n",
"\n LocalNR - a package of local nearrings",
"\n http://www.imath.kiev.ua/~algebra/LocalNR/",
"\n ----------------------------------------------------------------------------- \n"),

TestFile := "tst/testall.g",
AvailabilityTest := ReturnTrue,
Keywords := ["local nearring", "endomorphism", "automorphisms group"]


));



