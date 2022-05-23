@echo off
:something
cls
echo You are playing Infinity Dungeons Alpha v0.1.0
echo Are you sure you want to contiue? (yes/no)
set /p nextmove=
if %nextmove% == yes goto start
if %nextmove% == no exit
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
pause >nul
goto start
:enterdungeon
set head=Someone's Rusty Helmet
set torso=Your Grandma's Ripped Sweater
set legs=Your Best Friend's Pajamas
set footwear=Holy Socks
set weapon=Stick
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
set weapondamage=1
set /a wisdom=%headwisdom% + %torsowisdom% + %legswisdom% + %footwearwisdom% + %weaponwisdom%
set /a strength=%headstrength% + %torsostrength% + %legsstrength% + %footwearstrength% + %weaponstrength%
set /a armor=%headarmor% + %torsoarmor% + %legsarmor% + %footweararmor%
set health=100
set weapontype=melee
if %weapontype% == melee set /a damage=%weapondamage% + %strength%/5
if %weapontype% == magical set /a damage=%weapondamage% + %wisdom%/5
cls
echo You suddenly wake up with a start...
echo A drip of water falls into your face...
echo You look around you.
echo You are in a dark room. There are 4 corridors.
pause >nul
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
pause >nul
cls
goto main
:save
cls
echo Sorry! Saving hasn't been implemented yet!
goto main
:move
set /a chance=%RANDOM% %% 4 + 1
if %chance% == 1 cls
if %chance% == 1 goto randomitem
if %chance% == 2 goto randommonster
if %chance% == 3 goto safe
if %chance% == 4 goto trap
:randomitem
set /a item=%RANDOM% %% 10 + 1
if %item% == 1 set randitemprefix=Rustily
if %item% == 2 set randitemprefix=Noobishly
if %item% == 3 set randitemprefix=Dentedly
if %item% == 4 set randitemprefix=Badly
if %item% == 5 set randitemprefix=Regularly
if %item% == 6 set randitemprefix=Stainlessly
if %item% == 7 set randitemprefix=Epicly
if %item% == 8 set randitemprefix=Uberly
if %item% == 9 set randitemprefix=Godily
if %item% == 10 set randitemprefix=Somethingily
set /a item=%RANDOM% %% 5 + 1
if %item% == 1 set randitemtype=head
if %item% == 2 set randitemtype=torso
if %item% == 3 set randitemtype=legs
if %item% == 4 set randitemtype=footwear
if %item% == 5 set randitemtype=weapon
set /a item=%RANDOM% %% 10 + 1
if %item% == 1 set randitemadj=Rusty
if %item% == 2 set randitemadj=Noobish
if %item% == 3 set randitemadj=Dented
if %item% == 4 set randitemadj=Bad
if %item% == 5 set randitemadj=Regular
if %item% == 6 set randitemadj=Stainless
if %item% == 7 set randitemadj=Epic
if %item% == 8 set randitemadj=Uber
if %item% == 9 set randitemadj=Godly
if %item% == 10 set randitemadj=Somethingy
if %randitemtype% == head set randitemname=Helmet
if %randitemtype% == torso set randitemname=Chestplate
if %randitemtype% == legs set randitemname=Leggings
if %randitemtype% == footwear set randitemname=Shoes
if %randitemtype% == weapon set randitemname=Sword
if %randitemtype% == weapon goto weaponsetstats
if %randitemprefix% == Rustily set randitemprefixstrength=2
if %randitemprefix% == Rustily set randitemprefixwisdom=1
if %randitemprefix% == Rustily set randitemprefixarmor=3
if %randitemprefix% == Noobishly set randitemprefixstrength=1
if %randitemprefix% == Noobishly set randitemprefixwisdom=0
if %randitemprefix% == Noobishly set randitemprefixarmor=2
if %randitemprefix% == Dentedly set randitemprefixstrength=3
if %randitemprefix% == Dentedly set randitemprefixwisdom=2
if %randitemprefix% == Dentedly set randitemprefixarmor=3
if %randitemprefix% == Badly set randitemprefixstrength=3
if %randitemprefix% == Badly set randitemprefixwisdom=2
if %randitemprefix% == Badly set randitemprefixarmor=4
if %randitemprefix% == Regularly set randitemprefixstrength=5
if %randitemprefix% == Regularly set randitemprefixwisdom=5
if %randitemprefix% == Regularly set randitemprefixarmor=10
if %randitemprefix% == Stainlessly set randitemprefixstrength=7
if %randitemprefix% == Stainlessly set randitemprefixwisdom=6
if %randitemprefix% == Stainlessly set randitemprefixarmor=11
if %randitemprefix% == Epicly set randitemprefixstrength=10
if %randitemprefix% == Epicly set randitemprefixwisdom=10
if %randitemprefix% == Epicly set randitemprefixarmor=25
if %randitemprefix% == Uberly set randitemprefixstrength=25
if %randitemprefix% == Uberly set randitemprefixwisdom=25
if %randitemprefix% == Uberly set randitemprefixarmor=50
if %randitemprefix% == Godily set randitemprefixstrength=50
if %randitemprefix% == Godily set randitemprefixwisdom=50
if %randitemprefix% == Godily set randitemprefixarmor=75
if %randitemprefix% == Somethingily set /a randitemprefixstrength=%RANDOM% %% 50 + 1
if %randitemprefix% == Somethingily set /a randitemprefixwisdom=%RANDOM% %% 50 + 1
if %randitemprefix% == Somethingily set /a randitemprefixarmor=%RANDOM% %% 75 + 1
if %randitemadj% == Rusty set randitemadjstrength=2
if %randitemadj% == Rusty set randitemadjwisdom=1
if %randitemadj% == Rusty set randitemadjarmor=3
if %randitemadj% == Noobish set randitemadjstrength=1
if %randitemadj% == Noobish set randitemadjwisdom=0
if %randitemadj% == Noobish set randitemadjarmor=2
if %randitemadj% == Dented set randitemadjstrength=3
if %randitemadj% == Dented set randitemadjwisdom=2
if %randitemadj% == Dented set randitemadjarmor=3
if %randitemadj% == Bad set randitemadjstrength=3
if %randitemadj% == Bad set randitemadjwisdom=2
if %randitemadj% == Bad set randitemadjarmor=4
if %randitemadj% == Regular set randitemadjstrength=5
if %randitemadj% == Regular set randitemadjwisdom=5
if %randitemadj% == Regular set randitemadjarmor=10
if %randitemadj% == Stainless set randitemadjstrength=7
if %randitemadj% == Stainless set randitemadjwisdom=6
if %randitemadj% == Stainless set randitemadjarmor=11
if %randitemadj% == Epic set randitemadjstrength=10
if %randitemadj% == Epic set randitemadjwisdom=10
if %randitemadj% == Epic set randitemadjarmor=25
if %randitemadj% == Uber set randitemadjstrength=25
if %randitemadj% == Uber set randitemadjwisdom=25
if %randitemadj% == Uber set randitemadjarmor=50
if %randitemadj% == Godly set randitemadjstrength=50
if %randitemadj% == Godly set randitemadjwisdom=50
if %randitemadj% == Godly set randitemadjarmor=75
if %randitemadj% == Somethingy set /a randitemadjstrength=%RANDOM% %% 50 + 1
if %randitemadj% == Somethingy set /a randitemadjwisdom=%RANDOM% %% 50 + 1
if %randitemadj% == Somethingy set /a randitemadjarmor=%RANDOM% %% 75 + 1
set /a randitemstrength=%randitemprefixstrength%+%randitemadjstrength%
set /a randitemwisdom=%randitemprefixwisdom%+%randitemadjwisdom%
set /a randitemarmor=%randitemprefixarmor%+%randitemadjarmor%
set itemname=%randitemprefix% %randitemadj% %randitemname%
:earn
if %randitemtype% == head goto randitemhead
if %randitemtype% == torso goto randitemtorso
if %randitemtype% == legs goto randitemlegs
if %randitemtype% == footwear goto randitemfootwear
if %randitemtype% == weapon goto randitemweapon
:randitemhead
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
echo +%randitemwidsom% wisdom
echo +%randitemarmor% armor
echo.
echo Would you like to wear it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto wearitemhead
if %nextmove% == no goto nowear
if %nextmove% == inventory goto inventoryitem
:randitemtorso
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
echo +%randitemwidsom% wisdom
echo +%randitemarmor% armor
echo.
echo Would you like to wear it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto wearitemtorso
if %nextmove% == no goto nowear
if %nextmove% == inventory goto inventoryitem
:randitemlegs
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
echo +%randitemwidsom% wisdom
echo +%randitemarmor% armor
echo.
echo Would you like to wear it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto wearitemlegs
if %nextmove% == no goto nowear
if %nextmove% == inventory goto inventoryitem
:randitemfootwear
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
echo +%randitemwidsom% wisdom
echo +%randitemarmor% armor
echo.
echo Would you like to wear it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto wearitemfootwear
if %nextmove% == no goto nowear
if %nextmove% == inventory goto inventoryitem
:randitemweapon
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
echo +%randitemwidsom% wisdom
echo +%randitemarmor% armor
echo.
echo Would you like to wear it or leave it? (yes/no/seeinventory)
set /p nextmove=
if %nextmove% == yes goto wearitemweapon
if %nextmove% == no goto nowear
if %nextmove% == seeinventory goto inventoryitem
:wearitemhead
set head=%itemname%
set headstrength=%randitemstrength%
set headwisdom=%randitemwisdom%
set headarmor=%randitemarmor%
cls
echo You wore the %itemname%!
goto calcstats
:wearitemtorso
set torso=%itemname%
set torsostrength=%randitemstrength%
set toroswisdom=%randitemwisdom%
set torsoarmor=%randitemarmor%
cls
echo You wore the %itemname%!
goto calcstats
:wearitemlegs
set legs=%itemname%
set legsstrength=%randitemstrength%
set legswisdom=%randitemwisdom%
set legsarmor=%randitemarmor%
cls
echo You wore the %itemname%!
goto calcstats
:wearitemfootwear
set footwear=%itemname%
set footwearstrength=%randitemstrength%
set footwearwisdom=%randitemwisdom%
set footweararmor=%randitemarmor%
cls
echo You wore the %itemname%!
goto calcstats
:wearitemweapon
set weapon=%itemname%
set weaponstrength=%randitemstrength%
set weaponwisdom=%randitemwisdom%
set weapondamage=%randitemarmor%
cls
echo You took the %itemname%!
goto calcstats
:calcstats
set /a wisdom=%headwisdom% + %torsowisdom% + %legswisdom% + %footwearwisdom% + %weaponwisdom%
set /a strength=%headstrength% + %torsostrength% + %legsstrength% + %footwearstrength% + %weaponstrength%
set /a armor=%headarmor% + %torsoarmor% + %legsarmor% + %footweararmor%
goto main
:nowear
cls
echo You leave the %itemname%.
goto main
:inventoryitem
cls
echo You are wearing %head% on your head.
echo +%headstrength% strength
echo +%headwisdom% wisdom
echo +%headarmor% armor
echo.
echo You are wearing %torso% on your abdomen.
echo +%torsostrength% strength
echo +%torsowisdom% wisdom
echo +%torsoarmor% armor
echo.
echo You are wearing %legs% on your legs.
echo +%legsstrength% strength
echo +%legswisdom% wisdom
echo +%legsarmor% armor
echo.
echo You are wearing %footwear% on your feet.
echo +%footwearstrength% strength
echo +%footwearwisdom% wisdom
echo +%footweararmor% armor
echo.
echo You are using a %weapon% as a weapon.
echo +%weaponstrength% strength
echo +%weaponwisdom% wisdom
echo +%weapondamage% damage
pause >nul
cls
goto earn
:weaponsetstats
if %randitemprefix% == Rustily set randitemprefixstrength=2
if %randitemprefix% == Rustily set randitemprefixwisdom=1
if %randitemprefix% == Rustily set randitemprefixdamage=3
if %randitemprefix% == Noobishly set randitemprefixstrength=1
if %randitemprefix% == Noobishly set randitemprefixwisdom=0
if %randitemprefix% == Noobishly set randitemprefixdamage=2
if %randitemprefix% == Dentedly set randitemprefixstrength=3
if %randitemprefix% == Dentedly set randitemprefixwisdom=2
if %randitemprefix% == Dentedly set randitemprefixdamage=3
if %randitemprefix% == Badly set randitemprefixstrength=3
if %randitemprefix% == Badly set randitemprefixwisdom=2
if %randitemprefix% == Badly set randitemprefixdamage=4
if %randitemprefix% == Regularly set randitemprefixstrength=5
if %randitemprefix% == Regularly set randitemprefixwisdom=5
if %randitemprefix% == Regularly set randitemprefixdamage=10
if %randitemprefix% == Stainlessly set randitemprefixstrength=7
if %randitemprefix% == Stainlessly set randitemprefixwisdom=6
if %randitemprefix% == Stainlessly set randitemprefixdamage=11
if %randitemprefix% == Epicly set randitemprefixstrength=10
if %randitemprefix% == Epicly set randitemprefixwisdom=10
if %randitemprefix% == Epicly set randitemprefixdamage=25
if %randitemprefix% == Uberly set randitemprefixstrength=25
if %randitemprefix% == Uberly set randitemprefixwisdom=25
if %randitemprefix% == Uberly set randitemprefixdamage=50
if %randitemprefix% == Godily set randitemprefixstrength=50
if %randitemprefix% == Godily set randitemprefixwisdom=50
if %randitemprefix% == Godily set randitemprefixdamage=75
if %randitemprefix% == Somethingily set /a randitemprefixstrength=%RANDOM% %% 50 + 1
if %randitemprefix% == Somethingily set /a randitemprefixwisdom=%RANDOM% %% 50 + 1
if %randitemprefix% == Somethingily set /a randitemprefixdamage=%RANDOM% %% 75 + 1
if %randitemadj% == Rusty set randitemadjstrength=2
if %randitemadj% == Rusty set randitemadjwisdom=1
if %randitemadj% == Rusty set randitemadjdamage=3
if %randitemadj% == Noobish set randitemadjstrength=1
if %randitemadj% == Noobish set randitemadjwisdom=0
if %randitemadj% == Noobish set randitemadjdamage=2
if %randitemadj% == Dented set randitemadjstrength=3
if %randitemadj% == Dented set randitemadjwisdom=2
if %randitemadj% == Dented set randitemadjdamage=3
if %randitemadj% == Bad set randitemadjstrength=3
if %randitemadj% == Bad set randitemadjwisdom=2
if %randitemadj% == Bad set randitemadjdamage=4
if %randitemadj% == Regular set randitemadjstrength=5
if %randitemadj% == Regular set randitemadjwisdom=5
if %randitemadj% == Regular set randitemadjdamage=10
if %randitemadj% == Stainless set randitemadjstrength=7
if %randitemadj% == Stainless set randitemadjwisdom=6
if %randitemadj% == Stainless set randitemadjdamage=11
if %randitemadj% == Epic set randitemadjstrength=10
if %randitemadj% == Epic set randitemadjwisdom=10
if %randitemadj% == Epic set randitemadjdamage=25
if %randitemadj% == Uber set randitemadjstrength=25
if %randitemadj% == Uber set randitemadjwisdom=25
if %randitemadj% == Uber set randitemadjdamage=50
if %randitemadj% == Godly set randitemadjstrength=50
if %randitemadj% == Godly set randitemadjwisdom=50
if %randitemadj% == Godly set randitemadjdamage=75
if %randitemadj% == Somethingy set /a randitemadjstrength=%RANDOM% %% 50 + 1
if %randitemadj% == Somethingy set /a randitemadjwisdom=%RANDOM% %% 50 + 1
if %randitemadj% == Somethingy set /a randitemadjdamage=%RANDOM% %% 75 + 1
set /a randitemstrength=%randitemprefixstrength%+%randitemadjstrength%
set /a randitemwisdom=%randitemprefixwisdom%+%randitemadjwisdom%
set /a randitemdamage=%randitemprefixdamage%+%randitemadjdamage%
set itemname=%randitemprefix% %randitemadj% %randitemname%
goto earn
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
echo What is your next move?
echo Type help to see your available commands.
if %monsterhealth% == 0 goto winbattle
if %monsterhealth% LSS 0 goto winbattle
if %health% == 0 goto die
if %health% LSS 0 goto die
set /p nextmove=
if %nextmove% == help goto helpbattle
if %nextmove% == battle goto hit
if %nextmove% == enemystats goto enemystats
if %nextmove% == inventory goto inventoryfight
if %nextmove% == quit exit
if %nextmove% == suicide goto die
if %nextmove% == save goto save
if %nextmove% == run goto run
cls
echo That is an invalid command!
goto fight
:run
cls
echo You ran from the %monstername%!
set health=100
goto main
:winbattle
set health=100
cls
echo Congratulations! You have defeated the %monstername%!
echo The %monstername% dropped an item!
goto randomitem
:enemystats
cls
echo The %monstername% has %monsterhealth% health.
echo.
echo The %monstername% has %monsterarmor% armor.
echo.
echo The %monstername% does %monsterdamage% damage.
pause >nul
cls
goto fight
:hit
cls
set /a damageminusmonsterarmor=%damage%-%monsterarmor%
if %damageminusmonsterarmor% LSS 0 set damageminusmonsterarmor=0
echo You hit the %monstername% for %damageminusmonsterarmor% damage!
set /a monsterhealth=%monsterhealth%-%damageminusmonsterarmor%
pause >nul
set /a monsterdamageminusarmor=%monsterdamage%-%armor%
if %monsterdamageminusarmor% LSS 0 set monsterdamageminusarmor=0
echo The %monstername% hits you for %monsterdamageminusarmor% damage!
set /a health=%health%-%monsterdamageminusarmor%
pause >nul
goto fight
:inventory
cls
echo You are wearing %head% on your head.
echo +%headstrength% strength
echo +%headwisdom% wisdom
echo +%headarmor% armor
echo.
echo You are wearing %torso% on your abdomen.
echo +%torsostrength% strength
echo +%torsowisdom% wisdom
echo +%torsoarmor% armor
echo.
echo You are wearing %legs% on your legs.
echo +%legsstrength% strength
echo +%legswisdom% wisdom
echo +%legsarmor% armor
echo.
echo You are wearing %footwear% on your feet.
echo +%footwearstrength% strength
echo +%footwearwisdom% wisdom
echo +%footweararmor% armor
echo.
echo You are using a %weapon% as a weapon.
echo +%weaponstrength% strength
echo +%weaponwisdom% wisdom
echo +%weapondamage% damage
pause >nul
cls
goto main
:inventoryfight
cls
echo You are wearing %head% on your head.
echo +%headstrength% strength
echo +%headwisdom% wisdom
echo +%headarmor% armor
echo.
echo You are wearing %torso% on your abdomen.
echo +%torsostrength% strength
echo +%torsowisdom% wisdom
echo +%torsoarmor% armor
echo.
echo You are wearing %legs% on your legs.
echo +%legsstrength% strength
echo +%legswisdom% wisdom
echo +%legsarmor% armor
echo.
echo You are wearing %footwear% on your feet.
echo +%footwearstrength% strength
echo +%footwearwisdom% wisdom
echo +%footweararmor% armor
echo.
echo You are using a %weapon% as a weapon.
echo +%weaponstrength% strength
echo +%weaponwisdom% wisdom
echo +%weapondamage% damage
pause >nul
cls
goto fight
:helpbattle
cls
echo help : Shows a list of available commands
echo.
echo battle : Hit the enemy once
echo.
echo enemystats : Shows the enemy's current stats
echo.
echo inventory : Shows you your inventory
echo.
echo quit : Exits the game
echo.
echo suicide : Kill yourself
echo.
echo save : Saves the game
echo.
echo run : Be a coward
pause >nul
cls
goto fight