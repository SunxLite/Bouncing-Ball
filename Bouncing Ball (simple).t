%Bouncing Ball Turing Reference
%by Sunnyok

setscreen ("nocursor, nobuttonbar, offscreenonly")

var xMax : int := maxx
var yMax : int := maxy

var x : int := xMax
var y : int := yMax

var ground := false
var goDown := true

loop

    if ground then
	y := y + 2
    else
	y := y - 2
    end if

    if y <= 0 then
	ground := true
	yMax := yMax div 2
    end if

    if y = yMax then
	ground := false
    end if

    if yMax < 30 then
	y := 10
    end if

    x := x - 1

    drawfilloval (x, y, 10, 10, black)
    View.Update
    cls

    delay (5)

end loop
