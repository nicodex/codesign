@ECHO OFF
VERIFY OTHER 2> NUL
SETLOCAL ENABLEEXTENSIONS
IF [%ERRORLEVEL%]==[0] GOTO Copy
ECHO This script requires enabled command extensions.
GOTO Done
:Copy
SET WINSDK81=%ProgramFiles(x86)%
IF "%WINSDK81%"=="" SET WINSDK81=%ProgramFiles%
SET WINSDK81=%WINSDK81%\Windows Kits\8.1
COPY /B /D /Y "%WINSDK81%\bin\x86\makecat.exe" "%~dp0" && ^
COPY /B /D /Y "%WINSDK81%\bin\x86\makecat.exe.manifest" "%~dp0" && ^
COPY /B /D /Y "%WINSDK81%\bin\x86\Microsoft.Windows.Build.Signing.mssign32.dll.manifest" "%~dp0" && ^
COPY /B /D /Y "%WINSDK81%\bin\x86\Microsoft.Windows.Build.Signing.wintrust.dll.manifest" "%~dp0" && ^
COPY /B /D /Y "%WINSDK81%\bin\x86\mssign32.dll" "%~dp0" && ^
COPY /B /D /Y "%WINSDK81%\bin\x86\signtool.exe" "%~dp0" && ^
COPY /B /D /Y "%WINSDK81%\bin\x86\signtool.exe.manifest" "%~dp0" && ^
COPY /B /D /Y "%WINSDK81%\bin\x86\wintrust.dll" "%~dp0"
:Done
SET EXITCODE=%ERRORLEVEL%
IF NOT [%EXITCODE%]==[0] PAUSE
ENDLOCAL & EXIT /B %EXITCODE%
