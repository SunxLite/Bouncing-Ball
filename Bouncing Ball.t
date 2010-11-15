/*=== Bouncing Ball Program ===
 ======== by Sunnyok ========*/

%======================================================================================================
%Sound
%======================================================================================================
%Music
var musicFile : string
var musicFinished : boolean

process bgMusic
    musicFinished := false
    loop
	exit when musicFinished
	Music.PlayFile ("Sound/Music/" + musicFile + ".mp3")
    end loop
end bgMusic

%fork bgMusic

% Stop the music
/*musicFinished := true
 Music.PlayFileStop*/


%Sound
var soundFile : string
var soundFinished : boolean

process sounds
    soundFinished := false
    loop
	exit when soundFinished
	Music.PlayFile ("Sound/Sound/" + soundFile + ".mp3")
    end loop
end sounds

%fork sounds

% Stop the sound
/*soundFinished := true
 Music.PlayFileStop*/

musicFile := "dancing drums"
fork bgMusic
%======================================================================================================


%DO NOT LOOK! ITS TO COMPLICATED, SKIP THESE CODES IF YOU CAN
%Forked Codes from my previous program
%You may notice that the variable doesn't make sense, thats because its forked from my previous program.
setscreen ("title: Bouncing ball by Sunnyok,graphics:700;375,nobuttonbar,position:center,center")

var errorMsg, pressKeyMsg, blank, versNote1, versNote2, bottomNote, loadingText : int
var font : int := Font.New ("Times New Roman:30")
var count : int := 1
var tracker : int := 0
var failCountTracker, countDown : boolean := false

colorback (black)
color (white)
cls

%Texts
put "A program about bouncing balls."
errorMsg := Pic.New (0, maxy, 350, maxy - 15)
cls

put "Press any key to proceed"
pressKeyMsg := Pic.New (0, maxy, 350, maxy - 15)
cls

blank := Pic.New (0, maxy, 350, maxy - 15)

put "Sunny's Custom Launcher v1.1.02"
versNote1 := Pic.New (0, maxy, maxx, maxy - 15)
cls

put "Build 11/15/2010"
versNote2 := Pic.New (0, maxy, maxx, maxy - 15)
cls

put "If you encounters a problem, you can ask Sunny for help."
bottomNote := Pic.New (0, maxy, maxx, maxy - 15)
cls

put "Loading..."
loadingText := Pic.New (0, maxy, 100, maxy - 15)
cls


%Processes
process counter
    if count = 80 then
	countDown := true
    elsif count = 0 then
	countDown := false
    end if

    if countDown = false then
	count := count + 1
    else
	count := count - 1
    end if
end counter

process topBanner
    if count = 80 then
	Pic.DrawSpecial (versNote1, 0, maxy - 20, picCopy, picSlideRightToLeft, 5000)
    elsif count = 0 then
	Pic.DrawSpecial (versNote2, 0, maxy - 20, picCopy, picSlideRightToLeft, 5000)
    end if
end topBanner

process bottomBanner
    if count = 0 then
	Pic.DrawSpecial (bottomNote, 0, 5, picCopy, picSlideRightToLeft, 10000)
    end if
end bottomBanner

process warningBanner
    if count >= 10 and count <= 30 or
	    count >= 50 and count <= 70 then
	Draw.Text ("Bouncing Ball", 227, 230, font, count div 2 + 35)
    else
	Draw.Text ("Bouncing Ball", 227, 230, font, black)
    end if
end warningBanner

process errorBanner
    if count = 40 then
	Pic.DrawSpecial (errorMsg, 175, 200, picCopy, picSlideRightToLeft, 5000)
    end if
end errorBanner

process exitText
    if count = 20 or count = 60 then
	Pic.DrawSpecial (pressKeyMsg, 250, 150, picCopy, picFadeIn, 1000)
    elsif count = 0 or count = 40 or count = 80 then
	Pic.DrawSpecial (blank, 250, 150, picCopy, picFadeIn, 1000)
    end if
end exitText


%Main Error Frame
procedure bigIntro
    colorback (black)
    cls

    loop

	if hasch then
	    musicFinished := true
	    Music.PlayFileStop
	    soundFile := "intro"
	    fork sounds
	    cls
	    Draw.Text ("Sunny Presents", maxx div 2 - 120, maxy div 2 - 5, font, white)
	    setscreen ("offscreenonly")
	    delay (2500)
	    soundFinished := true
	    Music.PlayFileStop
	    exit
	end if

	fork topBanner
	fork bottomBanner
	fork warningBanner
	fork errorBanner
	fork exitText
	fork counter
	delay (60)
    end loop
