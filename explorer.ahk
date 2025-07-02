;;;;
;;
;; Explorer 用ホットキー
;;

ExplorerNextTab(arg)
{
	Send "^{Tab}"
}

ExplorerPrevTab(arg)
{
	Send "+^{Tab}"
}

FocusTreeView(arg)
{
    hwnd := WinExist("ahk_class CabinetWClass")
    ControlFocus("SysTreeView321", hwnd)
}

FocusFileList(arg)
{
    hwnd := WinExist("ahk_class CabinetWClass")
    try {
        ControlFocus("DirectUIHWND2", hwnd)
    } catch {
        ;
    }
    try {
        ControlFocus("DirectUIHWND3", hwnd)
    } catch {
        ;
    }
}

HotIfWinActive "ahk_class CabinetWClass"
Hotkey("^Left", ExplorerPrevTab)
Hotkey("^Right", ExplorerNextTab)
Hotkey("!D", FocusTreeView)
Hotkey("!F", FocusFileList)
HotIfWinActive
