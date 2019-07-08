
set directories_list=%1
set outputDirectory=%2
@echo off
for %%a in (%directories_list%) do ( 
 :: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/xcopy
 ECHO %%a
 if not exist %%a mkdir %%a
 xcopy %%a %outputDirectory%\%%a /y /i
 echo/
)