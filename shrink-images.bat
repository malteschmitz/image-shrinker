@echo off

set outdir=C:\Users\em\Downloads\kleine-fotos
set suffix=_klein
set size=1024
set quality=95

echo Image Shrinker

setlocal ENABLEDELAYEDEXPANSION
rem *** Take the cmd-line, remove all until the first parameter
rem *** Copy cmdcmdline without any modifications, as cmdcmdline has some strange behaviour
set "params=!cmdcmdline!"
set "params=!params:~0,-1!"
set "params=!params:*" =!"

rem create outdir if not yet existing
if not exist %outdir% mkdir %outdir%

rem Split the parameters on spaces but respect the quotes
for %%G IN (!params!) do (
  magick convert "%%~G" -resize %size%x%size% -quality %quality% "%outdir%\%%~nG%suffix%%%~xG"
  echo %%~nG%%~xG ...
)

start %outdir%
rem pause

rem ** The exit is important, so the cmd.exe doesn't try to execute commands after ampersands
exit
