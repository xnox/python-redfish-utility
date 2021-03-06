::    RESTful Interface Tool Sample Script for HPE iLO Products    ::
::  Copyright 2014, 2019 Hewlett Packard Enterprise Development LP ::

:: Description:  This is a sample batch script to clear the event  ::
::               log on following devices:                         ::
::                 Integrated Lights-Out 4 (iLO 4)                 ::
::                 Integrated Lights-Out 5 (iLO 5)                 ::

::        Firmware support information for this script:            ::
::            iLO 5 - All versions.                                ::
::            iLO 4 - All versions.                                ::


@echo off
set argC=0
for %%x in (%*) do Set /A argC+=1
if %argC% EQU 3 goto :remote
if %argC% EQU 0 goto :local
goto :error

:local
ilorest serverlogs --selectlog=IEL --clearlog
ilorest logout
goto :exit
:remote
ilorest serverlogs --selectlog=IEL --clearlog --url=%1 --user %2 --password %3
ilorest logout
goto :exit

:error
echo Usage:
echo        remote: Clear_EventLog.bat ^<iLO url^> ^<iLO username^>  ^<iLO password^>
echo        local:  Clear_EventLog.bat

:exit