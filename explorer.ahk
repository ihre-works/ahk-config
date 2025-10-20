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

FocusTreeView()
{
    hwnd := WinExist("ahk_class CabinetWClass")
    ControlFocus("SysTreeView321", hwnd)
}

FocusFileList()
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

#HotIf WinActive("ahk_class CabinetWClass") ; Explorer のウィンドウクラス

^PgDn:: Send("^{Tab}")
^PgUp:: Send("+^{Tab}")

!D:: FocusTreeView()
!F:: FocusFileList()

; HotIfWinActive "ahk_class CabinetWClass"
; Hotkey("^Left", ExplorerPrevTab)
; Hotkey("^Right", ExplorerNextTab)

#HotIf
