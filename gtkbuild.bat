@echo off

set _CD=%CD%

if not exist "%_CD%\%_HELLO%" echo hello was not found
if not exist "%_CD%\%_ICONV%" echo iconv was not found
if not exist "%_CD%\%_GETTEXT%" echo gettext was not found
if not exist "%_CD%\%_GLIB%" echo glib was not found
if not exist "%_CD%\%_ZLIB%" echo zlib was not found
if not exist "%_CD%\%_LIBPNG%" echo libpng was not found
if not exist "%_CD%\%_CAIRO%" echo cairo was not found
if not exist "%_CD%\%_PANGO%" echo pango was not found
if not exist "%_CD%\%_ATK%" echo atk was not found
if not exist "%_CD%\%_GTK%" echo gtk was not found
echo.

set _make=nmake -nologo
if not "%1"=="" goto Suivant

:Usage
echo Usage: "%0 [package] [mode]"
echo.
echo %0 verify          Verify build environment
echo.
echo %0 iconv           Build iconv
echo %0 gettext         Build gettext
echo %0 dirent          Build dirent
echo %0 glib            Build glib *
echo %0 zlib            Build zlib *
echo %0 libpng          Build libpng *
echo %0 cairo           Build cairo *
echo %0 pango           Build pango *
echo %0 atk             Build atk *
echo %0 gtk             Build gtk *

echo %0 all             Build everything in one go
echo.
echo    To clean [package] run:                 %0 [package] clean
echo    * To run tests for [package] run:       %0 [package] check
echo.
goto Ranger

:Suivant
if not "%2"=="check" goto NoCheck
if "%1"=="glib" goto NoCheck
if "%1"=="zlib" goto NoCheck
if "%1"=="cairo" goto NoCheck
if "%1"=="pango" goto NoCheck
echo Error: Tests not available for this module.
echo.
goto Usage
:NoCheck
if "%2"=="clean" goto Encore

:Encore
if "%1"=="verify" goto verify
if "%1"=="iconv" goto iconv
if "%1"=="gettext" goto gettext
if "%1"=="dirent" goto dirent
if "%1"=="glib" goto glib
if "%1"=="zlib" goto zlib
if "%1"=="libpng" goto libpng
if "%1"=="cairo" goto cairo
if "%1"=="pango" goto pango
if "%1"=="atk" goto atk
if "%1"=="gtk" goto gtk

if not "%1"=="all" goto Faux
goto iconv

:verify
cd %_CD%\%_HELLO%
echo Checking for cl...
set _OK=0
for %%i in (cl.exe) do if not "%%~$PATH:i"=="" set _OK=1
if %_OK%==0 goto ver_faux
echo Checking for nmake...
set _OK=0
for %%i in (nmake.exe) do if not "%%~$PATH:i"=="" set _OK=1
if %_OK%==0 goto ver_faux
echo Cleaning verify...
del *.obj *.exe
echo Compiling helloworld.c...
cl -nologo %CFLAGS% helloworld.c /link %LDFLAGS%
if errorlevel 1 goto ver_faux
echo Compiling hellowin.c...
cl -nologo %CFLAGS% hellowin.c /link /SUBSYSTEM:windows user32.lib %LDFLAGS%
if errorlevel 1 goto ver_faux
echo Running helloword...
helloworld
if errorlevel 1 goto ver_faux
echo Running hellowin...
hellowin
if errorlevel 1 goto ver_faux
echo Verified build environment successfully!
goto Ranger
:ver_faux
echo An error occured. Please make sure you setup your environment properly.
goto Ranger

:iconv
cd %_CD%\%_ICONV%
if "%2"=="clean" goto iconv_clean
echo Building iconv...
%_make% -f makefile.msc
if errorlevel 1 echo iconv failed to build. && goto Ranger
echo iconv built successfully.
REM %_make% -f makefile.msc install
REM if errorlevel 1 echo iconv failed to install. && goto iconv_next
REM echo iconv installed successfully.
goto iconv_next
:iconv_clean
echo Cleaning iconv...
%_make% -f makefile.msc clean
:iconv_next
if "%1"=="iconv" goto Ranger

