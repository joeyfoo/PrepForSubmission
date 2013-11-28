echo off 
echo PrepForSubmission.bat v1.1 (updated 28 Nov 2013)
echo By Joey Foo (joeyfoo.github.io)
echo -----
echo This batch file is for use on the root directory of a Visual Studio solution, 
echo and will copy the current folder out and delete unnecessasary files (\Debug, 
echo opensdb, ncb, suo .etc) in preparation for zipping and submission online. 
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

del ..\%outputDir%\*.opensdb /q
del ..\%outputDir%\*.ncb /q
del ..\%outputDir%\*.suo /q
del ..\%outputDir%\*.sdf /q
del ..\%outputDir%\*.user /q

del ..\%outputDir%\.gitignore /q
rmdir ..\%outputDir%\.git /s /q

rmdir ..\%outputDir%\ipch /q

del ..\%outputDir%\*.bat /q

cd ..\%outputDir%
for /d /r . %%d in (Debug,Release) do @if exist "%%d" rd /s /q "%%d"

echo.
echo Completed. 
pause