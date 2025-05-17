; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ウインドウ操作
;; RWin (Left Ctrl にマッピング）と同時押し
;;

;;;; Centering
>#m:: winTile("c", "a", 1, 1)
>#Space:: winTile("c", "a", 0.6, 1)

;;;; 1/2
>#h:: winTile("l", "a", .5, 1)
>#l:: winTile("r", "a", .5, 1)
>#k:: winTile("a", "t", 1, .5)
>#j:: winTile("a", "b", 1, .5)

;;;; 1/4
>#i:: winTile("l", "t", .5, .5)
>#o:: winTile("r", "t", .5, .5)
>#,:: winTile("l", "b", .5, .5)
>#.:: winTile("r", "b", .5, .5)

;;;; 6.5:3.5
>#y:: winTile("l", "a", .35, 1)
>#u:: winTile("r", "a", .65, 1)
>#!y:: winTile("l", "a", .65, 1)
>#!u:: winTile("r", "a", .35, 1)

;;;; 1/3 縦
>#8:: winTile("a", "t", 1, .33)
>#9:: winTile("a", "c", 1, .33)
>#0:: winTile("a", "b", 1, .33)

;;;; モニター移動
>#[::+#Left
>#]::+#Right

;;;; ワークスペース移動
>#Left:: ^#Left
>#Right:: ^#Right
