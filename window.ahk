; #     Win (Windows logo key).
; !     Alt
; ^     Control
; +     Shift
; <     Use the left key of the pair.
; >     Use the right key of the pair.

;;;; 最大化/最小化
RAlt & m:: WinMaximize
RAlt & h:: WinMinimize
;;;; アプリ切り替え
RAlt & j:: AltTab
RAlt & k:: ShiftAltTab
;;;; モニター移動
RAlt & ]:: Send("+#{Right}")
RAlt & [:: Send("+#{Left}")

RAlt:: Send("{Escape}")

;;;; モニター移動
>#[::+#Left
>#]::+#Right

#q:: Send "!{F4}"
