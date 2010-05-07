#!/bin/sh
#
# Copyright (C) 2008 Imendio AB
#
# Note: This is an overly simplistic packager, it adds all header
# files for instance, of which many are private. When all the
# makefiles have gained proper install rules, we can use the installed
# directories instead.
#

# Make sure not to use builtin, since it doesn't support -n o darwin...
ECHO=`which echo`

list_filtered_files()
{
    root=$1
    pattern=$2
    recursive=$4
    optional=$5

    if [ x$recursive == x ]; then
        recursive=yes
    fi

    if [ $recursive == yes ]; then
        files=`find $root -name "$pattern"`
    else
        files=`ls $root/$pattern`
    fi

    if [ x$optional == x ]; then
        optional=no
    fi

    # Filter out files from any tests/ directories or static libs.
    for f in $files; do
        if [ `echo $f | grep /tests/` ]; then
            continue
        fi
        if [ `echo $f | grep s.lib` ]; then
            continue
        fi

        echo set current_src=$f
        echo set current_dst=$3
        if [ $optional == yes ]; then
            echo if exist \"$f\" copy \"$f\" $3 \>NUL | sed -e 's,/,\\,g'
        else
            echo copy \"$f\" $3 \>NUL | sed -e 's,/,\\,g'
            echo if errorlevel 1 goto bail
        fi
    done
}

# Create dist skeleton.
cat <<EOF
@echo off
if "%1"=="" if "%_CONFIG%"=="" goto usage

set dist=%1
if not "%_CONFIG%"=="" set dist=C:\gtk\%_CONFIG%

set pbin=%dist%\\bin
set plib=%dist%\\lib
set pinc=%dist%\\include

if exist %dist% (
echo Directory %dist% already exists, please remove it and try again && goto done)

echo Creating directory hierarchy in %dist%
mkdir %dist%
if not exist %pbin% mkdir %pbin%
if not exist %pinc% mkdir %pinc%
if not exist %pinc%\glib-2.0 mkdir %pinc%\glib-2.0
if not exist %pinc%\glib-2.0\glib mkdir %pinc%\glib-2.0\glib
if not exist %pinc%\glib-2.0\gobject mkdir %pinc%\glib-2.0\gobject
if not exist %pinc%\pango-1.0 mkdir %pinc%\pango-1.0
if not exist %pinc%\pango-1.0\pango mkdir %pinc%\pango-1.0\pango
if not exist %pinc%\atk-1.0 mkdir %pinc%\atk-1.0
if not exist %pinc%\atk-1.0\atk mkdir %pinc%\atk-1.0\atk
if not exist %pinc%\cairo mkdir %pinc%\cairo
if not exist %pinc%\gtk-2.0 mkdir %pinc%\gtk-2.0
if not exist %pinc%\gtk-2.0\gdk-pixbuf mkdir %pinc%\gtk-2.0\gdk-pixbuf
if not exist %pinc%\gtk-2.0\gdk mkdir %pinc%\gtk-2.0\gdk
if not exist %pinc%\gtk-2.0\gtk mkdir %pinc%\gtk-2.0\gtk
if not exist %plib% mkdir %plib%
if not exist %plib%\glib-2.0 mkdir %plib%\glib-2.0
if not exist %plib%\glib-2.0\include mkdir %plib%\glib-2.0\include
if not exist %plib%\gtk-2.0 mkdir %plib%\gtk-2.0
if not exist %plib%\gtk-2.0\include mkdir %plib%\gtk-2.0\include
if not exist %plib%\engines mkdir %plib%\engines

EOF

# Those are the packages involved:
#
# iconv: only static, no installation required

# gettext: gettext-runtime/ dll, lib, headers
echo "echo Copying gettext"
list_filtered_files gettext-0.17/gettext-runtime "intl.dll" %pbin%
list_filtered_files gettext-0.17/gettext-runtime "intl.pdb" %pbin% yes yes
list_filtered_files gettext-0.17/gettext-runtime "intl.lib" %plib%
list_filtered_files gettext-0.17/gettext-runtime "libintl.h" %pinc%
echo

