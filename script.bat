@echo off
set /a n1=0
set /a n2=1
setlocal enabledelayedexpansion
for /f "tokens=*" %%a in (backup_path.txt) do (
  set line=%%a
  :loop
  echo|set /p=^!line:~%n1%,%n2%^!
  set /a n1=n1+1
  set /a n2=n2+1
  echo %n1%-%n2%
  pause
  goto :loop
)