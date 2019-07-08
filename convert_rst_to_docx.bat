
@echo off

CLS

if "%~1"=="" goto missingparameter


:: either insert the file name or %1 if you want read the filename from the command line _convert_rst_to_docx.bat "myfilename.rst"
set inputFile=%1
ECHO before inputFile %inputFile%

REM for /f "useback tokens=*" %%a in ('%inputFile%') do set inputFile=%%~a
set inputFile=%inputFile:"=%

ECHO after inputFile=%inputFile%

set filePrefix=%inputFile:~0,-4%
set fileExtension=%inputFile:~-4%
echo filePrefix=%filePrefix%
echo fileExtension=%inputFile:~-4%
echo inputFile=%inputFile%

set outputFilePrefix=%filePrefix%
echo outputFilePrefix=%outputFilePrefix%

set reference-doc=.pandoc\reference-docx.docx
set outputDirectory=output

call backup_source.bat "%inputFile%"

set directories_list=img;
call copy_directories_for_html_export.bat %directories_list% %outputDirectory%


if not exist %outputDirectory% mkdir %outputDirectory%

:: https://pandoc.org/getting-started.html#step-6-converting-a-file

:: Copyright (c) 2019 ALT-F1, We believe in the projects we work on™

ECHO Generate docx from %inputFile%

pandoc %inputFile% --from rst --to docx -s -o "%outputDirectory%\%outputFilePrefix%.docx"  --fail-if-warnings --reference-doc=%reference-doc%

ECHO Generate html from %inputFile%
pandoc %inputFile% --from rst --to html -s -o "%outputDirectory%\%outputFilePrefix%.html"  --fail-if-warnings


rem start %outputDirectory%\%outputFilePrefix%.docx
rem start %outputDirectory%\%outputFilePrefix%.html

ECHO Generate pdf from %inputFile%
pandoc %inputFile% --from rst --to latex -s -o "%outputDirectory%\%outputFilePrefix%.pdf" 
rem --template eisvogel 

rem start %outputDirectory%\%outputFilePrefix%.latex.pdf

ECHO Pandoc - end generation
ECHO Output files stored in %outputDirectory%\
ECHO DO NOT FORGET TO UPDATE THE FIELDS IN THE docx file by hitting F9
PAUSE

EXIT /B

:missingparameter

ECHO usage : %~n0%~x0 filename.rst to convert