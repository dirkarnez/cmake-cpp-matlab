REM run as Administrator
@echo off

set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

rem SET PATH=^
rem %DOWNLOADS_DIR%\PortableGit\bin;^
rem %DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0;^
rem %DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\bin;^
rem %DOWNLOADS_DIR%\cmake-3.22.2-windows-x86_64\bin;

set PATH=^
D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin;^
D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;^
D:\Softwares\MATLAB\R2022b\bin;

set CD_LINUX=%CD:\=/%

rem echo %CD_LINUX%

rem cd %~dp0

rem if exist build rmdir /s /q build

rem cmake.exe --no-warn-unused-cli ^
rem -G"MinGW Makefiles" ^
rem -DCMAKE_BUILD_TYPE=Debug ^
rem -DCPK_PROJECT="%CD_LINUX%" ^
rem -DCPK_ACTION="%1" ^
rem -DCPK_ACTION_TARGET="%2" ^
rem -B./build &&^
rem rmdir /s /q build &&^
rem echo done &&
rem mcc -W cpplib:addition -T link:lib -d matlab-build addition.m

REM -DCMAKE_BUILD_TYPE=Debug ^

cmake -G "Visual Studio 16 2019" -A x64 ^
-DMATLAB_BUILD_ROOT="%CD_LINUX%/matlab-build" ^
-B./cmake-build &&^
cd cmake-build &&^
cmake --build . &&^
echo "Successful build"
pause