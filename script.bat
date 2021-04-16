@echo off
set /a na=0
set /a nb=0
setlocal enabledelayedexpansion
for /f "tokens=*" %%a in (backup_path.txt) do (
  set line=%%a
  pause 
  :loop
  set ch=^!line:~%na%,1^!
  echo|set /p=!ch!
  set delim=;
  set /a na=%na%+1
  if !ch!==!delim! (
    ::echo ^!line:~%nb%,%na%^! >> output.txt
    echo. >> output.txt
    set /a nb=%na%
    pause
  ) else (
    <nul set /p=!ch!>>output.txt
  )
  goto :loop
)
