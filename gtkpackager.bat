@echo off
if "%1"=="" if "%_CONFIG%"=="" goto usage

set dist=%1
if not "%_CONFIG%"=="" set dist=C:\gtk\%_CONFIG%

set pbin=%dist%\bin
set plib=%dist%\lib
set pinc=%dist%\include

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

echo Copying gettext
set current_src=gettext-0.17/gettext-runtime/intl/intl.dll
set current_dst=%pbin%
copy "gettext-0.17\gettext-runtime\intl\intl.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=gettext-0.17/gettext-runtime/intl/intl.pdb
set current_dst=%pbin%
if exist "gettext-0.17\gettext-runtime\intl\intl.pdb" copy "gettext-0.17\gettext-runtime\intl\intl.pdb" %pbin% >NUL
set current_src=gettext-0.17/gettext-runtime/intl/intl.lib
set current_dst=%plib%
copy "gettext-0.17\gettext-runtime\intl\intl.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=gettext-0.17/gettext-runtime/intl/libintl.h
set current_dst=%pinc%
copy "gettext-0.17\gettext-runtime\intl\libintl.h" %pinc% >NUL
if errorlevel 1 goto bail

echo Copying zlib
set current_src=zlib-1.2.3/zlib1.dll
set current_dst=%pbin%
copy "zlib-1.2.3\zlib1.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=zlib-1.2.3/zdll.lib
set current_dst=%plib%
copy "zlib-1.2.3\zdll.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=zlib-1.2.3/zlib.h
set current_dst=%pinc%
copy "zlib-1.2.3\zlib.h" %pinc% >NUL
if errorlevel 1 goto bail
set current_src=zlib-1.2.3/zconf.h
set current_dst=%pinc%
copy "zlib-1.2.3\zconf.h" %pinc% >NUL
if errorlevel 1 goto bail

echo Copying libpng
set current_src=libpng-1.2.26/libpng.dll
set current_dst=%pbin%
copy "libpng-1.2.26\libpng.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=libpng-1.2.26/png.lib
set current_dst=%plib%
copy "libpng-1.2.26\png.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=libpng-1.2.26/png.h
set current_dst=%pinc%
copy "libpng-1.2.26\png.h" %pinc% >NUL
if errorlevel 1 goto bail
set current_src=libpng-1.2.26/pngconf.h
set current_dst=%pinc%
copy "libpng-1.2.26\pngconf.h" %pinc% >NUL
if errorlevel 1 goto bail

