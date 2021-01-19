REM set critical config file variables (e.g. extensions)
REM remaining config values will be set to defaults by pyRevit

@echo off
setlocal ENABLEDELAYEDEXPANSION

REM variables
set parentpath=%AppData%\pyRevit
set filename="%parentpath%\pyRevit_config.ini"
set extensionpath=%AppData%\pyRevitExtensions
set extensionpath=%extensionpath:\=\\%

if not exist "%parentpath%" mkdir "%parentpath%""
if exist %filename% (
    REM keep other existing config intact while overwriting userextensions
    echo.>>%filename%
    echo [core]>>%filename%
    echo userextensions = ["%extensionpath%"]>>%filename%
) else (
    echo [core]>%filename%
    echo userextensions = ["%extensionpath%"]>>%filename%
)