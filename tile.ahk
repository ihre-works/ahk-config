;;;;
;;
;; ウインドウタイル操作
;; ひらがな・カタカナキー（SC070、左下 LCtrl キーを割当）と同時押し
;;

SideMarginRate := 1.0 / 48.0
CurMonitor := -9999

;;;; Centering
SC070 & Enter:: winTile(CurMonitor, "a", "a", 1, 1)
SC070 & Space:: winTile(CurMonitor, "c", "a", 0.7, 1)
SC070 & Backspace:: WinMinimize "A"
SC070 & 1:: winTile(1, "a", "a", 1, 1)
SC070 & 2:: winTile(2, "c", "a", 1, 1)

;;;; 1/2
SC070 & h:: winTile(CurMonitor, "l", "a", .5, 1)
SC070 & l:: winTile(CurMonitor, "r", "a", .5, 1)
SC070 & k:: winTile(CurMonitor, "a", "t", 1, .5)
SC070 & j:: winTile(CurMonitor, "a", "b", 1, .5)

;;;; 6.5:3.5
SC070 & i:: winTile(CurMonitor, "l", "a", .35, 1)
SC070 & o:: winTile(CurMonitor, "r", "a", .65, 1)
SC070 & ,:: winTile(CurMonitor, "l", "a", .65, 1)
SC070 & .:: winTile(CurMonitor, "r", "a", .35, 1)

;;;; 1/4
SC070 & y:: winTile(CurMonitor, "l", "t", .5, .5)
SC070 & u:: winTile(CurMonitor, "r", "t", .5, .5)
SC070 & n:: winTile(CurMonitor, "l", "b", .5, .5)
SC070 & m:: winTile(CurMonitor, "r", "b", .5, .5)

;;;; 1/3 縦
SC070 & 8:: winTile(CurMonitor, "a", "t", 1, .33)
SC070 & 9:: winTile(CurMonitor, "a", "c", 1, .33)
SC070 & 0:: winTile(CurMonitor, "a", "b", 1, .33)

;;;; モニター移動
SC070 & [::+#Left
SC070 & ]::+#Right

;;;; ワークスペース移動
SC070 & Left:: ^#Left
SC070 & Right:: ^#Right
SC070 & Up:: #Tab

;;
;; Move and Resize Window
;;
;; mid ... Monitor Number (-9999 current monitor)
;; pW ... Position of X (l ... Left / r ... Right  / c .. Centering / Other ... Maximize)
;; pH ... Position of Y (t ... Top  / b ... Bottom / c .. Centering / Other ... Maximize)
;; dW ... Rate of Width
;; dH ... Rate of Height
;;
winTile(mid, pW, pH, dW, dH) {
    if (!WinExist("A")) {
        return
    }
    MonitorNumber := mid
    if (mid == CurMonitor) {
        WinGetPos(&x, &y, &w, &h, "A")
        center_x := x + w / 2
        center_y := y + h / 2
        MonitorCount := MonitorGetCount()
        loop MonitorCount {
            ; MonitorGet A_Index, &L, &T, &R, &B
            MonitorGetWorkArea A_Index, &WL, &WT, &WR, &WB
            ;; MsgBox("IDX=" A_Index ", WL=" WL ", WT=" WT ", WR=" WR ", WB=" WB ", x=" x ", y=" y ", w=" w ", h=" h)
            if (WL <= center_x and center_x < WR and WT <= center_y and center_y < WB) {
                MonitorNumber := A_Index
            }
        }
    }

    MonitorGetWorkArea(MonitorNumber, &MonLeft, &MonTop, &MonRight, &MonBottom)
    activeWindowID := WinGetID("A")

    ; Get Monitor width and height
    mw := MonRight - MonLeft
    mh := MonBottom - MonTop

    ; Get virtual monitor width and height, and position.
    if (MonitorNumber == 1) {
        leftSideMargin := mw * SideMarginRate
    } else {
        leftSideMargin := SideMarginRate
    }
    vmw := mw - leftSideMargin
    vmh := mh
    VMonLeft  := MonLeft + leftSideMargin
    VMonRight := MonRight

    ;; Get width and height of the window.
    if (pH == "t" || pH == "b" || pH == "c") {
        h := vmh * dH
    } else {
        h := vmh
    }
    if (pW == "l" || pW == "r" || pW == "c") {
        w := vmw * dW
    } else {
        w := vmw
    }

    ;; Get top-left position of the window.
    if (pW == "r") {
        x := VMonRight - w
    } else if (pW == "c") {
        x := VMonLeft + (mw - w) / 2
    } else {
        x := VMonLeft
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

; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.
