; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.

ExplorerNextTab(arg)
{
    if GetKeyState("Ctrl", "P") {
	Send "^{Tab}"
    }
}

ExplorerPrevTab(arg)
{
    if GetKeyState("Ctrl", "P") {
	Send "+^{Tab}"
    }
}

HotIfWinActive "ahk_class CabinetWClass"
Hotkey("SC079 & i", ExplorerPrevTab)
Hotkey("SC079 & o", ExplorerNextTab)
HotIfWinActive
