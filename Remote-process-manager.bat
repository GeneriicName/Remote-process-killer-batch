@echo off
setlocal enabledelayedexpansion
:another
set /p pc="Enter the name of the remote computer: "
if exist \\!pc!\c$ (
   tasklist /s !pc!
   :again
   set /p "task=Choose from the tasks above or A for another PC: "
   if "!task!"=="a" (goto another)
   if "!task!"=="A" (goto another)
   taskkill /s !pc! /im !task! /T /f
   ping -n 5 127.0.0.1 > nul
   goto again
) else (
   echo Invalid PC !pc! or it its not available at this time
)
goto another
setlocal DisableDelayedExpansionEnter 