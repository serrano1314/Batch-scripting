@echo off
setlocal enabledelayedexpansion
set /a n=1
for /f "tokens=1-20 delims=;" %%1 in (backup_path.txt) do (
  echo|set /p=%%%%!n!>var.txt
  set line=echo !line!
  for /f %%g in (var.txt) do (
    echo %%1
    echo %%g
  )
  set /a n=!n!+1
  set line=echo %%%!n!
  !line!
)
