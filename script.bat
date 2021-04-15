@echo off
setlocal enabledelayedexpansion
set a/ n=3
for /f "tokens=1-20 delims=;" %%1 in (backup_path.txt) do (
  set line=%%1
  echo !line!
  set line=%%2
  echo !line!
  set line=%%3
  echo !line!
)
set /a n=!n!+1