echo Copying glib
set current_src=glib-2.14.6/glib/libglib-2.0-0.dll
set current_dst=%pbin%
copy "glib-2.14.6\glib\libglib-2.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gmodule/libgmodule-2.0-0.dll
set current_dst=%pbin%
copy "glib-2.14.6\gmodule\libgmodule-2.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/libgobject-2.0-0.dll
set current_dst=%pbin%
copy "glib-2.14.6\gobject\libgobject-2.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gthread/libgthread-2.0-0.dll
set current_dst=%pbin%
copy "glib-2.14.6\gthread\libgthread-2.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/libglib-2.0-0.pdb
set current_dst=%pbin%
if exist "glib-2.14.6\glib\libglib-2.0-0.pdb" copy "glib-2.14.6\glib\libglib-2.0-0.pdb" %pbin% >NUL
set current_src=glib-2.14.6/gmodule/libgmodule-2.0-0.pdb
set current_dst=%pbin%
if exist "glib-2.14.6\gmodule\libgmodule-2.0-0.pdb" copy "glib-2.14.6\gmodule\libgmodule-2.0-0.pdb" %pbin% >NUL
set current_src=glib-2.14.6/gobject/libgobject-2.0-0.pdb
set current_dst=%pbin%
if exist "glib-2.14.6\gobject\libgobject-2.0-0.pdb" copy "glib-2.14.6\gobject\libgobject-2.0-0.pdb" %pbin% >NUL
set current_src=glib-2.14.6/gthread/libgthread-2.0-0.pdb
set current_dst=%pbin%
if exist "glib-2.14.6\gthread\libgthread-2.0-0.pdb" copy "glib-2.14.6\gthread\libgthread-2.0-0.pdb" %pbin% >NUL
set current_src=glib-2.14.6/glib/glib-2.0.lib
set current_dst=%plib%
copy "glib-2.14.6\glib\glib-2.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gmodule/gmodule-2.0.lib
set current_dst=%plib%
copy "glib-2.14.6\gmodule\gmodule-2.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gobject-2.0.lib
set current_dst=%plib%
copy "glib-2.14.6\gobject\gobject-2.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gthread/gthread-2.0.lib
set current_dst=%plib%
copy "glib-2.14.6\gthread\gthread-2.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/glib-genmarshal.exe
set current_dst=%pbin%
copy "glib-2.14.6\gobject\glib-genmarshal.exe" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gobject-query.exe
set current_dst=%pbin%
copy "glib-2.14.6\gobject\gobject-query.exe" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/glib-genmarshal.exe.manifest
set current_dst=%pbin%
if exist "glib-2.14.6\gobject\glib-genmarshal.exe.manifest" copy "glib-2.14.6\gobject\glib-genmarshal.exe.manifest" %pbin% >NUL
set current_src=glib-2.14.6/gobject/gobject-query.exe.manifest
set current_dst=%pbin%
if exist "glib-2.14.6\gobject\gobject-query.exe.manifest" copy "glib-2.14.6\gobject\gobject-query.exe.manifest" %pbin% >NUL
set current_src=glib-2.14.6/gobject/glib-mkenums
set current_dst=%pbin%
copy "glib-2.14.6\gobject\glib-mkenums" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/galias.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\galias.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/galloca.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\galloca.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/garray.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\garray.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gasyncqueue.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gasyncqueue.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gatomic.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gatomic.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gbacktrace.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gbacktrace.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gbase64.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gbase64.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gbookmarkfile.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gbookmarkfile.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gbsearcharray.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gbsearcharray.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gcache.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gcache.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gcompletion.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gcompletion.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gconvert.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gconvert.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gdataset.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gdataset.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gdatasetprivate.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gdatasetprivate.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gdate.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gdate.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gdebug.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gdebug.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gdir.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gdir.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gerror.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gerror.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gfileutils.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gfileutils.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/ghash.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\ghash.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/ghook.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\ghook.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gi18n-lib.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gi18n-lib.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gi18n.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gi18n.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/giochannel.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\giochannel.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gkeyfile.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gkeyfile.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/glib-object.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\glib-object.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/glib.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\glib.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/glibintl.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\glibintl.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/glist.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\glist.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gmacros.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gmacros.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gmain.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gmain.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gmappedfile.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gmappedfile.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gmarkup.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gmarkup.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gmem.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gmem.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gmessages.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gmessages.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gmirroringtable.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gmirroringtable.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gnode.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gnode.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/goption.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\goption.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gpattern.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gpattern.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gprimes.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gprimes.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gprintf.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gprintf.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gprintfint.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gprintfint.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gqsort.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gqsort.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gquark.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gquark.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gqueue.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gqueue.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/grand.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\grand.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gregex.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gregex.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/grel.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\grel.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gscanner.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gscanner.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gscripttable.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gscripttable.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gsequence.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gsequence.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gshell.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gshell.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gslice.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gslice.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gslist.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gslist.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gspawn.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gspawn.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gstdio.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gstdio.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gstrfuncs.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gstrfuncs.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gstring.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gstring.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gthread.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gthread.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gthreadpool.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gthreadpool.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gthreadprivate.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gthreadprivate.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gtimer.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gtimer.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gtree.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gtree.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gtypes.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gtypes.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gunibreak.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gunibreak.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gunichartables.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gunichartables.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gunicode.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gunicode.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gunicodeprivate.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gunicodeprivate.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gunicomp.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gunicomp.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gunidecomp.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gunidecomp.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gutils.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gutils.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/gwin32.h
set current_dst=%pinc%/glib-2.0/glib
copy "glib-2.14.6\glib\gwin32.h" %pinc%\glib-2.0\glib >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/glib.h
set current_dst=%pinc%/glib-2.0
copy "glib-2.14.6\glib\glib.h" %pinc%\glib-2.0 >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glib/glib-object.h
set current_dst=%pinc%/glib-2.0
copy "glib-2.14.6\glib\glib-object.h" %pinc%\glib-2.0 >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gmodule/gmodule.h
set current_dst=%pinc%/glib-2.0
copy "glib-2.14.6\gmodule\gmodule.h" %pinc%\glib-2.0 >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gmodule/gmodule.h
set current_dst=%pinc%/glib-2.0/gmodule
copy "glib-2.14.6\gmodule\gmodule.h" %pinc%\glib-2.0\gmodule >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gmodule/gmoduleconf.h
set current_dst=%pinc%/glib-2.0/gmodule
copy "glib-2.14.6\gmodule\gmoduleconf.h" %pinc%\glib-2.0\gmodule >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gboxed.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gboxed.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gclosure.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gclosure.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/genums.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\genums.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gmarshal.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gmarshal.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gobject.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gobject.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gobjectalias.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gobjectalias.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gparam.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gparam.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gparamspecs.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gparamspecs.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gsignal.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gsignal.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gsourceclosure.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gsourceclosure.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gtype.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gtype.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gtypemodule.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gtypemodule.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gtypeplugin.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gtypeplugin.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gvalue.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gvalue.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gvaluearray.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gvaluearray.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gvaluecollector.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gvaluecollector.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/gvaluetypes.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\gvaluetypes.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/gobject/stamp-gmarshal.h
set current_dst=%pinc%/glib-2.0/gobject
copy "glib-2.14.6\gobject\stamp-gmarshal.h" %pinc%\glib-2.0\gobject >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/glibconfig.h
set current_dst=%plib%/glib-2.0/include
copy "glib-2.14.6\glibconfig.h" %plib%\glib-2.0\include >NUL
if errorlevel 1 goto bail

