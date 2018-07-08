@echo off
set arg=%1
IF "%arg%"=="" (SET arg=No comment)
git add *
git commit -m "%arg%"
git push
pause