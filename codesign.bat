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
REM Open Source Developer, Nico Bendlin <nico@nicode.net> [2018-02-12/2018-12-12]
"%~dp0signtool.exe" sign /sha1 695181301012BC5FD620EEAD86F949AC8679FCD6 /fd sha1   /tr http://time.certum.pl /td sha1       /v "%*" && ^
"%~dp0signtool.exe" sign /sha1 695181301012BC5FD620EEAD86F949AC8679FCD6 /fd sha256 /tr http://time.certum.pl /td sha256 /as /v "%*"
:Done
ENDLOCAL & EXIT /B %ERRORLEVEL%
:End
