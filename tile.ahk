; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.

;;;; Centering
>#m:: winTile("c", "a", 1, 1)
>#Space:: winTile("c", "a", 0.6, 1)

;;;; 1/2
>#h:: winTile("l", "a", .5, 1)
>#l:: winTile("r", "a", .5, 1)
>#k:: winTile("a", "t", 1, .5)
>#j:: winTile("a", "b", 1, .5)

;;;; 1/4
>#a:: winTile("l", "t", .5, .5)
>#s:: winTile("r", "t", .5, .5)
>#z:: winTile("l", "b", .5, .5)
>#x:: winTile("r", "b", .5, .5)

;;;; 7:3
>#1:: winTile("l", "a", .70, 1)
>#2:: winTile("r", "a", .70, 1)
>#3:: winTile("l", "a", .30, 1)
>#4:: winTile("r", "a", .30, 1)

;;;; 1/3 縦
>#8:: winTile("a", "t", 1, .33)
>#9:: winTile("a", "c", 1, .33)
>#0:: winTile("a", "b", 1, .33)

;;;; モニター間移動
>#]:: Send "+#{Right}"
>#[:: Send "+#{Left}"
