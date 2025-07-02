;;;;
;;
;; Launcher
;;

;; Copilot
SC079 & Space::^#1
;; Explorer
SC079 & a:: focusOrSend("ahk_class CabinetWClass", "^#2")
;; Windows Terminal
SC079 & s:: focusOrSend("ahk_class CASCADIA_HOSTING_WINDOW_CLASS", "^#3")
;; Microsoft Edge
SC079 & w:: focusOrSend("ahk_exe msedge.exe", "^#4")
;; Google Chrome
SC079 & g:: focusOrSend("ahk_exe chrome.exe", "^#5")
;; Teams
SC079 & t:: focusOrSend("ahk_class TeamsWebView", "^#6")
;; Thunderbird
SC079 & r:: focusOrSend("ahk_exe thunderbird.exe", "^#7")
;; Outlook
SC079 & c:: focusOrSend("ahk_class 'Olk Host'", "^#8")
;; OneNote
SC079 & z:: focusOrSend("ahk_exe ONENOTE.EXE", "^#9")
;; Option
SC079 & e:: appFocusOrRun("e")
SC079 & d:: appFocusOrRun("d")
SC079 & f:: appFocusOrRun("f")
SC079 & x:: appFocusOrRun("x")
SC079 & v:: appFocusOrRun("v")

;;
;; Focus or Run the Application
;;
appFocusOrRun(code) {
    confFile := A_MyDocuments "\AutoHotkey\do-" code
    if !FileExist(confFile) {
        return
    }
    buf := StrSplit(FileRead(confFile), ["`n`r", "`n"])
    query := Trim(buf[2], "`n`r")
    cmd := Trim(buf[3], "`n`r")
    if (InStr(query, "process") = 1) {
        process := StrSplit(query, [" ", "`t"])[2]
        pid := ProcessExist(process)
        ; MsgBox "Check process: [" process "] pid: [" pid "]"
        if (pid) {
            WinActivate("ahk_pid " pid)
        } else {
            Run cmd
        }
    } else {
        result := WinExist(query)
        ; MsgBox "Check win: [" query "]
        if (result) {
            WinActivate query
        } else {
            Run cmd
        }
    }
}

focusOrSend(check, sendKey) {
    if WinExist(check) {
        WinActivate check
    } else {
        Send sendKey
    }
}

focusOrRun(check, program) {
    if WinExist(check) {
        WinActivate check
    } else {
        Run(program)
    }
}

; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.
