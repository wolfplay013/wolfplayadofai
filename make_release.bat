SETLOCAL ENABLEDELAYEDEXPANSION
set /p version=<VERSION.txt
mkdir tmp
cd tmp
mkdir wolfplayadofai
copy ../Info.json wolfplayadofai
copy ../wolfplayadofai/bin/Release/wolfplayadofai.dll wolfplayadofai

cd wolfplayadofai
for /f "delims=" %%a in (Info.json) do (
    SET s=%%a
    SET s=!s:$VERSION=%version%!
    echo !s!
)>>"InfoChanged.json"
del Info.json
move InfoChanged.json Info.json
cd ..

tar -a -c -f wolfplayadofai-%version%.zip wolfplayadofai
move wolfplayadofai-%version%.zip ..
cd ..
del tmp
pause