echo Copying dirent
set current_src=glib-2.14.6/build/win32/dirent/dirent.dll
set current_dst=%pbin%
copy "glib-2.14.6\build\win32\dirent\dirent.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/build/win32/dirent/dirent.pdb
set current_dst=%pbin%
if exist "glib-2.14.6\build\win32\dirent\dirent.pdb" copy "glib-2.14.6\build\win32\dirent\dirent.pdb" %pbin% >NUL
set current_src=glib-2.14.6/build/win32/dirent/dirent.lib
set current_dst=%plib%
copy "glib-2.14.6\build\win32\dirent\dirent.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=glib-2.14.6/build/win32/dirent/dirent.h
set current_dst=%pinc%/
copy "glib-2.14.6\build\win32\dirent\dirent.h" %pinc%\ >NUL
if errorlevel 1 goto bail

echo Copying cairo
set current_src=cairo-1.4.14/src/cairo.dll
set current_dst=%pbin%
copy "cairo-1.4.14\src\cairo.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=cairo-1.4.14/src/cairo.pdb
set current_dst=%pbin%
if exist "cairo-1.4.14\src\cairo.pdb" copy "cairo-1.4.14\src\cairo.pdb" %pbin% >NUL
set current_src=cairo-1.4.14/src/cairo.lib
set current_dst=%plib%
copy "cairo-1.4.14\src\cairo.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=cairo-1.4.14/src/cairo.h
set current_dst=%pinc%/cairo
copy "cairo-1.4.14\src\cairo.h" %pinc%\cairo >NUL
if errorlevel 1 goto bail
set current_src=cairo-1.4.14/src/cairo-features.h
set current_dst=%pinc%/cairo
copy "cairo-1.4.14\src\cairo-features.h" %pinc%\cairo >NUL
if errorlevel 1 goto bail
set current_src=cairo-1.4.14/src/cairo-deprecated.h
set current_dst=%pinc%/cairo
copy "cairo-1.4.14\src\cairo-deprecated.h" %pinc%\cairo >NUL
if errorlevel 1 goto bail
set current_src=cairo-1.4.14/src/cairo-ps.h
set current_dst=%pinc%/cairo
copy "cairo-1.4.14\src\cairo-ps.h" %pinc%\cairo >NUL
if errorlevel 1 goto bail
set current_src=cairo-1.4.14/src/cairo-pdf.h
set current_dst=%pinc%/cairo
copy "cairo-1.4.14\src\cairo-pdf.h" %pinc%\cairo >NUL
if errorlevel 1 goto bail
set current_src=cairo-1.4.14/src/cairo-svg.h
set current_dst=%pinc%/cairo
copy "cairo-1.4.14\src\cairo-svg.h" %pinc%\cairo >NUL
if errorlevel 1 goto bail
set current_src=cairo-1.4.14/src/cairo-win32.h
set current_dst=%pinc%/cairo
copy "cairo-1.4.14\src\cairo-win32.h" %pinc%\cairo >NUL
if errorlevel 1 goto bail

