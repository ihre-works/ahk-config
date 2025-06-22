;;;;
;;
;; ウインドウタイル操作
;; ひらがな・カタカナキー（SC070、左下 LCtrl キーを割当）と同時押し
;;

;;;; Centering
SC070 & Enter:: winTile("c", "a", 1, 1)
SC070 & Space:: winTile("c", "a", 0.6, 1)
SC070 & Backspace:: WinMinimize "A"

;;;; 1/2
SC070 & h:: winTile("l", "a", .5, 1)
SC070 & l:: winTile("r", "a", .5, 1)
SC070 & k:: winTile("a", "t", 1, .5)
SC070 & j:: winTile("a", "b", 1, .5)

;;;; 6.5:3.5
SC070 & i:: winTile("l", "a", .35, 1)
SC070 & o:: winTile("r", "a", .65, 1)
SC070 & ,:: winTile("l", "a", .65, 1)
SC070 & .:: winTile("r", "a", .35, 1)

;;;; 1/4
SC070 & y:: winTile("l", "t", .5, .5)
SC070 & u:: winTile("r", "t", .5, .5)
SC070 & n:: winTile("l", "b", .5, .5)
SC070 & m:: winTile("r", "b", .5, .5)

;;;; 1/3 縦
SC070 & 8:: winTile("a", "t", 1, .33)
SC070 & 9:: winTile("a", "c", 1, .33)
SC070 & 0:: winTile("a", "b", 1, .33)

;;;; モニター移動
SC070 & [::+#Left
SC070 & ]::+#Right

;;;; ワークスペース移動
SC070 & Left:: ^#Left
SC070 & Right:: ^#Right

; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.
