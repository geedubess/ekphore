Some Kontakt libraries might be missing a .nicnt file. That is unfortunate, as
some of the data in those files might be needed to unlock them.

Fortunately, it seems others have compiled lists of those, so here's an example
implementation to take a header file and convert it to a local xml file that
can be loaded by ekphore. Ekphore will read the path to that file from an
environment variable.

EXAMPLE_URL="https://codeberg.org/ClaudiaCoord/KONTAKT-Instruments-library-ID-Checker-Tools/raw/branch/main/src/libni/h/NiSNPID-list.h"
curl $EXAMPLE_URL | ./generate-product-hints.awk > productHints.xml
export EKPHORE_PRODUCT_HINTS_PATH=$(pwd)/productHints.xml
