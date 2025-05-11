; #     Win (Windows logo key).
; !     Alt
; ^     Control
; +     Shift
; <     Use the left key of the pair.
; >     Use the right key of the pair.

;;;; Window Control by Right+Win
RAlt & m:: WinMaximize
RAlt & h:: WinMinimize
RAlt & j:: AltTab
RAlt & k:: ShiftAltTab
RAlt:: Send "{Escape}"

;;;; explorer/msedge/outlook/mintty 以外は閉じる
#q:: Send "!{F4}"

