::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWGPeyG8paD9GRRKHAFuoCawZ6/zo086CtEgRW/I6arPr1aOLMtMb70noSbAi2n5fiv8DAxdLQiGkex03rFJOt3eRMsOghx3kT26A6k4mSitklDKw
::fBE1pAF6MU+EWGPeyG8paD9GRRKHAFuoCawZ6/zo086CtEgRW/I6arPr1aOLMtMb70noSbAi2n5fiv8DAxdLQiGkex03rFJOt3eRMsOghx3kT26G6k81CXMlyXPD3Us=
::fBE1pAF6MU+EWGPeyG8paD9GRRKHAFuoCawZ6/zo086CtEgRW/I6arPr1aOLMtMb70noSbAi2n5fiv8DAxdLQiGkex03rFJOt3eRMsOghx3kT3Kg1m05F2Bi1i3An3pb
::YAwzoRdxOk+EWAjk
::fBw5plQjdDWDJHSdtGYiIQ1RcDSQM3K/BaEP1Mz++e+LrV0YRt4Pd5jeyIeGJewf1mPreZIoxE5Vl8cfMBJVfxWufTMgu2tHiXOMOcOTpDC4ExHH70g/ew==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksELA==
::ZQ05rAF9IBncCkqN+0xwdVsEAlTTXA==
::ZQ05rAF9IAHYFVzEqQIWJxdQSRbCCGS1CqZ8
::eg0/rx1wNQPfEVWB+kM9LVsJDCKNMG+/FPUo5+f3/Kqmsl19
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIVMA9GTQeWfE21CrEZ+qjP/e+C7g07Xe46OLvJ37HOIe4Xqn/NRdYL33Zf2P8eCR44
::dhA7uBVwLU+EWHiI4kMiJ1twYCfi
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE1U4mKQlbDCCuHyv3RudMubyb
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmT41V+KRdCTRaNOGe5SLYT5Yg=
::Zh4grVQjdDWDJHSdtGYiIQ1RcDSQM3K/BaEP1Mz++e+LrV0YRt4Pd5jeyIeGJewf1mPreZIoxE5Vl8cfMChXawCoazM4qH1Ws2C5EciQtwrzCnyG6UcjW0Rkly3VlC5b
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:menu
cls

echo ===================================
echo      Folder Tools By AlvaroDLC
echo ===================================
echo            Menu Options
echo ===================================
echo 1. Run File Tree 
echo 2. Run Folder Tree
echo 3. Run ZIP File Tree
echo 4. Exit
echo ===================================
echo         www.alvarodlc.com
echo ===================================

set /p choice=Please select an option (1-4): 

if %choice%==1 (
    PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0TreeFilev1.ps1"
    pause
    goto menu
)
if %choice%==2 (
    PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0TreeFolderv1.ps1"
    pause
    goto menu
)
if %choice%==3 (
    PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0TreeZIPFilev1.ps1"
    pause
    goto menu
)
if %choice%==4 (
    echo Exiting...
    exit
)
echo Invalid choice, please select a valid option.
pause
goto menu