echo Copying pango
set current_src=pango-1.18.4/pango/libpango-1.0-0.dll
set current_dst=%pbin%
copy "pango-1.18.4\pango\libpango-1.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/libpangocairo-1.0-0.dll
set current_dst=%pbin%
copy "pango-1.18.4\pango\libpangocairo-1.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/libpangowin32-1.0-0.dll
set current_dst=%pbin%
copy "pango-1.18.4\pango\libpangowin32-1.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/libpango-1.0-0.pdb
set current_dst=%pbin%
if exist "pango-1.18.4\pango\libpango-1.0-0.pdb" copy "pango-1.18.4\pango\libpango-1.0-0.pdb" %pbin% >NUL
set current_src=pango-1.18.4/pango/libpangocairo-1.0-0.pdb
set current_dst=%pbin%
if exist "pango-1.18.4\pango\libpangocairo-1.0-0.pdb" copy "pango-1.18.4\pango\libpangocairo-1.0-0.pdb" %pbin% >NUL
set current_src=pango-1.18.4/pango/libpangowin32-1.0-0.pdb
set current_dst=%pbin%
if exist "pango-1.18.4\pango\libpangowin32-1.0-0.pdb" copy "pango-1.18.4\pango\libpangowin32-1.0-0.pdb" %pbin% >NUL
set current_src=pango-1.18.4/pango/pango-1.0.lib
set current_dst=%plib%
copy "pango-1.18.4\pango\pango-1.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangocairo-1.0.lib
set current_dst=%plib%
copy "pango-1.18.4\pango\pangocairo-1.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangowin32-1.0.lib
set current_dst=%plib%
copy "pango-1.18.4\pango\pangowin32-1.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-attributes.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-attributes.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-break.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-break.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-color-table.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-color-table.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-context.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-context.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-coverage.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-coverage.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-engine-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-engine-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-engine.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-engine.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-enum-types.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-enum-types.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-features.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-features.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-font.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-font.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-fontmap.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-fontmap.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-fontset.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-fontset.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-glyph-item-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-glyph-item-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-glyph-item.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-glyph-item.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-glyph.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-glyph.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-gravity.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-gravity.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-impl-utils.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-impl-utils.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-item.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-item.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-language.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-language.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-layout-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-layout-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-layout.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-layout.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-matrix.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-matrix.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-modules.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-modules.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-ot-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-ot-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-ot.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-ot.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-renderer.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-renderer.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-script-lang-table.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-script-lang-table.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-script.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-script.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-tabs.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-tabs.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-types.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-types.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango-utils.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango-utils.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pango.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pango.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangoatsui-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangoatsui-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangoatsui.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangoatsui.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangocairo-atsui.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangocairo-atsui.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangocairo-atsuifont.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangocairo-atsuifont.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangocairo-fc.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangocairo-fc.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangocairo-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangocairo-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangocairo-win32.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangocairo-win32.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangocairo.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangocairo.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangofc-decoder.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangofc-decoder.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangofc-font.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangofc-font.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangofc-fontmap.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangofc-fontmap.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangofc-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangofc-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangoft2-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangoft2-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangoft2.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangoft2.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangowin32-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangowin32-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangowin32.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangowin32.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangox-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangox-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangox.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangox.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangoxft-private.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangoxft-private.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangoxft-render.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangoxft-render.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail
set current_src=pango-1.18.4/pango/pangoxft.h
set current_dst=%pinc%/pango-1.0/pango
copy "pango-1.18.4\pango\pangoxft.h" %pinc%\pango-1.0\pango >NUL
if errorlevel 1 goto bail

