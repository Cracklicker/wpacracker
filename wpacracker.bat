@echo off
MODE CON: COLS=69 LINES=25
title WPA CRACKER - by SHOGI
chcp 65001 >nul 
cd hashcat
set dict=none selected
set mode=phone number
set hashfile=none selected
color 5
:start
call :banner

:banner
cls
MODE CON: COLS=69 LINES=25
echo.
echo.
echo                   ╦ ╦╔═╗╔═╗  ╔═╗╔═╗╔═╗╔═╗╦╔═╔═╗╦═╗
echo                   ║║║╠═╝╠═╣  ║  ╠╦╝╠═╣║  ╠╩╗║╣ ╠╦╝
echo                   ╚╩╝╩  ╩ ╩  ╚═╝╩╚═╩ ╩╚═╝╩ ╩╚═╝╩╚═
echo.           
echo.       
echo                              MAIN MENU       
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo     current mode: %mode% ^| current hash file: %hashfile%
echo.
echo         ╔═(1) set mode  
echo         ║ 
echo         ╠══(2) set hash file
echo         ║  
echo         ╠═══(3) run  
echo         ║  
echo         ╚╦═══(4) view result  
echo          ║  
set /p input=.%BS%         ╚══════^>  

if /I %input% EQU 1 goto setm
if /I %input% EQU 2 goto setf
if /I %input% EQU 3 goto run
if /I %input% EQU 4 goto results
cls
goto start

:setm
cls
MODE CON: COLS=69 LINES=25
echo.
echo.
echo                   ╦ ╦╔═╗╔═╗  ╔═╗╔═╗╔═╗╔═╗╦╔═╔═╗╦═╗
echo                   ║║║╠═╝╠═╣  ║  ╠╦╝╠═╣║  ╠╩╗║╣ ╠╦╝
echo                   ╚╩╝╩  ╩ ╩  ╚═╝╩╚═╩ ╩╚═╝╩ ╩╚═╝╩╚═
echo.           
echo.        
echo                             CHOOSE MODE      
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo         ╔═(1) phone number bruteforce  
echo         ║ 
echo         ╠══(2) dictionary attack
echo         ║       Selected dictionary: %dict%
echo         ║  
echo         ╠═══(3) choose dictionary  
echo         ║  
echo         ╚╦═══(4) help  
echo          ║  
set /p input=.%BS%         ╚══════^>  
if /I %input% EQU 1 set mode=phone number
if /I %input% EQU 2 set mode=dictionary
if /I %input% EQU 3 goto chdict
if /I %input% EQU 4 goto modehelp
cls
goto start

:chdict
cls
echo.
echo.
echo                   ╦ ╦╔═╗╔═╗  ╔═╗╔═╗╔═╗╔═╗╦╔═╔═╗╦═╗
echo                   ║║║╠═╝╠═╣  ║  ╠╦╝╠═╣║  ╠╩╗║╣ ╠╦╝
echo                   ╚╩╝╩  ╩ ╩  ╚═╝╩╚═╩ ╩╚═╝╩ ╩╚═╝╩╚═
echo.           
echo.        
echo                          CHOOSE DICTIONARY      
echo.
echo                            Recommended:
echo            cyclone.txt ^| BIG-WPA-LIST-1 ^| BIG-WPA-LIST-2
echo.
SET /P dict="What dictionary should I use? "
ECHO You chose to use the dictionary: %dict%
TIMEOUT /T 2 >NUL
goto setm

:modehelp
cls
echo.
echo.
echo                   ╦ ╦╔═╗╔═╗  ╔═╗╔═╗╔═╗╔═╗╦╔═╔═╗╦═╗
echo                   ║║║╠═╝╠═╣  ║  ╠╦╝╠═╣║  ╠╩╗║╣ ╠╦╝
echo                   ╚╩╝╩  ╩ ╩  ╚═╝╩╚═╩ ╩╚═╝╩ ╩╚═╝╩╚═
echo.           
echo.        
echo                                 HELP 
echo.
echo.
echo                To Use the Tool select from either
echo                phone number mode (recommended) to
echo                bruteforce all israeli phone numbers
echo                or select a dictionary and then pick
echo                dictionary mode to use a dictionary
echo                attack. Returning to mode selection
echo                in 10 seconds.
timeout /T 10 >NUL
goto setm

