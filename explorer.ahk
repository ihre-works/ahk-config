;;;;
;;
;; Explorer 用ホットキー
;;

ExplorerNextTab()
{
    Send "^{Tab}"
}

ExplorerPrevTab()
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

#HotIf WinActive("ahk_exe explorer.exe") ; Explorer のウィンドウクラス

^PgDn:: ExplorerNextTab()
^PgUp:: ExplorerPrevTab()

!D:: FocusTreeView()
!F:: FocusFileList()

; HotIfWinActive "ahk_class CabinetWClass"
; Hotkey("^Left", ExplorerPrevTab)
; Hotkey("^Right", ExplorerNextTab)

#HotIf
