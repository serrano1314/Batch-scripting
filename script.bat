@echo off
set /a na=0
set /a nb=0
set file=backup_path.txt
setlocal enabledelayedexpansion
for %%i in (%file%) do @set count=%%~zi
for /f "tokens=*" %%a in (%file%) do (
  set line=%%a 
  ::pause 
  :loop
  set ch=^!line:~%na%,1^!
  ::echo|set /p=!ch!
  set delim=;
  set end=?
  if %na% gtr %count% (
    echo [92mSCRIPTING SUCCESS...[0m
    pause
    goto :endloop
  )
  set /a na=%na%+1
  if !ch!==!delim! (
    ::echo ^!line:~%nb%,%na%^! >> output.txt
    echo ; >>output.txt
    echo|set /p=. 
  ) else (
    <nul set /p=!ch!>>output.txt
  )
  goto :loop
)
:endloop