echo Copying atk
set current_src=atk-1.22.0/atk/libatk-1.0-0.dll
set current_dst=%pbin%
copy "atk-1.22.0\atk\libatk-1.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/libatk-1.0-0.pdb
set current_dst=%pbin%
if exist "atk-1.22.0\atk\libatk-1.0-0.pdb" copy "atk-1.22.0\atk\libatk-1.0-0.pdb" %pbin% >NUL
set current_src=atk-1.22.0/atk/atk-1.0.lib
set current_dst=%plib%
copy "atk-1.22.0\atk\atk-1.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atk-enum-types.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atk-enum-types.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atk.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atk.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkaction.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkaction.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkcomponent.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkcomponent.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkdocument.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkdocument.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkeditabletext.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkeditabletext.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkgobjectaccessible.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkgobjectaccessible.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkhyperlink.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkhyperlink.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkhyperlinkimpl.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkhyperlinkimpl.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkhypertext.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkhypertext.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkimage.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkimage.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkintl.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkintl.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkmarshal.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkmarshal.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkmisc.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkmisc.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atknoopobject.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atknoopobject.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atknoopobjectfactory.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atknoopobjectfactory.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkobject.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkobject.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkobjectfactory.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkobjectfactory.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkregistry.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkregistry.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkrelation.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkrelation.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkrelationset.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkrelationset.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkrelationtype.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkrelationtype.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkselection.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkselection.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkstate.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkstate.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkstateset.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkstateset.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkstreamablecontent.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkstreamablecontent.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atktable.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atktable.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atktext.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atktext.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkutil.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkutil.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail
set current_src=atk-1.22.0/atk/atkvalue.h
set current_dst=%pinc%/atk-1.0/atk
copy "atk-1.22.0\atk\atkvalue.h" %pinc%\atk-1.0\atk >NUL
if errorlevel 1 goto bail