# zlib:  zlib1.dll, zdll.lib, zconf.h, zlib.h
echo "echo Copying zlib"
list_filtered_files zlib-1.2.3 "zlib1.dll" %pbin%
list_filtered_files zlib-1.2.3 "zdll.lib" %plib%
list_filtered_files zlib-1.2.3 "zlib.h" %pinc%
list_filtered_files zlib-1.2.3 "zconf.h" %pinc%
echo

# libpng: libpng.dll, png.lib and headers (png.h, pngconf.h)
echo "echo Copying libpng"
list_filtered_files libpng-1.2.26 "libpng.dll" %pbin%
list_filtered_files libpng-1.2.26 "png.lib" %plib%
list_filtered_files libpng-1.2.26 "png.h" %pinc%
list_filtered_files libpng-1.2.26 "pngconf.h" %pinc%
echo

# glib: lib*.dll, *.lib, executables, headers + glibconfig.h
echo "echo Copying glib"
list_filtered_files glib-2.14.6 "lib*.dll" %pbin%
list_filtered_files glib-2.14.6 "lib*.pdb" %pbin% yes yes
list_filtered_files glib-2.14.6 "g*-2*.lib" %plib%

list_filtered_files glib-2.14.6/gobject "g*.exe" %pbin% no
list_filtered_files glib-2.14.6/gobject "g*.exe.manifest" %pbin% no yes
list_filtered_files glib-2.14.6/gobject "glib-mkenums" %pbin% no

list_filtered_files glib-2.14.6/glib "*.h" %pinc%/glib-2.0/glib no
list_filtered_files glib-2.14.6/glib "glib.h" %pinc%/glib-2.0 no
list_filtered_files glib-2.14.6/glib "glib-object.h" %pinc%/glib-2.0 no
list_filtered_files glib-2.14.6/gmodule "gmodule.h" %pinc%/glib-2.0 no
list_filtered_files glib-2.14.6/gmodule "*.h" %pinc%/glib-2.0/gmodule no
list_filtered_files glib-2.14.6/gobject "*.h" %pinc%/glib-2.0/gobject no
list_filtered_files glib-2.14.6 "glibconfig.h" %plib%/glib-2.0/include no
echo

# dirent: dirent.dll, dirent.lib, dirent.pdb, headers
echo "echo Copying dirent"
list_filtered_files glib-2.14.6/build/win32/dirent "dirent.dll" %pbin%
list_filtered_files glib-2.14.6/build/win32/dirent "dirent.pdb" %pbin% yes yes
list_filtered_files glib-2.14.6/build/win32/dirent "dirent.lib" %plib%
list_filtered_files glib-2.14.6/build/win32/dirent "dirent.h" %pinc%/ no
echo

# cairo: dll, lib, header
echo "echo Copying cairo"
list_filtered_files cairo-1.4.14/src "cairo.dll" %pbin% no
list_filtered_files cairo-1.4.14/src "cairo.pdb" %pbin% no yes
list_filtered_files cairo-1.4.14/src "cairo.lib" %plib% no
list_filtered_files cairo-1.4.14/src "cairo.h" %pinc%/cairo no
list_filtered_files cairo-1.4.14/src "cairo-features.h" %pinc%/cairo no
list_filtered_files cairo-1.4.14/src "cairo-deprecated.h" %pinc%/cairo no
list_filtered_files cairo-1.4.14/src "cairo-ps.h" %pinc%/cairo no
list_filtered_files cairo-1.4.14/src "cairo-pdf.h" %pinc%/cairo no
list_filtered_files cairo-1.4.14/src "cairo-svg.h" %pinc%/cairo no
list_filtered_files cairo-1.4.14/src "cairo-win32.h" %pinc%/cairo no
echo

