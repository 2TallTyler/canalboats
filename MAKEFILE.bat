@ECHO OFF

ECHO Batch: Running Python file merger
python %~dp0\nmlc\merge_nml.py

ECHO Batch: Copying merged file to src/merged directory
copy /y /v %~dp0\nmlc\sals_canalboats.nml %~dp0\src\merged\sals_canalboats.nml

ECHO Batch: Running NMLC compiler
%~dp0\nmlc\nmlc -c -t src\custom_tags.txt -l src\lang --grf sals_canalboats.grf nmlc\sals_canalboats.nml

ECHO Batch: Cleaning up
DEL %~dp0\nmlc\sals_canalboats.nml

set /P c=Complete!
if /I "%c%" EQU "TT" (goto :copy
) else (exit)

:copy
ECHO Copying to NewGRF directory
copy /y /v %~dp0\sals_canalboats.grf C:\Users\train\Documents\OpenTTD\newgrf\
pause
exit
