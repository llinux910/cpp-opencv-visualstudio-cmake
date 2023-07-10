

@echo off
cd opencv_zips

set target_dir="../opencv"

set zip_executable="C:\Program Files\7-Zip\7z.exe"

%zip_executable% x -o"%target_dir%" opencv.zip

echo opencv 압축 해제가 완료되었습니다.


cd ..





set SOURCE_DIR=build_default
set TARGET_DIR=build

echo Copying files from %SOURCE_DIR% to %TARGET_DIR%...
xcopy /E /I /Y "%SOURCE_DIR%" "%TARGET_DIR%"

echo Entering %TARGET_DIR%...
cd %TARGET_DIR%

echo Running cmake -G "Visual Studio 17 2022" -A x64...
cmake -G "Visual Studio 17 2022" -A x64

echo Batch script completed.

pause