# pango: dll, lib, headers
echo "echo Copying pango"
list_filtered_files pango-1.18.4/pango "libpango*.dll" %pbin%
list_filtered_files pango-1.18.4/pango "libpango*.pdb" %pbin% yes yes
list_filtered_files pango-1.18.4/pango "pango*.lib" %plib%
list_filtered_files pango-1.18.4/pango "pango*.h" %pinc%/pango-1.0/pango no
echo

# atk: dll, lib, headers
echo "echo Copying atk"
list_filtered_files atk-1.22.0/atk "libatk*.dll" %pbin% no
list_filtered_files atk-1.22.0/atk "libatk*.pdb" %pbin% no yes
list_filtered_files atk-1.22.0/atk "atk*.lib" %plib% no
list_filtered_files atk-1.22.0/atk "atk*.h" %pinc%/atk-1.0/atk no
echo

# gtk: dll, lib, headers, executables
echo "echo Copying gdk-pixbuf"
list_filtered_files gtk+-2.12.9/gdk-pixbuf "lib*.dll" %pbin% no
list_filtered_files gtk+-2.12.9/gdk-pixbuf "lib*.pdb" %pbin% no yes
list_filtered_files gtk+-2.12.9/gdk-pixbuf "*.lib" %plib% no
list_filtered_files gtk+-2.12.9/gdk-pixbuf "gdk-pixbuf-csource.exe" %pbin% no
list_filtered_files gtk+-2.12.9/gdk-pixbuf "gdk-pixbuf-csource.exe.manifest" %pbin% no yes
list_filtered_files gtk+-2.12.9/gdk-pixbuf "*.h" %pinc%/gtk-2.0/gdk-pixbuf no

echo "echo Copying gdk"
list_filtered_files gtk+-2.12.9/gdk "lib*.dll" %pbin% no
list_filtered_files gtk+-2.12.9/gdk "lib*.pdb" %pbin% no yes
list_filtered_files gtk+-2.12.9/gdk "*.lib" %plib% no
list_filtered_files gtk+-2.12.9/gdk "*.h" %pinc%/gtk-2.0/gdk no
list_filtered_files gtk+-2.12.9/gdk "gdkconfig.h" %plib%/gtk-2.0/include no
# Remove the wrongly copied gdkconfig.h...
echo del %pinc%\\gtk-2.0\\gdk\\gdkconfig.h

echo "echo Copying pixbuf theme"
list_filtered_files gtk+-2.12.9/modules/engines/pixbuf "libpixmap.dll" %plib%/engines no
#list_filtered_files gtk+-2.12.9/modules/engines/pixbuf "libpixmap.pdb" %plib%/engines no yes

echo "echo Copying gtk"
list_filtered_files gtk+-2.12.9/gtk "lib*.dll" %pbin% no
list_filtered_files gtk+-2.12.9/gtk "lib*.pdb" %pbin% no yes
list_filtered_files gtk+-2.12.9/gtk "gtk-win32*.lib" %plib% no
list_filtered_files gtk+-2.12.9/gtk "gtk-*.exe" %pbin% no
list_filtered_files gtk+-2.12.9/gtk "gtk-*.exe.manifest" %pbin% no yes
list_filtered_files gtk+-2.12.9/gtk "*.h" %pinc%/gtk-2.0/gtk no

# Ignore this for now since it's not always built.
#list_filtered_files gtk+-2.12.9/tests/ "testgtk.exe" %pbin% no

cat <<EOF

echo Done

goto done

:bail
echo Could not copy %current_src% to %current_dst%
goto done

:usage
echo Usage: %0 path
echo.
echo This script creates a folder inside the given path and copies in
echo the binary distribution of GTK+ and its dependencies. If no path
echo is specified, the currently chosen gtkenv build configuration is used
echo to decide (C:\gtk\<config>).
echo.

:done

set dist=
set pbin=
set plib=
set pinc=
set current_src=
set current_dst=

EOF
