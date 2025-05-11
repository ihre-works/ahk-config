MonitorCount := MonitorGetCount()
WinGetPos(&x, &y, &w, &h, "ahk_exe Code.exe")
Loop MonitorCount
{
        MonitorGet A_Index, &L, &T, &R, &B
        MonitorGetWorkArea A_Index, &WL, &WT, &WR, &WB

        inOut := (L <= x and x < R and T <= y and y < B)
        MsgBox
        (
         "Monitor:`t#" A_Index "
          Name:`t" MonitorGetName(A_Index) "
          Left:`t" L " (" WL " work)
          Top:`t" T " (" WT " work)
          Right:`t" R " (" WR " work)
          Bottom:`t" B " (" WB " work)
          Window: `t" x ", " y ", " w ", " h "
          InOut: " inOut
        )
}
