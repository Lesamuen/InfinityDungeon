@echo off
color 02
:something
cls
echo You are playing Infinity Dungeons Release v0.2.8
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
set head=Lvl 0 Nothingily Nothingy Hat
set torso=Lvl 0 Nothingily Nothingy Sweater
set legs=Lvl 0 Nothingily Nothingy Pajamas
set footwear=Lvl 0 Nothingily Nothingy Socks
set weapon=Lvl 0 Nothingily Nothingy Stick
set companion=Lvl 0 Useless Ant
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
set companionstrength=0
set companionwisdom=0
set companionarmor=0
set companiondamage=0
set /a wisdom=%headwisdom% + %torsowisdom% + %legswisdom% + %footwearwisdom% + %weaponwisdom% + %companionwisdom%
set /a strength=%headstrength% + %torsostrength% + %legsstrength% + %footwearstrength% + %weaponstrength% + %companionstrength%
set /a armor=%headarmor% + %torsoarmor% + %legsarmor% + %footweararmor% + %companionarmor%
set health=100
set weapontype=melee
set level=1
set currxp=0
set /a xptolevel=%level% * 7
if %weapontype% == melee set /a damage=%weapondamage% + %companiondamage% + (%strength%/5)
if %weapontype% == magical set /a damage=%weapondamage% + %companiondamage% + (%wisdom%/5)
set healthpotions=0
set hunger=100
set food=0
cls
echo You suddenly wake up with a start...
echo A drip of water falls into your face...
echo You look around you.
echo You are in a dark room. There are 4 corridors.
pause >nul
cls
goto main
:main
if %hunger% GTR 0 set /a hunger=%hunger%-2
if %hunger% == 0 set /a health=%health%-5&echo You are starving!
if %health% == 0 goto die
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
if %nextmove% == load goto load1
if %nextmove% == usepotion goto usehealth
if %nextmove% == eat goto eat
cls
echo That is an invalid command!
goto main
:eat
if %food% GTR 0 cls&echo You eat some food.&echo Your stomach feels much better now.&set /a food=%food%-1&set hunger=100&goto main
if %food% == 0 cls&echo You don't have any food!&goto main
:usehealth
if healthpotions == 0 cls&echo You don't have one!&goto main
if healthpotions GTR 0 cls&echo You used a health potion!&set health=100&set /a healthpotions=%healthpotions%-1&goto main
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
echo load : Loads the session you saved (If you did save)
echo.
echo inventory : Shows you your inventory
echo.
echo quit : Exits the game
echo.
echo usepotion : Use one of your health potions
pause >nul
cls
goto main
:save
cls
echo %head% > IDSaveFile.txt
echo %torso% >> IDSaveFile.txt
echo %legs% >> IDSaveFile.txt
echo %footwear% >> IDSaveFile.txt
echo %weapon% >> IDSaveFile.txt
echo %headstrength% >> IDSaveFile.txt
echo %headwisdom% >> IDSaveFile.txt
echo %headarmor% >> IDSaveFile.txt
echo %torsostrength% >> IDSaveFile.txt
echo %torsowisdom% >> IDSaveFile.txt
echo %torsoarmor% >> IDSaveFile.txt
echo %legsstrength% >> IDSaveFile.txt
echo %legswisdom% >> IDSaveFile.txt
echo %legsarmor% >> IDSaveFile.txt
echo %footwearstrength% >> IDSaveFile.txt
echo %footwearwisdom% >> IDSaveFile.txt
echo %footweararmor% >> IDSaveFile.txt
echo %weaponstrength% >> IDSaveFile.txt
echo %weaponwisdom% >> IDSaveFile.txt
echo %weapondamage% >> IDSaveFile.txt
echo %wisdom% >> IDSaveFile.txt
echo %strength% >> IDSaveFile.txt
echo %armor% >> IDSaveFile.txt
echo %health% >> IDSaveFile.txt
echo %weapontype% >> IDSaveFile.txt
echo %level% >> IDSaveFile.txt
echo %currxp% >> IDSaveFile.txt
echo %xptolevel% >> IDSaveFile.txt
echo %damage% >> IDSaveFile.txt
echo %companion% >> IDSaveFile.txt
echo %companionstrength% >> IDSaveFile.txt
echo %companionwisdom% >> IDSaveFile.txt
echo %companionarmor% >> IDSaveFile.txt
echo %companiondamage% >> IDSaveFile.txt
echo %healthpotions% >> IDSaveFile.txt
echo %food% >> IDSaveFile.txt
echo %hunger% >> IDSaveFile.txt
echo Success!
goto main
:load1
for /f "usebackq delims=." %%a in ("IDSaveFile.txt") do (set head=%%a&goto load2)
:load2
for /f "usebackq skip=1 delims=." %%a in ("IDSaveFile.txt") do (set torso=%%a&goto load3)
:load3
for /f "usebackq skip=2 delims=." %%a in ("IDSaveFile.txt") do (set legs=%%a&goto load4)
:load4
for /f "usebackq skip=3 delims=." %%a in ("IDSaveFile.txt") do (set footwear=%%a&goto load5)
:load5
for /f "usebackq skip=4 delims=." %%a in ("IDSaveFile.txt") do (set weapon=%%a&goto load6)
:load6
for /f "usebackq skip=5 delims=." %%a in ("IDSaveFile.txt") do (set headstrength=%%a&goto load7)
:load7
for /f "usebackq skip=6 delims=." %%a in ("IDSaveFile.txt") do (set headwisdom=%%a&goto load8)
:load8
for /f "usebackq skip=7 delims=." %%a in ("IDSaveFile.txt") do (set headarmor=%%a&goto load9)
:load9
for /f "usebackq skip=8 delims=." %%a in ("IDSaveFile.txt") do (set torsostrength=%%a&goto load10)
:load10
for /f "usebackq skip=9 delims=." %%a in ("IDSaveFile.txt") do (set torsowisdom=%%a&goto load11)
:load11
for /f "usebackq skip=10 delims=." %%a in ("IDSaveFile.txt") do (set torsoarmor=%%a&goto load12)
:load12
for /f "usebackq skip=11 delims=." %%a in ("IDSaveFile.txt") do (set legsstrength=%%a&goto load13)
:load13
for /f "usebackq skip=12 delims=." %%a in ("IDSaveFile.txt") do (set legswisdom=%%a&goto load14)
:load14
for /f "usebackq skip=13 delims=." %%a in ("IDSaveFile.txt") do (set legsarmor=%%a&goto load15)
:load15
for /f "usebackq skip=14 delims=." %%a in ("IDSaveFile.txt") do (set footwearstrength=%%a&goto load16)
:load16
for /f "usebackq skip=15 delims=." %%a in ("IDSaveFile.txt") do (set footwearwisdom=%%a&goto load17)
:load17
for /f "usebackq skip=16 delims=." %%a in ("IDSaveFile.txt") do (set footweararmor=%%a&goto load18)
:load18
for /f "usebackq skip=17 delims=." %%a in ("IDSaveFile.txt") do (set weaponstrength=%%a&goto load19)
:load19
for /f "usebackq skip=18 delims=." %%a in ("IDSaveFile.txt") do (set weaponwisdom=%%a&goto load20)
:load20
for /f "usebackq skip=19 delims=." %%a in ("IDSaveFile.txt") do (set weapondamage=%%a&goto load21)
:load21
for /f "usebackq skip=20 delims=." %%a in ("IDSaveFile.txt") do (set wisdom=%%a&goto load22)
:load22
for /f "usebackq skip=21 delims=." %%a in ("IDSaveFile.txt") do (set strength=%%a&goto load23)
:load23
for /f "usebackq skip=22 delims=." %%a in ("IDSaveFile.txt") do (set armor=%%a&goto load24)
:load24
for /f "usebackq skip=23 delims=." %%a in ("IDSaveFile.txt") do (set health=%%a&goto load25)
:load25
for /f "usebackq skip=24 delims=." %%a in ("IDSaveFile.txt") do (set weapontype=%%a&goto load26)
:load26
for /f "usebackq skip=25 delims=." %%a in ("IDSaveFile.txt") do (set level=%%a&goto load27)
:load27
for /f "usebackq skip=26 delims=." %%a in ("IDSaveFile.txt") do (set currxp=%%a&goto load28)
:load28
for /f "usebackq skip=27 delims=." %%a in ("IDSaveFile.txt") do (set xptolevel=%%a&goto load29)
:load29
for /f "usebackq skip=28 delims=." %%a in ("IDSaveFile.txt") do (set damage=%%a&goto load30)
:load30
for /f "usebackq skip=29 delims=." %%a in ("IDSaveFile.txt") do (set companion=%%a&goto load31)
:load31
for /f "usebackq skip=30 delims=." %%a in ("IDSaveFile.txt") do (set companionstrength=%%a&goto load32)
:load32
for /f "usebackq skip=31 delims=." %%a in ("IDSaveFile.txt") do (set companionwisdom=%%a&goto load33)
:load33
for /f "usebackq skip=32 delims=." %%a in ("IDSaveFile.txt") do (set companionarmor=%%a&goto load34)
:load34
for /f "usebackq skip=33 delims=." %%a in ("IDSaveFile.txt") do (set companiondamage=%%a&goto load35)
:load35
for /f "usebackq skip=34 delims=." %%a in ("IDSaveFile.txt") do (set healthpotions=%%a&goto load36)
:load36
for /f "usebackq skip=35 delims=." %%a in ("IDSaveFile.txt") do (set food=%%a&goto load37)
:load37
for /f "usebackq skip=36 delims=." %%a in ("IDSaveFile.txt") do (set hunger=%%a&cls&echo Success!&goto main)
cls
echo No save file found!/Outdated save file!
goto main
:move
set /a chance=%RANDOM% %% 4 + 1
if %chance% == 1 cls
if %chance% == 1 goto randomitem
if %chance% == 2 goto randommonster
if %chance% == 3 goto safe
if %chance% == 4 goto randomcompanion
:randomcompanion
cls
set /a complvl=%RANDOM% %% %level% + 1
set /a comprand=%RANDOM% %% 10 + 1
if %comprand% == 1 set comptype=Bacteria
if %comprand% == 2 set comptype=Ant
if %comprand% == 3 set comptype=Fly
if %comprand% == 4 set comptype=Bee
if %comprand% == 5 set comptype=Turtle
if %comprand% == 6 set comptype=Cat
if %comprand% == 7 set comptype=Dog
if %comprand% == 8 set comptype=Alligator
if %comprand% == 9 set comptype=Guy
if %comprand% == 10 set comptype=Alien
set /a comprand=%RANDOM% %% 10+1
if %comprand% == 1 set compprefix=Idioticly
if %comprand% == 2 set compprefix=Noobishly
if %comprand% == 3 set compprefix=Stupidly
if %comprand% == 4 set compprefix=Weirdly
if %comprand% == 5 set compprefix=Cooly
if %comprand% == 6 set compprefix=Strongly
if %comprand% == 7 set compprefix=Awesomely
if %comprand% == 8 set compprefix=Epicly
if %comprand% == 9 set compprefix=Uberly
if %comprand% == 10 set compprefix=Godily
set /a comprand=%RANDOM% %% 10+1
if %comprand% == 1 set compadj=Idiotic
if %comprand% == 2 set compadj=Noobish
if %comprand% == 3 set compadj=Stupid
if %comprand% == 4 set compadj=Weird
if %comprand% == 5 set compadj=Cool
if %comprand% == 6 set compadj=Strong
if %comprand% == 7 set compadj=Awesome
if %comprand% == 8 set compadj=Epic
if %comprand% == 9 set compadj=Uber
if %comprand% == 10 set compadj=Godly
set compname=Lvl %complvl% %compprefix% %compadj% %comptype%
if %compprefix% == Idioticly set compprefixstrength=1&set compprefixwisdom=1&set compprefixarmor=1&set compprefixdamage=1
if %compprefix% == Noobishly set compprefixstrength=3&set compprefixwisdom=3&set compprefixarmor=5&set compprefixdamage=5
if %compprefix% == Stupidly set compprefixstrength=5&set compprefixwisdom=5&set compprefixarmor=10&set compprefixdamage=10
if %compprefix% == Weirdly set compprefixstrength=7&set compprefixwisdom=7&set compprefixarmor=15&set compprefixdamage=15
if %compprefix% == Cooly set compprefixstrength=10&set compprefixwisdom=10&set compprefixarmor=25&set compprefixdamage=25
if %compprefix% == Strongly set compprefixstrength=10&set compprefixwisdom=10&set compprefixarmor=40&set compprefixdamage=40
if %compprefix% == Awesomely set compprefixstrength=20&set compprefixwisdom=20&set compprefixarmor=40&set compprefixdamage=40
if %compprefix% == Epicly set compprefixstrength=25&set compprefixwisdom=25&set compprefixarmor=50&set compprefixdamage=50
if %compprefix% == Uberly set compprefixstrength=30&set compprefixwisdom=30&set compprefixarmor=75&set compprefixdamage=75
if %compprefix% == Godily set compprefixstrength=50&set compprefixwisdom=50&set compprefixarmor=100&set compprefixdamage=100
if %compadj% == Idiotic set compadjstrength=1&set compadjwisdom=1&set compadjarmor=1&set compadjdamage=1
if %compadj% == Noobish set compadjstrength=3&set compadjwisdom=3&set compadjarmor=5&set compadjdamage=5
if %compadj% == Stupid set compadjstrength=5&set compadjwisdom=5&set compadjarmor=10&set compadjdamage=10
if %compadj% == Weird set compadjstrength=7&set compadjwisdom=7&set compadjarmor=15&set compadjdamage=15
if %compadj% == Cool set compadjstrength=10&set compadjwisdom=10&set compadjarmor=25&set compadjdamage=25
if %compadj% == Strong set compadjstrength=10&set compadjwisdom=10&set compadjarmor=40&set compadjdamage=40
if %compadj% == Awesome set compadjstrength=20&set compadjwisdom=20&set compadjarmor=40&set compadjdamage=40
if %compadj% == Epic set compadjstrength=25&set compadjwisdom=25&set compadjarmor=50&set compadjdamage=50
if %compadj% == Uber set compadjstrength=30&set compadjwisdom=30&set compadjarmor=75&set compadjdamage=75
if %compadj% == Godly set compadjstrength=50&set compadjwisdom=50&set compadjarmor=100&set compadjdamage=100
set /a complvlstrength=%complvl% * (%RANDOM% %% 15 + 1)
set /a complvlwisdom=%complvl% * (%RANDOM% %% 15 + 1)
set /a complvlarmor=%complvl% * (%RANDOM% %% 10 + 1)
set /a complvldamage=%complvl% * (%RANDOM% %% 10 + 1)
set /a compstrength=%compprefixstrength%+%compadjstrength%+%complvlstrength%
set /a compwisdom=%compprefixwisdom%+%compadjwisdom%+%complvlwisdom%
set /a comparmor=%compprefixarmor%+%compadjarmor%+%complvlarmor%
set /a compdamage=%compprefixdamage%+%compadjdamage%+%complvldamage%
:takecomp
echo You find a %compname% laying on the floor, starving to death.
echo +%compstrength% strength
echo +%compwisdom% wisdom
echo +%comparmor% armor
echo +%compdamage% damage
echo Do you take it, or do you leave it to die? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes set companion=%compname%&set companionstrength=%compstrength%&set companionwisdom=%compwisdom%&set companionarmor=%comparmor%&set companiondamage=%compdamage%&cls&echo You took the %compname%!&goto calcstats
if %nextmove% == no cls&echo You are so evil.&goto main
if %nextmove% == inventory goto inventorycomp
cls
goto takecomp
:inventorycomp
cls
echo You are wearing a(n) %head% on your head.
echo +%headstrength% strength
echo +%headwisdom% wisdom
echo +%headarmor% armor
echo.
echo You are wearing a(n) %torso% on your abdomen.
echo +%torsostrength% strength
echo +%torsowisdom% wisdom
echo +%torsoarmor% armor
echo.
echo You are wearing a(n) %legs% on your legs.
echo +%legsstrength% strength
echo +%legswisdom% wisdom
echo +%legsarmor% armor
echo.
echo You are wearing a(n) %footwear% on your feet.
echo +%footwearstrength% strength
echo +%footwearwisdom% wisdom
echo +%footweararmor% armor
echo.
echo You are using a(n) %weapon% as a weapon.
echo +%weaponstrength% strength
echo +%weaponwisdom% wisdom
echo +%weapondamage% damage
echo.
echo Your companion is a %companion%
echo +%companionstrength% strength
echo +%companionwisdom% wisdom
echo +%companionarmor% armor
echo +%companiondamage% damage
echo.
echo You are level %level%.
echo You have %currxp%/%xptolevel% xp.
echo You inflict %damage% damage.
echo Your weapon type is %weapontype%.
echo You have %armor% armor.
echo You have %health% health left.
echo You have %healthpotions% health potions.
echo You have %food% food.
echo You have %hunger% hunger left.
pause >nul
cls
goto takecomp
:randomitem
set /a itemlvl=%RANDOM% %% %level% + 1
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
set /a item=%RANDOM% %% 8 + 1
if %item% == 1 set randitemtype=head
if %item% == 2 set randitemtype=torso
if %item% == 3 set randitemtype=legs
if %item% == 4 set randitemtype=footwear
if %item% == 5 set randitemtype=weaponmelee
if %item% == 6 set randitemtype=weaponmagical
if %item% == 7 set randitemtype=healthpotion
if %item% == 8 set randitemtype=food
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
if %randitemtype% == weaponmelee set randitemname=Sword
if %randitemtype% == weaponmagical set randitemname=Staff
if %randitemtype% == weaponmelee goto weaponsetstats
if %randitemtype% == weaponmagical goto weaponsetstats
if %randitemtype% == healthpotion goto randitempotion
if %randitemtype% == food goto randitemfood
set /a lvlstrength=%itemlvl% * (%RANDOM% %% 15)
set /a lvlwisdom=%itemlvl% * (%RANDOM% %% 15)
set /a lvlarmor=%itemlvl% * (%RANDOM% %% 10)
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
if %randitemprefix% == Somethingily set /a randitemprefixstrength=%RANDOM% %% 250 + 1
if %randitemprefix% == Somethingily set /a randitemprefixwisdom=%RANDOM% %% 250 + 1
if %randitemprefix% == Somethingily set /a randitemprefixarmor=%RANDOM% %% 250 + 1
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
if %randitemadj% == Somethingy set /a randitemadjstrength=%RANDOM% %% 250 + 1
if %randitemadj% == Somethingy set /a randitemadjwisdom=%RANDOM% %% 250 + 1
if %randitemadj% == Somethingy set /a randitemadjarmor=%RANDOM% %% 250 + 1
set /a randitemstrength=%randitemprefixstrength%+%randitemadjstrength%+%lvlstrength%
set /a randitemwisdom=%randitemprefixwisdom%+%randitemadjwisdom%+%lvlwisdom%
set /a randitemarmor=%randitemprefixarmor%+%randitemadjarmor%+%lvlarmor%
set itemname=Lvl %itemlvl% %randitemprefix% %randitemadj% %randitemname%
:earn
if %randitemtype% == head goto randitemhead
if %randitemtype% == torso goto randitemtorso
if %randitemtype% == legs goto randitemlegs
if %randitemtype% == footwear goto randitemfootwear
if %randitemtype% == weaponmelee goto randitemweapon
if %randitemtype% == weaponmagical goto randitemweapon
:randitemhead
cls
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
::500th line! :D
echo +%randitemwisdom% wisdom
echo +%randitemarmor% armor
echo.
echo Would you like to wear it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto wearitemhead
if %nextmove% == no goto nowear
if %nextmove% == inventory goto inventoryitem
cls
goto randitemhead
:randitemtorso
cls
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
echo +%randitemwisdom% wisdom
echo +%randitemarmor% armor
echo.
echo Would you like to wear it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto wearitemtorso
if %nextmove% == no goto nowear
if %nextmove% == inventory goto inventoryitem
cls
goto randitemtorso
:randitemlegs
cls
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
echo +%randitemwisdom% wisdom
echo +%randitemarmor% armor
echo.
echo Would you like to wear it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto wearitemlegs
if %nextmove% == no goto nowear
if %nextmove% == inventory goto inventoryitem
cls
goto randitemlegs
:randitemfootwear
cls
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
echo +%randitemwisdom% wisdom
echo +%randitemarmor% armor
echo.
echo Would you like to wear it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto wearitemfootwear
if %nextmove% == no goto nowear
if %nextmove% == inventory goto inventoryitem
cls
goto randitemfootwear
:randitemweapon
cls
echo You have found a(n) %itemname%!
echo +%randitemstrength% strength
echo +%randitemwisdom% wisdom
echo +%randitemdamage% damage
echo.
echo Would you like to take it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto wearitemweapon
if %nextmove% == no goto nowear
if %nextmove% == inventory goto inventoryitem
cls
goto randitemweapon
:randitempotion
cls
echo You have found a health potion!
echo.
echo Would you like to take it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto takepotion
if %nextmove% == no goto nopotion
if %nextmove% == inventory goto inventoryitem
cls
goto randitempotion
:randitemfood
cls
echo You have found some food!
echo.
echo Would you like to take it or leave it? (yes/no/inventory)
set /p nextmove=
if %nextmove% == yes goto takefood
if %nextmove% == no goto nofood
if %nextmove% == inventory goto inventoryitem
cls
goto randitempotion
:takepotion
set /a healthpotions=%healthpotions%+1
cls
echo You took the health potion!
goto calcstats
:takefood
set /a food=%food%+1
cls
echo You took the food!
goto calcstats
:nofood
cls
echo You leave the food.
goto main
:nopotion
cls
echo You leave the potion.
goto main
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
set torsowisdom=%randitemwisdom%
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
set weapondamage=%randitemdamage%
if %randitemtype% == weaponmelee set weapontype=melee
if %randitemtype% == weaponmagical set weapontype=magical
cls
echo You took the %itemname%!
goto calcstats
:calcstats
set /a wisdom=%headwisdom% + %torsowisdom% + %legswisdom% + %footwearwisdom% + %weaponwisdom% + %companionwisdom%
set /a strength=%headstrength% + %torsostrength% + %legsstrength% + %footwearstrength% + %weaponstrength% + %companionstrength%
set /a armor=%headarmor% + %torsoarmor% + %legsarmor% + %footweararmor% + %companionarmor%
if %weapontype% == melee set /a damage=%weapondamage% + (%strength%/5) + %companiondamage%
if %weapontype% == magical set /a damage=%weapondamage% + (%wisdom%/5) + %companiondamage%
goto main
:nowear
cls
echo You leave the %itemname%.
goto main
:inventoryitem
cls
echo You are wearing a(n) %head% on your head.
echo +%headstrength% strength
echo +%headwisdom% wisdom
echo +%headarmor% armor
echo.
echo You are wearing a(n) %torso% on your abdomen.
echo +%torsostrength% strength
echo +%torsowisdom% wisdom
echo +%torsoarmor% armor
echo.
echo You are wearing a(n) %legs% on your legs.
echo +%legsstrength% strength
echo +%legswisdom% wisdom
echo +%legsarmor% armor
echo.
echo You are wearing a(n) %footwear% on your feet.
echo +%footwearstrength% strength
echo +%footwearwisdom% wisdom
echo +%footweararmor% armor
echo.
echo You are using a(n) %weapon% as a weapon.
echo +%weaponstrength% strength
echo +%weaponwisdom% wisdom
echo +%weapondamage% damage
echo.
echo Your companion is a %companion%
echo +%companionstrength% strength
echo +%companionwisdom% wisdom
echo +%companionarmor% armor
echo +%companiondamage% damage
echo.
echo You are level %level%.
echo You have %currxp%/%xptolevel% xp.
echo You inflict %damage% damage.
echo Your weapon type is %weapontype%.
echo You have %armor% armor.
echo You have %health% health left.
echo You have %healthpotions% health potions.
echo You have %food% food.
echo You have %hunger% hunger left.
pause >nul
cls
goto earn
:weaponsetstats
set /a lvlstrength=%itemlvl% * (%RANDOM% %% 15)
set /a lvlwisdom=%itemlvl% * (%RANDOM% %% 15)
set /a lvldamage=%itemlvl% * (%RANDOM% %% 10)
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
if %randitemprefix% == Somethingily set /a randitemprefixstrength=%RANDOM% %% 250 + 1
if %randitemprefix% == Somethingily set /a randitemprefixwisdom=%RANDOM% %% 250 + 1
if %randitemprefix% == Somethingily set /a randitemprefixdamage=%RANDOM% %% 250 + 1
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
if %randitemadj% == Somethingy set /a randitemadjstrength=%RANDOM% %% 250 + 1
if %randitemadj% == Somethingy set /a randitemadjwisdom=%RANDOM% %% 250 + 1
if %randitemadj% == Somethingy set /a randitemadjdamage=%RANDOM% %% 250 + 1
set /a randitemstrength=%randitemprefixstrength%+%randitemadjstrength%+%lvlstrength%
set /a randitemwisdom=%randitemprefixwisdom%+%randitemadjwisdom%+%lvlwisdom%
set /a randitemdamage=%randitemprefixdamage%+%randitemadjdamage%+%lvldamage%
set itemname=Lvl %itemlvl% %randitemprefix% %randitemadj% %randitemname%
goto earn
:randommonster
cls
set monsterhealth=0
set monsterdamage=0
set monsterarmor=0
set /a monsterlvl=%RANDOM% %% %level% + 1
set /a monsterxpdrop=%RANDOM% %% (%monsterlvl% * 10) + 1
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
set monstername=Lvl %monsterlvl% %monsterprefix% %monstertype% %monsterrank%
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
if %monsterprefix% == Somethingy set monsterprefixdamage=%RANDOM% %% 1001
if %monsterprefix% == Somethingy set monsterprefixarmor=%RANDOM% %% 1001
if %monsterprefix% == Somethingy set monsterprefixhealth=%RANDOM% %% 1001
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
set /a monsterlvldamage=%monsterlvl% * (%RANDOM% %% 75 + 1)
set /a monsterlvlarmor=%monsterlvl% * (%RANDOM% %% 25 + 1)
set /a monsterlvlhealth=%monsterlvl% * (%RANDOM% %% 20 + 1)
set /a monsterdamage=%monsterprefixdamage%+%monsterrankdamage%+%monsterlvldamage%
set /a monsterhealth=%monsterprefixhealth%+%monsterrankhealth%+%monsterlvlhealth%
set /a monsterarmor=%monsterprefixarmor%+%monsterrankarmor%+%monsterlvlarmor%
goto fight
:safe
cls
echo You enter another dark room with 4 corridors.
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
if %nextmove% == run goto run
if %nextmove% == usepotion goto usehealthfight
cls
echo That is an invalid command!
goto fight
:usehealthfight
if healthpotions == 0 cls&echo You don't have one!&goto fight
if healthpotions GTR 0 cls&echo You used a health potion!&set health=100&set /a healthpotions=%healthpotions%-1&goto fight
:run
cls
echo You ran from the %monstername%!
goto main
:winbattle
cls
echo Congratulations! You have defeated the %monstername%!
echo The %monstername% dropped a bottle of green liquid!
pause >nul
echo The label on the bottle says "%monsterxpdrop% xp"!
pause >nul
echo You drink it.
set /a currxp=%currxp% + %monsterxpdrop%
pause >nul
if %currxp% == %xptolevel% echo You leveled up!
if %currxp% == %xptolevel% set /a level=%level% + 1
if %currxp% LSS %xptolevel% echo You get a strange feeling in your stomach, like as if you are 1 step closer to getting stronger.
if %currxp% == %xptolevel% set currxp=0
if %currxp% GTR %xptolevel% echo You leveled up!
if %currxp% GTR %xptolevel% set /a level=%level% + 1
if %currxp% GTR %xptolevel% set currxp=0
set /a xptolevel=%level% * 7
pause >nul
cls
echo The %monstername% also dropped an item!
pause >nul
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
echo You are wearing a(n) %head% on your head.
echo +%headstrength% strength
echo +%headwisdom% wisdom
echo +%headarmor% armor
echo.
echo You are wearing a(n) %torso% on your abdomen.
echo +%torsostrength% strength
echo +%torsowisdom% wisdom
echo +%torsoarmor% armor
echo.
echo You are wearing a(n) %legs% on your legs.
echo +%legsstrength% strength
echo +%legswisdom% wisdom
echo +%legsarmor% armor
echo.
echo You are wearing a(n) %footwear% on your feet.
echo +%footwearstrength% strength
echo +%footwearwisdom% wisdom
echo +%footweararmor% armor
echo.
echo You are using a a(n) %weapon% as a weapon.
echo +%weaponstrength% strength
echo +%weaponwisdom% wisdom
echo +%weapondamage% damage
echo.
echo Your companion is a %companion%
echo +%companionstrength% strength
echo +%companionwisdom% wisdom
echo +%companionarmor% armor
echo +%companiondamage% damage
echo.
::1000th line!!!!! Yayz!!!!!
echo You are level %level%.
echo You have %currxp%/%xptolevel% xp.
echo You inflict %damage% damage.
echo Your weapon type is %weapontype%.
echo You have %armor% armor.
echo You have %health% health left.
echo You have %healthpotions% health potions.
echo You have %food% food.
echo You have %hunger% hunger left.
pause >nul
cls
goto main
:inventoryfight
cls
echo You are wearing a(n) %head% on your head.
echo +%headstrength% strength
echo +%headwisdom% wisdom
echo +%headarmor% armor
echo.
echo You are wearing a(n) %torso% on your abdomen.
echo +%torsostrength% strength
echo +%torsowisdom% wisdom
echo +%torsoarmor% armor
echo.
echo You are wearing a(n) %legs% on your legs.
echo +%legsstrength% strength
echo +%legswisdom% wisdom
echo +%legsarmor% armor
echo.
echo You are wearing a(n) %footwear% on your feet.
echo +%footwearstrength% strength
echo +%footwearwisdom% wisdom
echo +%footweararmor% armor
echo.
echo You are using a(n) %weapon% as a weapon.
echo +%weaponstrength% strength
echo +%weaponwisdom% wisdom
echo +%weapondamage% damage
echo.
echo Your companion is a %companion%
echo +%companionstrength% strength
echo +%companionwisdom% wisdom
echo +%companionarmor% armor
echo +%companiondamage% damage
echo.
echo You are level %level%.
echo You have %currxp%/%xptolevel% xp.
echo You inflict %damage% damage.
echo Your weapon type is %weapontype%.
echo You have %armor% armor.
echo You have %health% health left.
echo You have %healthpotions% health potions.
echo You have %food% food.
echo You have %hunger% hunger left.
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
echo run : Be a coward
echo.
echo usepotion : Use a health potion
pause >nul
cls
goto fight