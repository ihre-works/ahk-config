;;;;
;;
;; 関数定義
;;

;;;; Focus or Run the Application
appFocusOrRun(code) {
    confFile := A_MyDocuments "\AutoHotkey\do-" code
    if !FileExist(confFile) {
        Return
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

;;
;; Move and Resize Window
;;
;; mid ... Monitor Number
;; pW ... Position of X (l ... Left / r ... Right  / c .. Centering / Other ... Maximize)
;; pH ... Position of Y (t ... Top  / b ... Bottom / c .. Centering / Other ... Maximize)
;; dW ... Rate of Width
;; dH ... Rate of Height
;;
winTile(pW, pH, dW, dH) {
    if ( not WinExist("A")) {
        return
    }
    WinGetPos(&x, &y, &w, &h, "A")
    center_x := x + w / 2
    center_y := y + h / 2
    MonitorNumber := 0
    MonitorCount := MonitorGetCount()
    loop MonitorCount {
        ; MonitorGet A_Index, &L, &T, &R, &B
        MonitorGetWorkArea A_Index, &WL, &WT, &WR, &WB
        ;; MsgBox("IDX=" A_Index ", WL=" WL ", WT=" WT ", WR=" WR ", WB=" WB ", x=" x ", y=" y ", w=" w ", h=" h)
        if (WL <= center_x and center_x < WR and WT <= center_y and center_y < WB) {
            MonitorNumber := A_Index
        }
    }

    MonitorGetWorkArea(MonitorNumber, &MonLeft, &MonTop, &MonRight, &MonBottom)
    activeWindowID := WinGetID("A")

    x := MonLeft
    y := MonTop
    w := MonRight - MonLeft
    h := MonBottom - MonTop
    mw := MonRight - MonLeft
    mh := MonBottom - MonTop

    ;; Get width and height of the window.
    if (pH == "t" || pH == "b" || pH == "c") {
        h := mh * dH
    } else {
        h := mh
    }
    if (pW == "l" || pW == "r" || pW == "c") {
        w := mw * dW
    } else {
        w := mw
    }

    ;; Get top-left position of the window.
    if (pW == "r") {
        x := MonRight - w
    } else if (pW == "c") {
        x := MonLeft + (mw - w) / 2
    } else {
        x := MonLeft
    }
    if (pH == "b") {
        y := MonBottom - h
    } else if (pH == "c") {
        y := MonTop + (mh - h) / 2
    } else {
        y := MonTop
    }

    WinMove(x, y, w, h, "ahk_id" activeWindowID)
    WinRestore("ahk_id" activeWindowID)
    WinMove(x, y, w, h, "ahk_id" activeWindowID)
}
