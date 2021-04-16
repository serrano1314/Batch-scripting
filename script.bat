@echo off
set /a n=1
setlocal enabledelayedexpansion
for /f "tokens=1-20 delims=;" %%1 in (backup_path.txt) do (
  set /a n=n+1
  echo|set /p=%%%%%n%
  echo.
  set /a n=%n%+1
  echo|set /p=%%%%%n%
)