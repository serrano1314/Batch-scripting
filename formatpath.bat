@echo off
goto :main

:filename
  set /a x=%x%+1
  set outfile=output%x%.txt
goto :eof

:main
  echo.
  echo      Usage: formatpath.bat ^<filename^>
  echo. 
  set /a na=0
  set /a x=0
  set file=%~1
  set outfile=output.txt
  :creatoutfile
  if exist %outfile% ( 
    call :filename
    goto :creatoutfile
  )
  setlocal enabledelayedexpansion
  for %%i in (%file%) do @set count=%%~zi
  for /f "tokens=*" %%a in (%file%) do (
    set line=%%a 
    set delim=;
    echo %date% %time%>>%outfile%
    :loop
    set ch=^!line:~%na%,1^!
    if %na% gtr %count% (
      echo.
      echo [92mSCRIPTING SUCCESS...[0m
      echo %outfile% file created at %cd%
      
      start %cd%\%outfile%
      goto :endloop
    )
    set /a na=%na%+1
    if !ch!==!delim! (
      echo ;>>%outfile%
      echo|set /p=.
    ) else (
      <nul set /p=!ch!>>%outfile%
    )
    goto :loop
  )
  :endloop
goto :eof
