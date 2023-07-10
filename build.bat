@echo off


@echo off
cd opencv_zips

REM 분할 압축된 opencv 압축해제 대상 디렉토리 경로 설정
set target_dir="../opencv"

REM 7-Zip 실행 파일 경로 설정 (7z.exe 파일이 있는 경로로 설정해야 함)
set zip_executable="C:\Program Files\7-Zip\7z.exe"

REM 분할 압축 해제
%zip_executable% x -o"%target_dir%" opencv.zip

REM 압축 해제 완료 메시지 출력
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
