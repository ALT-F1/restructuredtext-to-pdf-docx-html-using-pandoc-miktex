:: Copyright (c) 2019 ALT-F1, We believe in the projects we work on™
@ECHO OFF 


set inputFile=%1
echo inputFile=%1
set backupDirectory=backup
if not exist %backupDirectory% mkdir %backupDirectory%

REM set the suffix as 2019-07-08_12_53_56
call generate-local-date-time.bat 

set pathBackupFile=%backupDirectory%\%filePrefix%-%BACKUP_FILENAME%%fileExtension%


ECHO copy %inputFile% to %pathBackupFile%
ECHO backup source files into %backupDirectory%\ directory

copy %inputFile% "%pathBackupFile%"