;;;;
;;
;; ウインドウタイル操作
;; ひらがな・カタカナキー（SC070、左下 LCtrl キーを割当）と同時押し
;;

;;;; Centering
SC070 & Enter:: winTile("r", "a", 0.96, 1)
SC070 & Space:: winTile("c", "a", 0.6, 1)
SC070 & Backspace:: WinMinimize "A"

;;;; 1/2
SC070 & h:: winTile("l", "a", .5, 1)
SC070 & l:: winTile("r", "a", .5, 1)
SC070 & k:: winTile("a", "t", 1, .5)
SC070 & j:: winTile("a", "b", 1, .5)

;;;; 6.5:3.5
SC070 & i:: winTile("l", "a", .35, 1)
SC070 & o:: winTile("r", "a", .65, 1)
SC070 & ,:: winTile("l", "a", .65, 1)
SC070 & .:: winTile("r", "a", .35, 1)

;;;; 1/4
SC070 & y:: winTile("l", "t", .5, .5)
SC070 & u:: winTile("r", "t", .5, .5)
SC070 & n:: winTile("l", "b", .5, .5)
SC070 & m:: winTile("r", "b", .5, .5)

;;;; 1/3 縦
SC070 & 8:: winTile("a", "t", 1, .33)
SC070 & 9:: winTile("a", "c", 1, .33)
SC070 & 0:: winTile("a", "b", 1, .33)

;;;; モニター移動
SC070 & [::+#Left
SC070 & ]::+#Right

;;;; ワークスペース移動
SC070 & Left:: ^#Left
SC070 & Right:: ^#Right

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
    if (!WinExist("A")) {
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

; # Win (Windows logo key).
; ! Alt
; ^ Control
; + Shift
; < Use the left key of the pair.
; > Use the right key of the pair.
