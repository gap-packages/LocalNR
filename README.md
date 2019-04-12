[![Build Status](https://travis-ci.org/gap-packages/LocalNR.svg?branch=master)](https://travis-ci.org/gap-packages/LocalNR)
[![Code Coverage](https://codecov.io/github/gap-packages/LocalNR/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/LocalNR)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+                                                                           +
+   Copyright (C) 2019               Yaroslav Sysak with contributions by   +
+                                         Iryna Raievska, Maryna Raievska   +
+                                                                           +
+   'LocalNR' is free software: you can redistribute it and/or modify       +
+   it under the terms of the GNU General Public License as published by    +
+   the Free Software Foundation, either version 3 of the license, or       +
+   (at your option) any later version.                                     +
+                                                                           +
+   'LocalNR' is distributed in the hope that it will be useful,            +
+   but WITHOUT ANY WARRANTY; without even the implied warranty of          +
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           +
+   GNU General Public License for more details.                            +
+                                                                           +
+   A copy of the GNU General Public License is available in the file       +
+   'GPLv3'; or for later versions see <http://www.gnu.org/licenses/>.      +
+                                                                           +
+   You can find information on how to contact us at the end of the         +
+   README file and on the front page of the documentation.                 +
+                                                                           +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

       This is the 
                   README
                   ======
                          file for the
                                       GAP 4
                                       =====
                                             package
                                                     'LocalNR'.
                                                     ===========

The 'LocalNR' package contains the library of local nearrings up to order 361 
and some functions to analyze finite nearrings.


--------------
 Requirements
--------------

This software is written for GAP 4. It requires an existing installation of
GAP (see www.gap-system.org) in version 4.7.8 or higher.

***operating system***
The current version of 'LocalNR' was created for use under Unix. It will
also work under Windows but only if all files in the directory
'LocalNR/data' and all of its subdirectories are uncompressed.

***RAM***
Working with 'LocalNR' can be memory expensive. We recommend to have at
least 2 GB of RAM available. 

***disk space***
As the data in the library is compressed, 1 GB of disk space will be 
sufficient to install 'LocalNR' under Unix. To use the library under
Windows the data has to be uncompressed and will then occupy approx. 7 GB.

--------------
 Installation
--------------

The installation follows standard GAP rules as outlined in the following
steps; see Section 74.1 in the reference manual of GAP for further details:

1) Download one of the archives 'localnr.tar.gz' or 'localnr.zip' from

       https://gap-packages.github.io/LocalNR/

2) Move the archive inside a 'pkg' directory. This can be either the main
   'pkg' directory in your GAP installation or your personal 'pkg' directory.

3) Complete the installation by unpacking the archive, e.g. under Linux type 

       tar -xzf localnr.tar.gz

   at the prompt for the gzipped tar-archive. A subdirectory 'LocalNR'
   will be created inside the 'pkg' directory.

----------
 Contents
----------

After installation the folder 'LocalNR' should contain the subdirectories

    Endom, doc, lib, tst

and the files

    init.g, PackageInfo.g, read.g, GPLv3, CHANGELOG, README.txt and makedoc.g

---------
 Loading
---------

To use the package type 'LoadPackage("LocalNR");' at the GAP prompt.


---------
 Contact
---------

If you use 'LocalNR', please tell us by sending an email to
<raeirina@imath.kiev.ua>, <raemarina@imath.kiev.ua>, <sysak@imath.kiev.ua>.

If you find any bugs or have any suggestions or comments, we would
very much appreciate it if you would let us know. Also, we would like
to hear about applications of this software.

Yaroslav Sysak, Iryna Raievska, Maryna Raievska   
Kyiv, 2th of February 2017.

Yaroslav Sysak 
  Institute of Mathematics 
  of National Academy of Sciences of Ukraine
  01024, Ukraine, Kyiv, 
  3, Tereshchenkivska st.

Iryna Raievska 
  Institute of Mathematics 
  of National Academy of Sciences of Ukraine
  01024, Ukraine, Kyiv, 
  3, Tereshchenkivska st.

Maryna Raievska  
  Institute of Mathematics 
  of National Academy of Sciences of Ukraine
  01024, Ukraine, Kyiv, 
  3, Tereshchenkivska st.


