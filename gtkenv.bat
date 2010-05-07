@echo off

set _ICONV=libiconv-win
set _GETTEXT=gettext-0.17
set _GLIB=glib-2.14.6
set _ZLIB=zlib-1.2.3
set _LIBPNG=libpng-1.2.26
set _CAIRO=cairo-1.4.14
set _PANGO=pango-1.18.4
set _ATK=atk-1.22.0
set _GTK=gtk+-2.12.9
set _HELLO=hello

set _CD=%CD%
if not "%_HELLO%"=="" set PATH=%PATH%;%_CD%\%_ZLIB%;%_CD%\%_GETTEXT%\gettext-runtime\intl;%_CD%\%_GLIB%\glib;%_CD%\%_GLIB%\gobject;%_CD%\%_GLIB%\gmodule;%_CD%\%_GLIB%\gthread;%_CD%\%_GLIB%\build\win32\dirent;%_CD%\%_LIBPNG%;%_CD%\%_CAIRO%\src;%_CD%\%_PANGO%\pango;%_CD%\%_ATK%\atk;%_CD%\%_GTK%\gdk-pixbuf;%_CD%\%_GTK%\gdk;%_CD%\%_GTK%\gtk

set _VS8E32=%VS80COMNTOOLS%vsvars32.bat
set _VS8P32=%VS80COMNTOOLS%\..\..\VC\bin\vcvars32.bat
set _VS8P64=%VS80COMNTOOLS%\..\..\VC\bin\amd64\vcvarsamd64.bat
set _VS9E32=%VS90COMNTOOLS%vsvars32.bat
set _VS9P32=%VS90COMNTOOLS%\..\..\VC\bin\vcvars32.bat
set _VS9P64=%VS90COMNTOOLS%\..\..\VC\bin\amd64\vcvarsamd64.bat
set _DDK=C:\WINDDK\3790.1830
set _WDK=C:\WINDDK\6001.18001
set _SDK=C:\PSDK

if not exist "%_DDK%" set _DDK=N/A
if not exist "%_WDK%" set _WDK=N/A
if exist "%WindowsSdkDir%" set _SDK=%WindowsSdkDir%
if not exist "%_SDK%" set _SDK=N/A

for %%i in (perl.exe) do if not "%%~$PATH:i"=="" set _PERL=%%~$PATH:i

set _VC8=
if exist "%_VS8E32%" set _VC8=32bit
if exist "%_VS8P32%" set _VC8=32bit
if exist "%_VS8P64%" set _VC8=%_VC8% + 64bit
if "%_VC8%"=="" set _VC8=N/A

set _VC9=
if exist "%_VS9E32%" set _VC9=32bit
if exist "%_VS9P32%" set _VC9=32bit
if exist "%_VS9P64%" set _VC9=%_VC9% + 64bit
if "%_VC9%"=="" set _VC9=N/A

if "%1"=="x86" set _ARCH=x86
if "%1"=="x64" set _ARCH=x64
if "%_ARCH%"=="" echo Please specify a valid arch && echo. && goto Usage

if "%2"=="vs8" set _COMPILER=vs8
if "%2"=="vs9" set _COMPILER=vs9
if "%2"=="ddk" set _COMPILER=ddk
if "%2"=="wdk" set _COMPILER=wdk
if "%_COMPILER%"=="" echo Please specify a valid compiler && echo. && goto Usage

if "%3"=="release" set _RUNTIME=release
if "%3"=="debug" set _RUNTIME=debug
if "%3"=="release-ddk" set _RUNTIME=release-ddk
if "%3"=="release-wdk" set _RUNTIME=release-wdk
if "%_RUNTIME%"=="" echo Please specify a valid runtime && echo. && goto Usage

if "%_COMPILER%"=="ddk" if not "%_RUNTIME%"=="release-ddk" (
echo The ddk compiler supports only the runtime release-ddk && echo. && goto Usage )
if "%_COMPILER%"=="wdk" if not "%_RUNTIME%"=="release-wdk" (
echo The wdk compiler supports only the runtime release-wdk && echo. && goto Usage )

echo Visual Studio 2005: %_VC8%
echo Visual Studio 2008: %_VC9%
echo DDK folder:         %_DDK%
echo WDK folder:         %_WDK%
echo SDK folder:         %_SDK%
echo Perl:               %_PERL%
echo Runtime:            %_RUNTIME%
echo.

if not "%_COMPILER%"=="vs9" if not exist "%_SDK%" (
echo No SDK was found && echo. && goto Usage )
if "%_PERL%" == "" (
echo Perl is not in PATH, please add it and try again && goto Usage )

goto Suivant

:Usage
echo Usage: "%0 [arch] [compiler] [runtime]"
echo.
echo %0 x86				Build for WinXP 32bit
echo %0 x64				Build for WinXP 64bit
echo.
echo %0 [arch] vs8			Use the Visual Studio 2005 compiler
echo %0 [arch] vs9			Use the Visual Studio 2008 compiler
echo %0 [arch] ddk			Use the DDK compiler
echo %0 [arch] wdk			Use the WDK compiler
echo.
echo %0 [arch] [compiler] release	Build against Release runtime
echo %0 [arch] [compiler] debug		Build against Debug runtime
echo %0 [arch] [compiler] release-ddk	Build against DDK runtime
echo %0 [arch] [compiler] release-wdk	Build against WDK runtime
goto Ranger

