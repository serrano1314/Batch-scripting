@echo off
echo.
echo      Usage: formatpath.bat ^<filename^>
echo. 
set /a na=0
set file=%~1
set outfile=output.txt
if exist %outfile% ( 
  echo %outfile% deleted
  del %outfile% 
  )
setlocal enabledelayedexpansion
for %%i in (%file%) do @set count=%%~zi
for /f "tokens=*" %%a in (%file%) do (
  set line=%%a 
  set delim=;
  :loop
  set ch=^!line:~%na%,1^!
  if %na% gtr %count% (
    echo.
    echo [92mSCRIPTING SUCCESS...[0m
    echo %outfile% file created at,
    pwd
    notepad %outfile%
    goto :endloop
  )
  set /a na=%na%+1
  if !ch!==!delim! (
    echo ;>>output.txt
    echo|set /p=.
  ) else (
    <nul set /p=!ch!>>output.txt
  )
  goto :loop
)
:endloop