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
    ControlFocus("DirectUIHWND2", hwnd)
}

HotIfWinActive "ahk_class CabinetWClass"
Hotkey("^Left", ExplorerPrevTab)
Hotkey("^Right", ExplorerNextTab)
Hotkey("!D", FocusTreeView)
Hotkey("!F", FocusFileList)
HotIfWinActive
