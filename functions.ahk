;;;;
;;;; Focus or Run the Application
;;;;
appFocusOrRun(code) {
    confFile := A_MyDocuments "\AutoHotkey\do-" code
    buf := StrSplit(FileRead(confFile), "`n")
    if WinExist(buf[2]) {
        WinActivate(buf[2])
    } else {
        Run(buf[3])
    }
}

;;;;
;;;; Move and Resize Window
;;;;
;;;; mid ... Monitor Number
;;;; pW ... Position of X (l ... Left / r ... Right  / c .. Centering / Other ... Maximize)
;;;; pH ... Position of Y (t ... Top  / b ... Bottom / c .. Centering / Other ... Maximize)
;;;; dW ... Rate of Width
;;;; dH ... Rate of Height
;;;;
winTile(pW, pH, dW, dH) {
    if (not WinExist("A")) {
        return
    }
    WinGetPos(&x, &y, &w, &h, "A")
    center_x := x + w / 2
    center_y := y + h / 2
    MonitorNumber := 0
    MonitorCount := MonitorGetCount()
    Loop MonitorCount
    {
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
    If (pH == "t" || pH == "b" || pH == "c") {
        h := mh * dH
    } Else {
        h := mh
    }
    If (pW == "l" || pW == "r" || pW == "c") {
        w := mw * dW
    } Else {
        w := mw
    }

    ;; Get top-left position of the window.
    If (pW == "r") {
        x := MonRight - w
    } Else If (pW == "c") {
        x := MonLeft + (mw - w) / 2
    } Else {
        x := MonLeft
    }
    If (pH == "b") {
        y := MonBottom - h
    } Else If (pH == "c") {
        y := MonTop + (mh - h) / 2
    } Else {
        y := MonTop
    }

    WinMove(x, y, w, h, "ahk_id" activeWindowID)
    WinRestore("ahk_id" activeWindowID)
    WinMove(x, y, w, h, "ahk_id" activeWindowID)
}
