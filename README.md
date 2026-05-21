[![CI](https://github.com/gap-packages/LocalNR/workflows/CI/badge.svg)](https://github.com/gap-packages/LocalNR/actions?query=workflow%3ACI+branch%3Amaster)
[![Code Coverage](https://codecov.io/github/gap-packages/LocalNR/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/LocalNR)


# GAP package LocalNR

----------------------------------------------------------------------

Copyright (C) 2019-2026
Yaroslav Sysak with contributions by Iryna Raievska, Maryna Raievska

`LocalNR` is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the license, or
(at your option) any later version.

`LocalNR` is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

A copy of the GNU General Public License is available in the file
`GPLv3`; or for later versions see <https://www.gnu.org/licenses/>.

You can find information on how to contact us at the end of the
README file and on the front page of the documentation.

----------------------------------------------------------------------

The `LocalNR` package contains the library of local nearrings of small
orders and some functions to analyze finite nearrings.

To check which orders are represented in the library, see the content
of the Endom directory. The library is complete up to isomorphism
for local nearrings of orders 4, 8, 9, 16, 25, 27, 49, 81, 121, 125,
169, 289, 343, 361 and 1331.

For local nearrings of orders 32, 64, 128, 243 and 625 the library
provides classifications of some classes of nearrings, determined by
their additive group.

## Requirements

This software is written for GAP 4. It requires an existing installation
of GAP (see <https://www.gap-system.org>) in version 4.10.0 or higher.

## Installation

The installation follows standard GAP rules as outlined in the following
steps (see `?Installing a GAP Package` in GAP for further details):

1. Download archive `LocalNR-X.Y.Z.tar.gz` of the most recent release
from <https://gap-packages.github.io/LocalNR/>.

2. Move the archive inside a `pkg` directory. This can be either the main
`pkg` directory in your GAP installation or your personal `pkg` directory.

3. Complete the installation by unpacking the archive, e.g. under Linux type 

    tar -xzf LocalNR-X.Y.Z.tar.gz

at the terminal prompt. A subdirectory `LocalNR` will be created inside
the `pkg` directory.

## Loading

To use the package type

    LoadPackage("LocalNR");
    
at the GAP prompt.

## Acknowledgement

The authors of the package express their gratitude to GAP developers, 
especially Max Horn for useful remarks and package improvements, 
Chris Jefferson for converting the data to the much more compact representation, 
Olexandr Konovalov for permanent support.

## Contact

If you use `LocalNR`, please tell us by sending an email to package maintainers:
<raeirina@imath.kiev.ua>, <raemarina@imath.kiev.ua>.

If you find any bugs or have any suggestions or comments, we would
very much appreciate it if you would let us know either by email or
via <https://github.com/gap-packages/LocalNR/issues> on GitHub. Also,
we would like to hear about applications of this software.

Yaroslav Sysak, Iryna Raievska, Maryna Raievska   

Institute of Mathematics of National Academy of Sciences of Ukraine

01024, Ukraine, Kyiv, 3, Tereshchenkivska st.