:Suivant
if not "%_COMPILER%"=="vs8" goto NoVS8
if "%_ARCH%"=="x86" if not exist "%_VS8P32%" call "%_VS8E32%"
if "%_ARCH%"=="x86" if not exist "%_VS8E32%" goto Ranger
if "%_ARCH%"=="x86" call "%_VS8P32%"
if "%_ARCH%"=="x86" if not exist "%_VS8P32%" goto Ranger
if "%_ARCH%"=="x64" call "%_VS8P64%"
if "%_ARCH%"=="x64" if not exist "%_VS8P64%" goto Ranger

:NoVS8
if not "%_COMPILER%"=="vs9" goto NoVS9
if "%_ARCH%"=="x86" if not exist "%_VS9P32%" call "%_VS9E32%"
if "%_ARCH%"=="x86" if not exist "%_VS9E32%" goto Ranger
if "%_ARCH%"=="x86" call "%_VS9P32%"
if "%_ARCH%"=="x86" if not exist "%_VS9P32%" goto Ranger
if "%_ARCH%"=="x64" call "%_VS9P64%"
if "%_ARCH%"=="x64" if not exist "%_VS9P64%" goto Ranger

:NoVS9
if not "%_COMPILER%"=="ddk" goto NoDDK
if "%_ARCH%"=="x86" call %_DDK%\bin\setenv %_DDK% fre WXP
if "%_ARCH%"=="x64" call %_DDK%\bin\setenv %_DDK% fre AMD64

:NoDDK
if not "%_COMPILER%"=="wdk" goto Preparer
set DDKBUILDENV=
if "%_ARCH%"=="x86" call %_WDK%\bin\setenv %_WDK% fre WXP
if "%_ARCH%"=="x64" call %_WDK%\bin\setenv %_WDK% fre X64

:Preparer
set _SYS=%Include%
set _NOWMEMCPY=
if "%_RUNTIME%"=="release-ddk" set _SYS=%_DDK%\inc\api;%_DDK%\inc\crt;%_DDK%\inc\crt\atl71;%_DDK%\inc\wnet
if "%_RUNTIME%"=="release-wdk" set _SYS=%_DDK%\inc\api;%_DDK%\inc\crt;%_DDK%\inc\crt\atl71;%_DDK%\inc\wnet
if not "%_RUNTIME%"=="release" if not "%_RUNTIME%"=="debug" set _NOWMEMCPY=NOWMEMCPY=1
set Include=%_SYS%;%_SDK%\Include
if "%_ARCH%"=="x86" if "%_RUNTIME%"=="release-ddk" set Lib=%_DDK%\lib\crt\i386;%Lib%;%_DDK%\lib\wxp\i386
if "%_ARCH%"=="x86" if "%_RUNTIME%"=="release-wdk" set Lib=%_WDK%\lib\crt\i386;%Lib%;%_WDK%\lib\wxp\i386
if "%_ARCH%"=="x64" if "%_RUNTIME%"=="release-ddk" set Lib=%_DDK%\lib\crt\amd64;%_DDK%\lib\wnet\amd64;%Lib%
if "%_ARCH%"=="x64" if "%_RUNTIME%"=="release-wdk" set Lib=%_WDK%\lib\crt\amd64;%_WDK%\lib\wnet\amd64;%Lib%
if exist "%WindowsSdkDir%" echo Note: Windows SDK will be used
set DEBUG= && set CFLAGS=/O1 /MD && set LDFLAGS=
if "%_RUNTIME%"=="release-ddk" set LDFLAGS=bufferoverflowU.lib
if "%_RUNTIME%"=="release-wdk" if "%1"=="x86" set LDFLAGS=msvcrt_winxp.obj
if "%_RUNTIME%"=="release-wdk" if "%1"=="x64" set LDFLAGS=msvcrt_win2003.obj
if "%_RUNTIME%"=="debug" set DEBUG=1 && set CFLAGS=/Z7 /MDd && set LDFLAGS=/NODEFAULTLIB:msvcrt.lib
set CFLAGS=/GS- -D_CRT_NONSTDC_NO_DEPRECATE -D_CRT_SECURE_NO_DEPRECATE %CFLAGS%
call title Build %_ARCH% %_COMPILER% %_RUNTIME%
echo Build %_ARCH% %_COMPILER% %_RUNTIME%
set _CONFIG=%_ARCH%-%_COMPILER%-%_RUNTIME%
chdir /d %_CD%

:Ranger
set _VS8E32=
set _VS8P32=
set _VS8P64=
set _VS9E32=
set _VS9P32=
set _VS9P64=
set _VC8=
set _VC9=
set _ARCH=
set _COMPILER=
set _RUNTIME=
set _DDK=
set _WDK=
set _SDK=
set _PERL=
set _SYS=
set _MISC=
set _CD=
