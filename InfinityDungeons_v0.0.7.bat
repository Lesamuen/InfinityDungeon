@echo off
:something
cls
echo You are playing Infinity Dungeons Pre-Alpha v0.0.7
echo Are you sure you want to contiue? (yes/no)
set /p somethingelse=
if %somethingelse% == yes goto start
if %somethingelse% == no exit
goto something
:start
cls
echo What is your next move?
echo Say help for a list of possible moves.
set /p nextmove=
if %nextmove% == begin goto enterdungeon
if %nextmove% == thisgamesucks exit
if %nextmove% == help goto helpstart
if %nextmove% == crashthegame exit
goto start
:helpstart
cls
echo begin : Begins the game
echo.
echo thisgamesucks : Closes the game
echo.
echo help : Shows a list of available commands
echo.
echo crashthegame : Closes the game
echo.
pause
goto start
:enterdungeon
set head=Someone's Rusty Helmet
set torso=Your Grandma's Ripped Sweater
set legs=Your Best Friend's Pajamas
set footwear=Holy Socks
set weapon=Stick
set headdesc=You think this used to be your great-great-great grandfather's from the war, but what-evs...
set torsodesc=The hole came from where she got stabbed.
set legsdesc=You would thank your friend, but the last time you ever saw him was over 50 years ago...
set footweardesc=PUNZ4FUNZ!
set weapondesc=It used to belong to your dog. This stick brings you sad memories...
set headstrength=1
set headwisdom=0
set headarmor=2
set torsostrength=0
set torsowisdom=0
set torsoarmor=1
set legsstrength=0
set legswisdom=0
set legsarmor=1
set footwearstrength=0
set footwearwisdom=0
set footweararmor=1
set weaponstrength=1
set weaponwisdom=0
set weaponarmor=0
set weapondamage=1
set /a wisdom=%headwisdom% + %torsowisdom% + %legswisdom% + %footwearwisdom% + %weaponwisdom%
set /a strength=%headstrength% + %torsostrength% + %legsstrength% + %footwearstrength% + %weaponstrength%
set /a armor=%headarmor% + %torsoarmor% + %legsarmor% + %footweararmor% + %weaponarmor%
set health=100
set weapontype=melee
if %weapontype% == melee set /a damage=%weapondamage% + %strength%/5
if %weapontype% == magical set /a damage=%weapondamage% + %wisdom%/5
cls
echo You suddenly wake up with a start...
echo A drip of water falls into your face...
echo You look around you.
echo You are in a dark room. There are 4 corridors.
pause
cls
goto main
:main
echo What do you do now?
echo Type help to see your available commands.
set /p nextmove=
if %nextmove% == help goto helpdungeon
if %nextmove% == left goto move
if %nextmove% == right goto move
if %nextmove% == front goto move
if %nextmove% == back goto move
if %nextmove% == suicide goto die
if %nextmove% == save goto save
if %nextmove% == quit exit
if %nextmove% == inventory goto inventory
if %nextmove% == stats goto stats
cls
echo That is an invalid command!
goto main
:helpdungeon
cls
echo help : Lists available commands
echo.
echo left : Go through the left corridor
echo.
echo right : Go through the right corridor
echo.
echo front : Go through the front corridor
echo.
echo back : Go through the back corridor
echo.
echo suicide : Kill yourself
echo.
echo save : Saves the game
echo.
echo inventory : Shows you your inventory
echo.
echo quit : Exits the game
echo.
echo stats : Shows you your stats
pause >nul
cls
goto main
:save
cls
echo Sorry! Saving hasn't been implemented yet!
goto main
:move
set /a chance=%RANDOM% %% 4 + 1
if %chance% == 1 goto randomitem
if %chance% == 2 goto randommonster
if %chance% == 3 goto safe
if %chance% == 4 goto trap
:randomitem
cls
echo You found an item!
echo Sorry! The items mechanism hasn't been added yet!
goto main
:randommonster
cls
set monsterhealth=0
set monsterdamage=0
set monsterarmor=0
set /a monster=%RANDOM% %% 10 + 1
if %monster% == 1 set monsterprefix=Gruesome
if %monster% == 2 set monsterprefix=Gross
if %monster% == 3 set monsterprefix=Dangerous
if %monster% == 4 set monsterprefix=Titanic
if %monster% == 5 set monsterprefix=Toxic
if %monster% == 6 set monsterprefix=Radioactive
if %monster% == 7 set monsterprefix=Magical
if %monster% == 8 set monsterprefix=Godly
if %monster% == 9 set monsterprefix=Uber
if %monster% == 10 set monsterprefix=Somethingy
set /a monster=%RANDOM% %% 10 + 1
if %monster% == 1 set monsterrank=New-At-This-Game
if %monster% == 2 set monsterrank=Noob
if %monster% == 3 set monsterrank=Recruit
if %monster% == 4 set monsterrank=Rookie
if %monster% == 5 set monsterrank=Lieutenant
if %monster% == 6 set monsterrank=General
if %monster% == 7 set monsterrank=Queen
if %monster% == 8 set monsterrank=King
if %monster% == 9 set monsterrank=Uberboss
if %monster% == 10 set monsterrank=God
set /a monster=%RANDOM% %% 10 + 1
if %monster% == 1 set monstertype=Slime
if %monster% == 2 set monstertype=Zombie
if %monster% == 3 set monstertype=Skeleton
if %monster% == 4 set monstertype=Spider
if %monster% == 5 set monstertype=Vampire
if %monster% == 6 set monstertype=Barbarian
if %monster% == 7 set monstertype=Orc
if %monster% == 8 set monstertype=Draconian
if %monster% == 9 set monstertype=Werewolf
if %monster% == 10 set monstertype=Robot
set monstername=%monsterprefix% %monstertype% %monsterrank%
echo You have encountered a %monstername%!
if %monsterprefix% == Gruesome set monsterprefixdamage=5
if %monsterprefix% == Gruesome set monsterprefixarmor=3
if %monsterprefix% == Gruesome set monsterprefixhealth=10
if %monsterprefix% == Gross set monsterprefixdamage=3
if %monsterprefix% == Gross set monsterprefixarmor=2
if %monsterprefix% == Gross set monsterprefixhealth=5
if %monsterprefix% == Dangerous set monsterprefixdamage=10
if %monsterprefix% == Dangerous set monsterprefixarmor=5
if %monsterprefix% == Dangerous set monsterprefixhealth=20
if %monsterprefix% == Titanic set monsterprefixdamage=25
if %monsterprefix% == Titanic set monsterprefixarmor=12
if %monsterprefix% == Titanic set monsterprefixhealth=50
if %monsterprefix% == Toxic set monsterprefixdamage=15
if %monsterprefix% == Toxic set monsterprefixarmor=10
if %monsterprefix% == Toxic set monsterprefixhealth=15
if %monsterprefix% == Radioactive set monsterprefixdamage=20
if %monsterprefix% == Radioactive set monsterprefixarmor=7
if %monsterprefix% == Radioactive set monsterprefixhealth=30
if %monsterprefix% == Magical set monsterprefixdamage=7
if %monsterprefix% == Magical set monsterprefixarmor=20
if %monsterprefix% == Magical set monsterprefixhealth=14
if %monsterprefix% == Godly set monsterprefixdamage=50
if %monsterprefix% == Godly set monsterprefixarmor=100
if %monsterprefix% == Godly set monsterprefixhealth=137
if %monsterprefix% == Uber set monsterprefixdamage=100
if %monsterprefix% == Uber set monsterprefixarmor=200
if %monsterprefix% == Uber set monsterprefixhealth=500
if %monsterprefix% == Somethingy set monsterprefixdamage=%RANDOM% %% 501
if %monsterprefix% == Somethingy set monsterprefixarmor=%RANDOM% %% 501
if %monsterprefix% == Somethingy set monsterprefixhealth=%RANDOM% %% 501
if %monsterrank% == Noob set monsterrankdamage=1
if %monsterrank% == Noob set monsterrankarmor=1
if %monsterrank% == Noob set monsterrankhealth=3
if %monsterrank% == Recruit set monsterrankdamage=3
if %monsterrank% == Recruit set monsterrankarmor=3
if %monsterrank% == Recruit set monsterrankhealth=5
if %monsterrank% == Rookie set monsterrankdamage=5
if %monsterrank% == Rookie set monsterrankarmor=5
if %monsterrank% == Rookie set monsterrankhealth=10
if %monsterrank% == Lieutenant set monsterrankdamage=10
if %monsterrank% == Lieutenant set monsterrankarmor=10
if %monsterrank% == Lieutenant set monsterrankhealth=20
if %monsterrank% == General set monsterrankdamage=20
if %monsterrank% == General set monsterrankarmor=20
if %monsterrank% == General set monsterrankhealth=40
if %monsterrank% == Queen set monsterrankdamage=50
if %monsterrank% == Queen set monsterrankarmor=50
if %monsterrank% == Queen set monsterrankhealth=100
if %monsterrank% == King set monsterrankdamage=100
if %monsterrank% == King set monsterrankarmor=100
if %monsterrank% == King set monsterrankhealth=200
if %monsterrank% == Uberboss set monsterrankdamage=250
if %monsterrank% == Uberboss set monsterrankarmor=250
if %monsterrank% == Uberboss set monsterrankhealth=500
if %monsterrank% == God set monsterrankdamage=500
if %monsterrank% == God set monsterrankarmor=500
if %monsterrank% == God set monsterrankhealth=1000
set /a monsterdamage=%monsterprefixdamage%+%monsterrankdamage%
set /a monsterhealth=%monsterprefixhealth%+%monsterrankhealth%
set /a monsterarmor=%monsterprefixarmor%+%monsterrankarmor%
goto fight
:safe
cls
echo You enter another dark room with 4 corridors.
goto main
:trap
cls
echo You fall into a trap!
echo Sorry! The traps mechanism hasn't been added yet!
goto main
:die
cls
set health=0
echo You have died!
pause
cls
echo Restart the game? (yes/no)
set /p restart=
if %restart% == yes goto something
if %restart% == no exit
goto die
:fight
echo Sorry! The battling mechanism hasn't been added yet!
goto main
:inventory
cls
echo You are wearing %head% on your head.
echo "%headdesc%"
echo.
echo You are wearing %torso% on your abdomen.
echo "%torsodesc%"
echo.
echo You are wearing %legs% on your legs.
echo "%legsdesc%"
echo.
echo You are wearing %footwear% on your feet.
echo "%footweardesc%"
echo.
echo You are using a %weapon% as a weapon.
echo "%weapondesc%"
pause >nul
cls
goto main
:stats
cls
echo You have %wisdom% wisdom.
echo.
echo You have %strength% strength.
echo.
echo You have %armor% armor.
echo.
echo You do %damage% damage.
pause >nul
cls
goto main