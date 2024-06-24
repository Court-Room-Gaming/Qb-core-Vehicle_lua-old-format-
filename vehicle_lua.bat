@echo off
setlocal EnableDelayedExpansion

set LUA_FILE=output.lua

echo return { > %LUA_FILE%

for /r %%F in (*.ytd) do (
    set "fullpath=%%F"
    rem Extracting file name without extension
    for %%A in ("!fullpath!") do set "filename=%%~nxA"
    
    rem Replace underscores (_) with spaces
    set "name=!filename:_= !"

    echo ['!name!'] = { >> %LUA_FILE%
    echo     ['name'] = '!name!', >> %LUA_FILE%
    echo     ['model'] = '!name!', >> %LUA_FILE%
    echo     ['price'] = 20000, >> %LUA_FILE%
    echo     ['category'] = 'compacts', >> %LUA_FILE%
    echo     ['categoryLabel'] = 'Compacts', >> %LUA_FILE%
    echo     ['hash'] = '!name!', >> %LUA_FILE%
    echo     ['shop'] = 'pdm', >> %LUA_FILE%
    echo }, >> %LUA_FILE%
)

echo } >> %LUA_FILE%

echo Done.