:setf
cls
MODE CON: COLS=69 LINES=25
echo.
echo.
echo                   ╦ ╦╔═╗╔═╗  ╔═╗╔═╗╔═╗╔═╗╦╔═╔═╗╦═╗
echo                   ║║║╠═╝╠═╣  ║  ╠╦╝╠═╣║  ╠╩╗║╣ ╠╦╝
echo                   ╚╩╝╩  ╩ ╩  ╚═╝╩╚═╩ ╩╚═╝╩ ╩╚═╝╩╚═
echo.           
echo.        
echo                            CHOOSE HASH FILE      
echo.
echo                    Do You want to view what files are available?
echo                                     (Y/N)
set /p input=.%BS% 
IF "%input%"=="Y" (
 goto hashes
)ELSE IF /I "%input%"=="y" (
    goto hashes
) ELSE (
SET /P hashfile="                       What Hash File should I use? "
TIMEOUT /T 2 >NUL
goto start
)

:hashes
cls
MODE CON: COLS=69 LINES=100

echo.
echo.
echo                   ╦ ╦╔═╗╔═╗  ╔═╗╔═╗╔═╗╔═╗╦╔═╔═╗╦═╗
echo                   ║║║╠═╝╠═╣  ║  ╠╦╝╠═╣║  ╠╩╗║╣ ╠╦╝
echo                   ╚╩╝╩  ╩ ╩  ╚═╝╩╚═╩ ╩╚═╝╩ ╩╚═╝╩╚═
echo.           
echo.        
echo                            CHOOSE HASH FILE      
echo.
echo                        Loaded Hash Files in Folder:
DIR *.hc22000 /B /A-D
pause
goto setf

:run
cls
echo.
echo.
echo                   ╦ ╦╔═╗╔═╗  ╔═╗╔═╗╔═╗╔═╗╦╔═╔═╗╦═╗
echo                   ║║║╠═╝╠═╣  ║  ╠╦╝╠═╣║  ╠╩╗║╣ ╠╦╝
echo                   ╚╩╝╩  ╩ ╩  ╚═╝╩╚═╩ ╩╚═╝╩ ╩╚═╝╩╚═
echo.           
echo.        
echo                     STARTED CRACKING %hashfile%     
echo                        USING %mode% ATTACK
echo.
IF "%mode%"=="phone number" (
    hashcat.exe -a 3 -m 22000 %hashfile% 05?d?d?d?d?d?d?d?d
) ELSE (
    IF "%mode%"=="dictionary" (
        hashcat.exe -a 0 -m 22000 %hashfile% %dict%
    ) ELSE (
        ECHO Mode is neither 'phone number' nor 'dictionary'
    )
)
pause
goto start

:results
cls
echo.
echo.
echo                   ╦ ╦╔═╗╔═╗  ╔═╗╔═╗╔═╗╔═╗╦╔═╔═╗╦═╗
echo                   ║║║╠═╝╠═╣  ║  ╠╦╝╠═╣║  ╠╩╗║╣ ╠╦╝
echo                   ╚╩╝╩  ╩ ╩  ╚═╝╩╚═╩ ╩╚═╝╩ ╩╚═╝╩╚═
echo.           
echo.        
echo                     RESULTS FOR %hashfile%
echo.
IF "%mode%"=="phone number" (
    hashcat.exe -a 3 -m 22000 %hashfile% 05?d?d?d?d?d?d?d?d --show
) ELSE (
    IF "%mode%"=="dictionary" (
        hashcat.exe -a 0 -m 22000 %hashfile% %dict% --show
    ) ELSE (
        ECHO Mode is neither 'phone number' nor 'dictionary'
    )
)
pause
goto start