:gettext
cd %_CD%\%_GETTEXT%\gettext-runtime
if "%2"=="clean" goto gt_clean
if not exist "%_CD%\%_ICONV%\lib\iconv.lib" (
echo gettext - iconv required, but not built && goto Ranger)
echo Building gettext...
%_make% -f makefile.msc DLL=1 %_NOWMEMCPY% PREFIX="%_CD%\%_ICONV%"
if errorlevel 1 echo gettext failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo gettext built successfully.
REM %_make% -f makefile.msc install DLL=1
REM if errorlevel 1 echo gettext failed to build.
REM if "%ERRORLEVEL%"=="0" echo gettext installed successfully.
goto gt_next
:gt_clean
echo Cleaning gettext...
%_make% -f makefile.msc clean
del /s *.manifest
:gt_next
if "%1"=="gettext" goto Ranger

:dirent
cd %_CD%\%_GLIB%\build\win32\dirent
if "%2"=="clean" goto dirent_clean
echo Building dirent...
%_make% -f makefile.msc
if errorlevel 1 echo dirent failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo dirent built successfully.
goto dirent_next
:dirent_clean
echo Cleaning dirent...
%_make% -f makefile.msc clean
:dirent_next
if "%1"=="dirent" goto Ranger

:glib
cd %_CD%\%_GLIB%
if "%2"=="clean" goto glib_clean
if not exist "%_CD%\%_ICONV%\lib\iconv.lib" (
echo gettext - iconv required, but not built && goto Ranger)
if not exist "%_CD%\%_GETTEXT%\gettext-runtime\intl\intl.dll" (
echo glib - gettext required, but not built && Ranger)
if not exist "%_CD%\%_GLIB%\build\win32\dirent\dirent.dll" (
echo glib - dirent required, but not built && goto Ranger)
if not "%2"=="check" goto glib_build
echo Building glib tests...
%_make% -f makefile.msc sub-one THIS=tests TARGET=all
if errorlevel 1 echo glib tests failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo glib tests built successfully.
echo Running glib tests...
%_make% -f makefile.msc sub-one THIS=tests TARGET=check
goto glib_next
:glib_build
echo Building glib...
%_make% -f makefile.msc
if errorlevel 1 echo glib failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo glib built successfully.
goto glib_next
:glib_clean
echo Cleaning glib...
%_make% -f makefile.msc clean
del /s *.manifest
:glib_next
if "%1"=="glib" goto Ranger

:zlib
cd %_CD%\%_ZLIB%
if "%2"=="clean" goto zlib_clean
if not "%2"=="check" goto zlib_build
echo Running zlib tests...
%_make% -f win32/Makefile.msc test
%_make% -f win32/Makefile.msc testdll
goto zlib_next
:zlib_build
echo Building zlib...
%_make% -f win32/Makefile.msc
if errorlevel 1 echo zlib failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo zlib built successfully.
REM %_make% -f win32/Makefile.msc install
REM if errorlevel 1 echo zlib failed to install.
REM if "%ERRORLEVEL%"=="0" echo zlib installed successfully.
goto zlib_next
:zlib_clean
echo Cleaning zlib...
%_make% -f win32/Makefile.msc clean
del /s *.manifest
:zlib_next
if "%1"=="zlib" goto Ranger

:libpng
cd %_CD%\%_LIBPNG%
if "%2"=="clean" goto libpng_clean
if not exist "%_CD%\%_ZLIB%\zdll.lib" (
echo libpng - zlib required, but not built && goto Ranger)
echo Building libpng...
%_make% -f scripts/makefile-dll.msc
if errorlevel 1 echo libpng failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo libpng built successfully.
REM %_make% -f scripts/makefile-dll.msc install
REM if errorlevel 1 echo libpng failed to install.
REM if "%ERRORLEVEL%"=="0" echo libpng installed successfully.
goto libpng_next
:libpng_clean
echo Cleaning libpng...
%_make% -f scripts/makefile-dll.msc clean
del /s *.manifest
:libpng_next
if "%1"=="libpng" goto Ranger

