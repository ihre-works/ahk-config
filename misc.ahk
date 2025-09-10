;;;;
;;
;; いろいろ
;;

#q:: Send "!{F4}"

^m:: Send "{Enter}"
^h:: Send "{Backspace}"
^[:: Send "{Escape}"

>^c:: Send "^+c"
>^v:: Send "^+v"
>^x:: Send "^+x"

;;;; アプリ切り替え (Alt+Tab の代替）
RAlt & j:: AltTab
RAlt & k:: ShiftAltTab
RAlt & h:: WinMinimize "A"

#f:: Return          ; feedback ショートカットの無効化
#=:: Return         ; 拡大鏡 ショートカットの無効化
^#L:: Return        ; Live Caption ショートカットの無効化

; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.
