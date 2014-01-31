echo off 
echo PrepForSubmission.bat v1.2 (updated 31 Jan 2014)
echo By Joey Foo (joeyfoo.com) and contributors
echo -----
echo.
echo DISCLAIMER: This batch file is provided AS-IS, it's your responsibility 
echo to double-check before submission! 
echo.
echo ----------

echo.
echo Enter the output directory name (usually your admin number for submission).
set /p outputDir=
echo.
echo Starting...

rmdir ..\%outputDir% /s /q

mkdir ..\%outputDir%
xcopy * ..\%outputDir% /s /c /i

cd ..\%outputDir%

del *.opensdb /q
del *.ncb /q
del *.suo /q
del *.sdf /q
del *.user /q

del .gitignore /q
rmdir .git /s /q

rmdir ipch /q

del *.bat /q

for /d /r . %%d in (Debug,Release) do @if exist "%%d" rd /s /q "%%d"

echo.
echo Completed. 
pause