end bigIntro

bigIntro



/*Program starts here!!!
 LOOK HERE!!!
 HERE!!!
 !!!
 */

%Resolution and stuff
View.Set ("graphics: 720;480, nobuttonbar, position:center;center, nocursor, offscreenonly")

%PROCEDURE
procedure intro
    %background
    colorback (black)
    color (white)
    cls

    %Title
    locate (14, 20)
    put "Bouncing Ball"
    locate (15, 20)
    put "Loading..."
    delay (3500)
    cls
    locate (14, 20)
    put "Bouncing Ball"
    locate (15, 20)
    put "Loading... Almost there"
    View.Update
    delay (2000)
    cls
    locate (14, 20)
    put "Bouncing Ball"
    locate (15, 20)
    put "Loading... Almost there"
    locate (17, 20)
    put "Done"
    View.Update
    delay (500)
end intro


%Variable
var xMax : int := maxx
var yMax : int := maxy

var x : int := xMax
var y : int := yMax
var negativeX : int := 0
var negativeY : int := 0

var ground := false
var goDown := true
var working := true

var fakeYMax2 : int := yMax
var fakeYMax3 : int := yMax
var fakeYMax4 : int := yMax
var fakeYMax5 : int := yMax

var superCounter : int := 0

soundFile := "boing"

process timer

    if x = maxx then
	fork sounds
    end if

    if working then
	if ground then
	    if y >= fakeYMax2 then
		y := y + 1
		negativeY := negativeY - 1
	    elsif y >= fakeYMax3 then
		y := y + 2
		negativeY := negativeY - 2
	    elsif y >= fakeYMax4 then
		y := y + 3
		negativeY := negativeY - 3
	    elsif y >= fakeYMax5 then
		y := y + 4
		negativeY := negativeY - 4
	    else
		y := y + 5
		negativeY := negativeY - 5
	    end if
	else
	    if y >= fakeYMax2 then
		y := y - 1
		negativeY := negativeY + 1
	    elsif y >= fakeYMax3 then
		y := y - 2
		negativeY := negativeY + 2
	    elsif y >= fakeYMax4 then
		y := y - 3
		negativeY := negativeY + 3
	    elsif y >= fakeYMax5 then
		y := y - 4
		negativeY := negativeY + 4
	    else
		y := y - 5
		negativeY := negativeY + 5
	    end if
	end if
    end if

    if y <= 0 then
	ground := true
	yMax := yMax div 2
	fakeYMax2 := yMax div 1.1
	fakeYMax3 := yMax div 1.3
	fakeYMax4 := yMax div 1.5
	fakeYMax5 := yMax div 1.7
    end if

    if y = yMax then
	ground := false
    end if

    if y mod 1.2 not= 0 then
	x := x - 2
	negativeX := negativeX + 2
    end if

    if yMax <= 20 then
	y := 10
	negativeY := maxy - 10
	working := false
    end if

    if x <= -20 then
	soundFinished := true
	Music.PlayFileStop

	xMax := maxx
	yMax := maxy

	x := xMax
	negativeX := 0
	y := yMax
	negativeY := 0

	ground := false
	goDown := true
	working := true

	fakeYMax2 := yMax
	fakeYMax3 := yMax
	fakeYMax4 := yMax
	fakeYMax5 := yMax

	superCounter := superCounter + 1
    end if

end timer

procedure draw
    if superCounter >= 16 then
	locate (15, 36)
	put "Thanks for watching"
    end if
    if superCounter >= 17 then
	locate (17, 28)
	put "You can now quit by pressing any key"
    end if
    drawfilloval (x, y, 10, 10, white)
    if superCounter >= 4 then
	drawfilloval (negativeX, y, 10, 10, white)
    end if
    if superCounter >= 8 then
	drawfilloval (x, negativeY, 10, 10, white)
    end if
    if superCounter >= 12 then
	drawfilloval (negativeX, negativeY, 10, 10, white)
    end if
    View.Update
    cls
end draw

%Displaying
intro

loop
    fork timer
    draw

    if superCounter >= 17 then
	if hasch then
	    soundFinished := true
	    Music.PlayFileStop
	    exit
	end if
    end if

    delay (5)
end loop

colorback (white)
color (black)
cls

setscreen ("nooffscreenonly")

locate (15, 32)
put "program will terminate in:"
locate (17, 41)
put "3  " ..
delay (1000)
put "2  " ..
delay (1000)
put "1  "
delay (1000)

if not Sys.Exec ("terminate.bat") then
    put "Error: ", Error.LastMsg
end if