echo Copying gdk-pixbuf
set current_src=gtk+-2.12.9/gdk-pixbuf/libgdk_pixbuf-2.0-0.dll
set current_dst=%pbin%
copy "gtk+-2.12.9\gdk-pixbuf\libgdk_pixbuf-2.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/libgdk_pixbuf-2.0-0.pdb
set current_dst=%pbin%
if exist "gtk+-2.12.9\gdk-pixbuf\libgdk_pixbuf-2.0-0.pdb" copy "gtk+-2.12.9\gdk-pixbuf\libgdk_pixbuf-2.0-0.pdb" %pbin% >NUL
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk_pixbuf-2.0.lib
set current_dst=%plib%
copy "gtk+-2.12.9\gdk-pixbuf\gdk_pixbuf-2.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-csource.exe
set current_dst=%pbin%
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-csource.exe" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-csource.exe.manifest
set current_dst=%pbin%
if exist "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-csource.exe.manifest" copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-csource.exe.manifest" %pbin% >NUL
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-alias.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-alias.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-animation.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-animation.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-core.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-core.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-enum-types.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-enum-types.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-features.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-features.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-i18n.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-i18n.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-io.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-io.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-loader.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-loader.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-marshal.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-marshal.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-private.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-private.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-scaled-anim.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-scaled-anim.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-simple-anim.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-simple-anim.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf-transform.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf-transform.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixbuf.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixbuf.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/gdk-pixdata.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\gdk-pixdata.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/io-ani-animation.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\io-ani-animation.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/io-gif-animation.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\io-gif-animation.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk-pixbuf/xpm-color-table.h
set current_dst=%pinc%/gtk-2.0/gdk-pixbuf
copy "gtk+-2.12.9\gdk-pixbuf\xpm-color-table.h" %pinc%\gtk-2.0\gdk-pixbuf >NUL
if errorlevel 1 goto bail
echo Copying gdk
set current_src=gtk+-2.12.9/gdk/libgdk-win32-2.0-0.dll
set current_dst=%pbin%
copy "gtk+-2.12.9\gdk\libgdk-win32-2.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/libgdk-win32-2.0-0.pdb
set current_dst=%pbin%
if exist "gtk+-2.12.9\gdk\libgdk-win32-2.0-0.pdb" copy "gtk+-2.12.9\gdk\libgdk-win32-2.0-0.pdb" %pbin% >NUL
set current_src=gtk+-2.12.9/gdk/gdk-win32-2.0.lib
set current_dst=%plib%
copy "gtk+-2.12.9\gdk\gdk-win32-2.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdk.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdk.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkalias.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkalias.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkcairo.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkcairo.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkcolor.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkcolor.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkconfig.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkconfig.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkcursor.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkcursor.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkdisplay.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkdisplay.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkdisplaymanager.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkdisplaymanager.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkdnd.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkdnd.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkdrawable.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkdrawable.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkenumtypes.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkenumtypes.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkevents.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkevents.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkfont.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkfont.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkgc.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkgc.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdki18n.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdki18n.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkimage.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkimage.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkinput.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkinput.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkinternals.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkinternals.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkintl.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkintl.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkkeys.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkkeys.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkkeysyms.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkkeysyms.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkmarshalers.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkmarshalers.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkmedialib.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkmedialib.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkpango.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkpango.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkpixbuf.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkpixbuf.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkpixmap.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkpixmap.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkpoly-generic.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkpoly-generic.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkprivate.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkprivate.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkproperty.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkproperty.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkregion-generic.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkregion-generic.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkregion.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkregion.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkrgb.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkrgb.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkscreen.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkscreen.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkselection.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkselection.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkspawn.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkspawn.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdktypes.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdktypes.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkvisual.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkvisual.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkwindow.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\gdkwindow.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/keyname-table.h
set current_dst=%pinc%/gtk-2.0/gdk
copy "gtk+-2.12.9\gdk\keyname-table.h" %pinc%\gtk-2.0\gdk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gdk/gdkconfig.h
set current_dst=%plib%/gtk-2.0/include
copy "gtk+-2.12.9\gdk\gdkconfig.h" %plib%\gtk-2.0\include >NUL
if errorlevel 1 goto bail
del %pinc%\gtk-2.0\gdk\gdkconfig.h
echo Copying pixbuf theme
set current_src=gtk+-2.12.9/modules/engines/pixbuf/libpixmap.dll
set current_dst=%plib%/engines
copy "gtk+-2.12.9\modules\engines\pixbuf\libpixmap.dll" %plib%\engines >NUL
if errorlevel 1 goto bail
echo Copying gtk
set current_src=gtk+-2.12.9/gtk/libgtk-win32-2.0-0.dll
set current_dst=%pbin%
copy "gtk+-2.12.9\gtk\libgtk-win32-2.0-0.dll" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/libgtk-win32-2.0-0.pdb
set current_dst=%pbin%
if exist "gtk+-2.12.9\gtk\libgtk-win32-2.0-0.pdb" copy "gtk+-2.12.9\gtk\libgtk-win32-2.0-0.pdb" %pbin% >NUL
set current_src=gtk+-2.12.9/gtk/gtk-win32-2.0.lib
set current_dst=%plib%
copy "gtk+-2.12.9\gtk\gtk-win32-2.0.lib" %plib% >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtk-query-immodules-2.0.exe
set current_dst=%pbin%
copy "gtk+-2.12.9\gtk\gtk-query-immodules-2.0.exe" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtk-update-icon-cache.exe
set current_dst=%pbin%
copy "gtk+-2.12.9\gtk\gtk-update-icon-cache.exe" %pbin% >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtk-query-immodules-2.0.exe.manifest
set current_dst=%pbin%
if exist "gtk+-2.12.9\gtk\gtk-query-immodules-2.0.exe.manifest" copy "gtk+-2.12.9\gtk\gtk-query-immodules-2.0.exe.manifest" %pbin% >NUL
set current_src=gtk+-2.12.9/gtk/gtk-update-icon-cache.exe.manifest
set current_dst=%pbin%
if exist "gtk+-2.12.9\gtk\gtk-update-icon-cache.exe.manifest" copy "gtk+-2.12.9\gtk\gtk-update-icon-cache.exe.manifest" %pbin% >NUL
set current_src=gtk+-2.12.9/gtk/gtk.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtk.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkaboutdialog.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkaboutdialog.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkaccelgroup.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkaccelgroup.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkaccellabel.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkaccellabel.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkaccelmap.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkaccelmap.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkaccessible.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkaccessible.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkaction.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkaction.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkactiongroup.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkactiongroup.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkadjustment.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkadjustment.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkalias.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkalias.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkalignment.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkalignment.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkarrow.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkarrow.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkaspectframe.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkaspectframe.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkassistant.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkassistant.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkbbox.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkbbox.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkbin.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkbin.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkbindings.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkbindings.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkbox.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkbox.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkbuildable.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkbuildable.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkbuilder.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkbuilder.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkbuilderprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkbuilderprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkbuiltincache.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkbuiltincache.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcalendar.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcalendar.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcelleditable.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcelleditable.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcelllayout.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcelllayout.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcellrenderer.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcellrenderer.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcellrendereraccel.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcellrendereraccel.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcellrenderercombo.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcellrenderercombo.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcellrendererpixbuf.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcellrendererpixbuf.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcellrendererprogress.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcellrendererprogress.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcellrendererspin.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcellrendererspin.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcellrenderertext.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcellrenderertext.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcellrenderertoggle.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcellrenderertoggle.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcellview.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcellview.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcheckbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcheckbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcheckmenuitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcheckmenuitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkclipboard.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkclipboard.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkclist.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkclist.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcolorbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcolorbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcolorsel.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcolorsel.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcolorseldialog.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcolorseldialog.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcombo.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcombo.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcombobox.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcombobox.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcomboboxentry.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcomboboxentry.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcontainer.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcontainer.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkctree.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkctree.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkcurve.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkcurve.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkdebug.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkdebug.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkdialog.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkdialog.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkdnd.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkdnd.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkdndcursors.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkdndcursors.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkdrawingarea.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkdrawingarea.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkeditable.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkeditable.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkentry.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkentry.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkentrycompletion.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkentrycompletion.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkentryprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkentryprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkenums.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkenums.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkeventbox.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkeventbox.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkexpander.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkexpander.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechooser.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechooser.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechooserbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechooserbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechooserdefault.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechooserdefault.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechooserdialog.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechooserdialog.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechooserembed.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechooserembed.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechooserentry.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechooserentry.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechooserprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechooserprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechoosersettings.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechoosersettings.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechooserutils.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechooserutils.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilechooserwidget.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilechooserwidget.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilefilter.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilefilter.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilesel.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilesel.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilesystem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilesystem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilesystemmodel.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilesystemmodel.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilesystemunix.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilesystemunix.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfilesystemwin32.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfilesystemwin32.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfixed.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfixed.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfontbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfontbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkfontsel.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkfontsel.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkframe.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkframe.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkgamma.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkgamma.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkgc.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkgc.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkhandlebox.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkhandlebox.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkhbbox.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkhbbox.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkhbox.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkhbox.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkhpaned.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkhpaned.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkhruler.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkhruler.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkhscale.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkhscale.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkhscrollbar.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkhscrollbar.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkhseparator.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkhseparator.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkhsv.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkhsv.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkiconcache.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkiconcache.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkiconcachevalidator.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkiconcachevalidator.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkiconfactory.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkiconfactory.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkicontheme.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkicontheme.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkiconview.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkiconview.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkimage.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkimage.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkimagemenuitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkimagemenuitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkimcontext.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkimcontext.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkimcontextsimple.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkimcontextsimple.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkimmodule.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkimmodule.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkimmulticontext.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkimmulticontext.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkinputdialog.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkinputdialog.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkintl.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkintl.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkinvisible.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkinvisible.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkitemfactory.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkitemfactory.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkkeyhash.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkkeyhash.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtklabel.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtklabel.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtklayout.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtklayout.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtklinkbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtklinkbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtklist.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtklist.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtklistitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtklistitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkliststore.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkliststore.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmain.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmain.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmarshal.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmarshal.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmarshalers.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmarshalers.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmenu.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmenu.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmenubar.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmenubar.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmenuitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmenuitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmenushell.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmenushell.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmenutoolbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmenutoolbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmessagedialog.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmessagedialog.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmisc.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmisc.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmnemonichash.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmnemonichash.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkmodules.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkmodules.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtknotebook.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtknotebook.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkobject.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkobject.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkoldeditable.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkoldeditable.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkoptionmenu.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkoptionmenu.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkpagesetup.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkpagesetup.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkpagesetupunixdialog.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkpagesetupunixdialog.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkpaned.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkpaned.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkpapersize.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkpapersize.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkpathbar.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkpathbar.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkpixmap.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkpixmap.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkplug.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkplug.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkplugprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkplugprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkpreview.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkpreview.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprint-win32.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprint-win32.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprintbackend.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprintbackend.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprintcontext.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprintcontext.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprinter-private.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprinter-private.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprinter.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprinter.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprinteroption.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprinteroption.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprinteroptionset.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprinteroptionset.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprinteroptionwidget.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprinteroptionwidget.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprintjob.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprintjob.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprintoperation-private.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprintoperation-private.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprintoperation.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprintoperation.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprintoperationpreview.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprintoperationpreview.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprintsettings.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprintsettings.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprintunixdialog.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprintunixdialog.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprintutils.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprintutils.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprogress.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprogress.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkprogressbar.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkprogressbar.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkquartz.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkquartz.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkquery.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkquery.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkradioaction.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkradioaction.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkradiobutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkradiobutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkradiomenuitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkradiomenuitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkradiotoolbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkradiotoolbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrange.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrange.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrbtree.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrbtree.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrc.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrc.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentaction.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentaction.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentchooser.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentchooser.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentchooserdefault.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentchooserdefault.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentchooserdialog.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentchooserdialog.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentchoosermenu.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentchoosermenu.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentchooserprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentchooserprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentchooserutils.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentchooserutils.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentchooserwidget.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentchooserwidget.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentfilter.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentfilter.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkrecentmanager.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkrecentmanager.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkruler.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkruler.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkscale.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkscale.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkscalebutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkscalebutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkscrollbar.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkscrollbar.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkscrolledwindow.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkscrolledwindow.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksearchengine.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksearchengine.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksearchenginebeagle.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksearchenginebeagle.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksearchenginequartz.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksearchenginequartz.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksearchenginesimple.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksearchenginesimple.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksearchenginetracker.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksearchenginetracker.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkselection.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkselection.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkseparator.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkseparator.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkseparatormenuitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkseparatormenuitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkseparatortoolitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkseparatortoolitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksettings.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksettings.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksignal.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksignal.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksizegroup.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksizegroup.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksocket.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksocket.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtksocketprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtksocketprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkspinbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkspinbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkstatusbar.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkstatusbar.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkstatusicon.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkstatusicon.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkstock.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkstock.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkstyle.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkstyle.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktable.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktable.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktearoffmenuitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktearoffmenuitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktext.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktext.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextbtree.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextbtree.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextbuffer.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextbuffer.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextbufferrichtext.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextbufferrichtext.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextbufferserialize.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextbufferserialize.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextchild.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextchild.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextchildprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextchildprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextdisplay.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextdisplay.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextiter.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextiter.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextiterprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextiterprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextlayout.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextlayout.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextmark.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextmark.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextmarkprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextmarkprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextsegment.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextsegment.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktexttag.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktexttag.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktexttagprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktexttagprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktexttagtable.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktexttagtable.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktexttypes.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktexttypes.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextutil.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextutil.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktextview.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktextview.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkthemes.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkthemes.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktipsquery.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktipsquery.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktoggleaction.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktoggleaction.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktoggleactionprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktoggleactionprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktogglebutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktogglebutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktoggletoolbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktoggletoolbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktoolbar.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktoolbar.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktoolbutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktoolbutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktoolitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktoolitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktooltip.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktooltip.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktooltips.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktooltips.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktrayicon.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktrayicon.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktree.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktree.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreedatalist.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreedatalist.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreednd.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreednd.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreeitem.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreeitem.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreemodel.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreemodel.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreemodelfilter.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreemodelfilter.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreemodelsort.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreemodelsort.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreeprivate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreeprivate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreeselection.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreeselection.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreesortable.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreesortable.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreestore.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreestore.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreeview.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreeview.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktreeviewcolumn.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktreeviewcolumn.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktypebuiltins.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktypebuiltins.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtktypeutils.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtktypeutils.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkuimanager.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkuimanager.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkvbbox.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkvbbox.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkvbox.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkvbox.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkversion.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkversion.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkviewport.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkviewport.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkvolumebutton.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkvolumebutton.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkvpaned.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkvpaned.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkvruler.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkvruler.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkvscale.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkvscale.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkvscrollbar.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkvscrollbar.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkvseparator.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkvseparator.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkwidget.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkwidget.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkwin32embed.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkwin32embed.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkwin32embedwidget.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkwin32embedwidget.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkwindow-decorate.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkwindow-decorate.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkwindow.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkwindow.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/gtkxembed.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\gtkxembed.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail
set current_src=gtk+-2.12.9/gtk/xembed.h
set current_dst=%pinc%/gtk-2.0/gtk
copy "gtk+-2.12.9\gtk\xembed.h" %pinc%\gtk-2.0\gtk >NUL
if errorlevel 1 goto bail

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