:cairo
cd %_CD%\%_CAIRO%
if "%2"=="clean" goto cairo_clean
if not exist "%_CD%\%_ZLIB%\zdll.lib" (
echo cairo - zlib required, but not built && goto Ranger)
if not exist "%_CD%\%_LIBPNG%\libpng.dll" (
echo cairo - libpng required, but not built && goto Ranger)
if not "%2"=="check" goto cairo_build
echo Running cairo tests...
%_make% -f makefile.msc test
goto cairo_next
:cairo_build
echo Building cairo (pixman)...
cd pixman\src
%_make% -f makefile.msc MMX=0
if errorlevel 1 echo cairo (pixman) failed to build. && goto Ranger
cd ..\..
echo Building cairo...
%_make% -f makefile.msc
if errorlevel 1 echo cairo failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo cairo built successfully.
goto cairo_next
:cairo_clean
echo Cleaning cairo...
cd pixman\src
%_make% -f makefile.msc MMX=0 clean
cd ..\..
%_make% -f makefile.msc clean
del /s *.manifest
:cairo_next
if "%1"=="cairo" goto Ranger

:pango
cd %_CD%\%_PANGO%/pango
if "%2"=="clean" goto pango_clean
if not exist "%_CD%\%_GLIB%\glib\libglib-2.0-0.dll" (
echo pango - glib required, but not built && goto Ranger)
if not exist "..\..\%_CAIRO%\src\cairo.dll" (
echo pango - cairo required, but not built && goto Ranger)
echo Building pango
%_make% -f makefile.msc
if errorlevel 1 echo pango failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo pango built successfully.
goto pango_next
:pango_clean
echo Cleaning pango...
%_make% -f makefile.msc clean
del /s *.manifest
:pango_next
if "%1"=="pango" goto Ranger

:atk
cd %_CD%\%_ATK%/atk
if "%2"=="clean" goto atk_clean
if not exist "%_CD%\%_GLIB%\gobject\libgobject-2.0-0.dll" (
echo atk - glib required, but not built && goto Ranger)
echo Building atk
%_make% -f makefile.msc
if errorlevel 1 echo atk failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo atk built successfully.
goto atk_next
:atk_clean
echo Cleaning atk...
%_make% -f makefile.msc clean
del /s *.manifest
:atk_next
if "%1"=="atk" goto Ranger

:gtk
cd %_CD%\%_GTK%
if "%2"=="clean" goto gtk_clean
if not exist "%_CD%\%_PANGO%\pango\libpangocairo-1.0-0.dll" (
echo gtk - pango required, but not built && goto Ranger)
if not exist "%_CD%\%_ATK%\atk\libatk-1.0-0.dll" (
echo gtk - atk required, but not built && goto Ranger)
if not "%2"=="check" goto gtk_build
echo Building gtk tests...
%_make% -f makefile.msc sub-one THIS=tests TARGET=all
if errorlevel 1 echo gtk tests failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo gtk tests built successfully.
echo Running gtk tests...
%_make% -f makefile.msc sub-one THIS=tests TARGET=check
goto gtk_next
:gtk_build
echo Building gtk...
%_make% -f makefile.msc
if errorlevel 1 echo gtk failed to build. && goto Ranger
if "%ERRORLEVEL%"=="0" echo gtk built successfully.
REM %_make% -f makefile.msc install
REM if errorlevel 1 echo gtk failed to install.
REM if "%ERRORLEVEL%"=="0" echo gtk installed successfully.
goto gtk_next
:gtk_clean
echo Cleaning gtk...
%_make% -f makefile.msc clean
del /s *.manifest
:gtk_next
if "%1"=="gtk" goto Ranger

goto Ranger

:Faux
echo Error: Unknown module "%1" specified.
echo.
goto Usage

:Ranger
if errorlevel 1 echo Build failed.
if "%ERRORLEVEL%"=="0" echo Build completed successfully.
cd %_CD%
set _CD=
set _make=
set _OK=
