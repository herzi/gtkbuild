@echo off
set _PREFIX=C:\usr

set _MFILES=makefile.msc Makefile.msvc win32\Makefile.msc scripts\makefile.msc
set _MAKE=nmake -nologo

if "%1"=="" goto Usage
if "%2"=="" goto Suivant
if "%2"=="install" goto Suivant
if "%2"=="rebuild" goto Suivant
if "%2"=="clean" goto Suivant
if "%2"=="check" goto Suivant

:Usage
echo Usage: "%0 [package] [mode]"
echo.
for /D %%p in (*) do for %%m in (%_MFILES%) do if exist %%p\%%m (
set _T=N && (if exist "%%p\test*" set _T=Y) && echo %0 %%p	Build %%p %_T% )
echo.
echo    To install [package] run:	%0 [package] install
echo    To rebuild [package] run:	%0 [package] rebuild
echo    To clean   [package] run:	%0 [package] clean
echo    To check   [package] run:	%0 [package] check
echo.
goto Ranger

:Suivant
echo Building %1...
for %%m in (%_MFILES%) do if exist %1\%%m set _MAKEFILE=%%m && goto Encore
echo ...aborted, no makefile found.
goto Ranger

:Encore
echo ...%_MAKEFILE% found.
cd %1
if "%2"=="clean" goto clean
if not "%2"=="rebuild" goto build
echo ...cleaning binaries.
del /Q /S *.lib *.exe *.dll
:build
echo ...running build.
%_make% -f %_MAKEFILE% PREFIX=%_PREFIX% DEBUG=%DEBUG%
if errorlevel 1 echo %1 ...aborting due to an error.
if errorlevel 1 goto next
echo ...built successfully.
if not "%2"=="install" goto next
%_make% -f %_MAKEFILE% PREFIX=%_PREFIX% DEBUG=%DEBUG% install
if errorlevel 1 echo %1 ...aborting due to an error.
if errorlevel 1 goto next
echo ...installed successfully.
goto next
:clean
echo ...cleaning.
%_make% -f %_MAKEFILE% clean
:next
cd ..

:Ranger
set _MFILES=
set _MAKE=
SET _T=
set _MAKEFILE=
set _PREFIX=
