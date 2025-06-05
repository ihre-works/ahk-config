; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.
;;;;

SC079 & a::^#1 ; Explorer
SC079 & s::^#2 ; Teaminal
SC079 & w::^#3 ; Web browser (edge)
SC079 & g::^#4 ; Google Chrome
SC079 & t::^#5 ; Teams
SC079 & r::^#6 ; Mail
SC079 & c::^#7 ; Outlook (Calendar)
SC079 & z::^#8 ; OneNote
SC079 & x::^#9 ; Excel
SC079 & e:: appFocusOrRun("e")
SC079 & d:: appFocusOrRun("d")
SC079 & f:: appFocusOrRun("f")
; SC079 & z:: {
;     if (pid := ProcessExist("OneNote.exe"))
;         WinActivate("ahk_pid" pid)
; }

RWin & a::^#1   ; Launch explorer
RWin & w::Return
RWin & s::Return
RWin & e::Return
RWin & d::Return
RWin & r::Return
RWin & f::Return
RWin & t::Return
RWin & g::Return
RWin & x::Return

LWin & f::Return ; Ignore feedback

; #IfWinActive ahk_exe wezterm-gui.exe
; RWin & c::Send,+^c
; RWin & x::Send,+^x
; RWin & v::Send,+^v
; #IfWinActive
