;;;;
;;
;; 変換/無変換と同時押し
;; (アプリケーションランチャーは app.ahk に）
;;

;;;; 変換キー
SC079 & 1::Send "!{F1}"
SC079 & 2::Send "{Blind}{F2}"
SC079 & 3::Send "{Blind}{F3}"
SC079 & 4::Send "{Blind}{F4}"
SC079 & 5::Send "{Blind}{F5}"

SC079 & 6::Send "{Blind}{F6}"
SC079 & 7::Send "{Blind}{F7}"
SC079 & 8::Send "{Blind}{F8}"
SC079 & 9::Send "{Blind}{F9}"
SC079 & 0::Send "{Blind}{F10}"
SC079 & -::Send "{Blind}{F11}"
SC079 & +::Send "{Blind}{F12}"

SC079 & i::Send "{Blind}{PgUp}"
SC079 & o::Send "{Blind}{PgDn}"

SC079 & h::Send "{Blind}{Left}"
SC079 & j::Send "{Blind}{Down}"
SC079 & k::Send "{Blind}{Up}"
SC079 & l::Send "{Blind}{Right}"

SC079 & ,::Send "{Blind}{Home}"
SC079 & .::Send "{Blind}{End}"

SC079 & n::Send "{Blind}{Insert}"
SC079 & m::Send "{Blind}{Delete}"
SC079 & u::Send "{Blind}{AppsKey}"

; Ctrl+NumpadAdd は Exploer の幅調整で使う
SC079 & p::Send "{Blind}{NumpadAdd}"

;;;; 無変換キー
SC07B & j:: Send "{vk1C}"
SC07B & l:: Send "{vk1D}"

SC07B:: Send "{Escape}"

; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.
