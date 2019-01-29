@ECHO OFF
IF "%OS%"=="Windows_NT" GOTO Init
ECHO CodeSign requires Windows NT.
GOTO End
:Init
VERIFY OTHER 2>NUL
SETLOCAL ENABLEEXTENSIONS
IF [%ERRORLEVEL%]==[0] GOTO Test
ECHO CodeSign requires enabled command extensions.
VERIFY >NUL
GOTO Done
:Test
IF EXIST "%~dp0signtool.exe" GOTO Sign
ECHO CodeSign is not initialized ^(SignTool missing^).
GOTO Done
:Sign
REM Open Source Developer, Nico Bendlin <nico@nicode.net> [2019-01-01P1Y]
"%~dp0signtool.exe" sign /sha1 E7EF26235542D7BF9BE107FBDFBFD2A8042EF4D1 /fd sha1   /tr http://time.certum.pl /td sha1       /v "%*" && ^
"%~dp0signtool.exe" sign /sha1 E7EF26235542D7BF9BE107FBDFBFD2A8042EF4D1 /fd sha256 /tr http://time.certum.pl /td sha256 /as /v "%*"
:Done
ENDLOCAL & EXIT /B %ERRORLEVEL%
:End
