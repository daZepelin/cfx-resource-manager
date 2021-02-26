@echo off

IF EXIST fxmanifest.lua Goto Error
set input=cerulean
set /p input=FX version (cerulean): 
echo fx_version '%input%' >> fxmanifest.lua

set input=gta5
set /p input=Game (gta5): 
echo game '%input%' >> fxmanifest.lua

set input=
set /p input=Description:
IF DEFINED input (
    echo description '%input%' >> fxmanifest.lua
)

set input=1.0.0
set /p input=Version(1.0.0): 
echo version '%input%' >> fxmanifest.lua

set input=
set /p input=Author:
IF DEFINED input (
    echo author '%input%' >> fxmanifest.lua
)

set input=
set /p input=Client script (blank for none):
IF DEFINED input (
    echo Found
    echo clent_scripts {'%input%'} >> fxmanifest.lua
    type nul > %input%
)

set input=
set /p input=Server script (blank for none): 
IF DEFINED input (
    echo server_scripts {'%input%'} >> fxmanifest.lua
    type nul  > %input%
)
Goto Created

:Created
echo Created cfx resource
Goto End

:Error
echo fxmanifest already exists
Goto End

:End
echo Closing
