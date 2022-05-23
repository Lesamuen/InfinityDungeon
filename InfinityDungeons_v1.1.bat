@echo off
title Infinity Dungeons
color 02
:mainmenu
cls
echo You are currently playing Infinity Dungeons Release v1.1
echo What would you like to do? (newgame/loadgame/quit)
set /p nextmove=
if "%nextmove%"=="newgame" goto newgame
if "%nextmove%"=="loadgame" (
cls
echo Sorry! Saving and loading is currently disabled!
pause>nul
goto mainmenu
)
if "%nextmove%"=="quit" exit
goto mainmenu
:newgame
set maxhealth=100
set health=100
set healthregen=5
set maxmana=0
set mana=0
set manaregen=10
set maxstamina=100
set stamina=100
set staminaregen=10
set hunger=105
set thirst=107
set level=1
set xp=0
set xptonext=100
set score=0
cls
echo You slowly gain consciousness.
echo A drip of water falls into your face from somewhere, forcing you awake.
echo You sit up and gaze around you.
echo Why are you here?
echo You are in a room lit up by 4 floating balls of light in each corner.
echo The walls appear to be made of stone brick.
echo Engraved pillars connect the walls at each corner.
echo You examine yourself...you have nothing but your fists.
echo You look up again at the dark hallway in front of you.
echo There is only one way forward.
pause >nul
:emptyroom
set prevroom=empty
cls
if %hunger% GTR 0 (
set /a hunger-=5
) else (
set /a health-=20
echo WARNING: You are currently starving!
)
if %hunger% LSS 0 set /a hunger=0
if %thirst% GTR 0 (
set /a thirst-=7
) else (
set /a health-=20
echo WARNING: You are currently dehydrating!
)
if %thirst% LSS 0 set /a thirst=0
if %health% LEQ 0 goto die
echo What do you do now?
echo Type help to see your available commands.
set /p nextmove=
if "%nextmove%"=="nextroom" goto move
if "%nextmove%"=="rest" goto rest
if "%nextmove%"=="meditate" goto meditate
if "%nextmove%"=="inventory" goto inventory
if "%nextmove%"=="help" goto help
if "%nextmove%"=="quit" exit
set /a hunger+=5
set /a thirst+=7
goto emptyroom
:itemroom
set prevroom=item
cls
goto emptyroom
:rest
cls
if %hunger% LEQ 0 (
echo You're too hungry to rest right now.
pause>nul
set /a health+=20
goto emptyroom
)
if %thirst% LEQ 0 (
echo You're too thirsty to rest right now.
pause>nul
set /a health+=20
goto emptyroom
)
set /a health+=%healthregen%
if %health% GTR %maxhealth% (
set /a health=%maxhealth%
)
set /a stamina+=%staminaregen%
if %stamina% GTR %maxstamina% (
set /a stamina=%maxstamina%
)
echo You rest. You regain %healthregen% HP and %staminaregen% SP.
pause>nul
goto emptyroom
:meditate
cls
if %hunger% LEQ 0 (
echo The hunger breaks your concentration.
pause>nul
set /a health+=20
goto emptyroom
)
if %thirst% LEQ 0 (
echo The thirst breaks your concentration.
pause>nul
set /a health+=20
goto emptyroom
)
set /a mana+=%manaregen%
if %mana% GTR %maxmana% (
set /a mana=%maxmana%
)
echo You meditate. You regain %manaregen% MP.
pause>nul
goto emptyroom
:inventory
cls
echo LVL: %level%
echo XP: %xp%/%xptonext%
echo:
echo HP: %health%/%maxhealth%
echo SP: %stamina%/%maxstamina%
echo MP: %mana%/%maxmana%
echo:
echo Hunger: %hunger%/100
echo Thirst: %thirst%/100
pause>nul
if "%prevroom%"=="empty" (
set /a hunger+=5
set /a thirst+=7
goto emptyroom
)
if "%prevroom%"=="item" goto itemroom
:help
cls
echo help : Lists available commands
echo:
echo nextroom : Goes to the next room
echo:
echo rest : Regain a bit of health and stamina.
echo:
echo meditate : Absorb a bit of mana from the dungeon air.
echo:
echo inventory : Shows you your inventory
echo:
echo quit : Exits the game
pause>nul
if "%prevroom%"=="empty" (
set /a hunger+=5
set /a thirst+=7
goto emptyroom
)
if "%prevroom%"=="item" goto itemroom
:move
set /a chance=%RANDOM% %% 100 + 1
if %chance% LEQ 50 (
cls
set /a score+=1
echo You have entered another empty room.
pause>nul
goto emptyroom
)
if %chance% LEQ 85 (
rem Placeholder for monster
cls
set /a score+=1
echo You have entered another empty room.
pause>nul
goto emptyroom
)
if %chance% LEQ 100 (
cls
set /a score+=2
echo You come across a room with a glowing chest in the center.
echo You open the chest and find...
pause>nul
goto itemroom
)
:die
cls
echo You have died...alone in an endless dungeon...remembered by no one.
echo C'est la vie.
echo:
echo Final score: %score%
pause>nul
goto mainmenu

rem --TODO--
rem Scoring system: +1 for each new room (+2 for item rooms), +3 for killing monsters, +25 for killing minibosses, +100 for killing bosses, +5 for level up
rem Rename variables
rem Add maxhealth, increase by boss drop
rem Change health potions accordingly
rem Completely revamp items and monsters and stats and...yeah everything
rem More creative modifiers and monsters and shit
rem Make modifiers percent based, not additive, to make dungeon truly endless (of course, until max value 32767)
rem Safe room > Monster room > Item Room
rem Free items more trash than monster drops OR monster drops more items
rem Special stats/abilities for items
rem Tiers of potions
rem Food types
rem 2 handed weapons
rem Add ability to save/load in battle
rem Mana
rem Mana Potions
rem Magic weapons do more damage but use mana
rem more damage = more mana
rem Mana & Stamina does not regen in battle
rem Ranged weapons hit faster but use ammo & less stamina
rem Different ammo pickups? (Arrows)
rem Ammo takes up item slot but stacks?
rem Mana regen
rem Attack Speed
rem Retreat needs stamina
rem Thirst & Water
rem Miniboss 5% chance & Boss 1% chance
rem Inventory?! (Do arrays exist in batch?)
rem CRAFTING?!
rem MODIFIER REFORGING?!?!!?!?!?!
rem NPCS FOR THE ABOVE 2?!?!?!?!?!?!?!?!?!??!!??!?!?!?? (WHERE'S DAH BLACKSMITH)
rem Find way to make saving/loading more efficient or less messy

rem Copyright (c) 2018 by Samuel Nguyen