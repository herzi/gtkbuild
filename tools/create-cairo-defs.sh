#!/bin/sh
#
# This script creates the cairo def file. It should be ran from a UNIX
# environment in the cairo source code. This is a temporary solution
# until a proper nmake rule that works in windows has been written.
#
# Copied and modified from the cairo makefile.msc.
#

cairo_headers="cairo.h cairo-pdf.h cairo-ps.h cairo-svg.h cairo-win32.h"

(echo EXPORTS; \
    (cat $cairo_headers || echo 'cairo_ERROR ()' ) | \
    grep -v -E '^# *include' | \
    ( gcc -include cairo-features.h.win32 -E - || echo 'cairo_ERROR ()' ) | \
    grep -E '^_?cairo_.* \(' | \
    sed -e 's/[     ].*//' | \
    sort; \
    echo LIBRARY cairo.dll; \
    ) > cairo.def


