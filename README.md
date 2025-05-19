# ahk-config / AutoHotkey V2 設定ファイル

## 概要

- 日本語キーボードを US 配列で使用
- タイルウインドウ操作
- 矢印/PageUp/PageDown/Home/End 等を変換キーとの同時押しで入力
- よく使うアプリケーションの Launch or Focus

## 設定方法(HHKB-JP)

- (HHKB-JP) 左Fn -> 左Ctrl / Contrl -> Caps になるようにディップスイッチで設定する。
- setup\SETUP.cmd を管理者権限で実行し、リソースを変更してキーマップを変更する。


    | FROM                | TO                    |
    | ------------------- | --------------------- |
    | ` ~ (00_29)         | Escape (00_01)        |
    | ¥ - (00_7D)         | ` ~ (00_29)           |
    | Caps_Lock (00_3A)   | Left Ctrl (00_1D)     |
    | Left Ctrl (00_1D)   | Right Windows (E0_5C) |
    | かな (00_70)        | Right Alt (E0_38)     |
    | \ _ (00_73)         | Left Shift (00_2A)    |

- 設定の「システム」→「マルチタスク」で、ウインドウのスナップを「オン」にする。
  （ウインドウ関連のショートカットキーが変わるため）

## マッピング

### keymap.ahk

- 単純なキーマップ

    | FROM     | TO            |
    | ---------|-------------- |
    | Win + q  | Alt+F4        |
    | Ctrl + h | Backspace     |
    | Ctrl + m | Enter         |
    | RAlt + m | WinMaximize   |
    | RAlt + h | WinMinimize   |
    | RAlt + j | AltTab        |
    | RAlt + k | ShiftAltTab   |
    | RAlt + ] | AltTab        |
    | RAlt + [ | ShiftAltTab   |

### henkan.ahk 

- 変換 キーと同時押し

    | FROM                   | TO            |
    | ---------------------- | ------------- |
    | HENKAN + h/j/k/l       | 矢印キー      |
    | HENKAN + 1/2/.../0/-/^ | F1 F2 ... F10 |
    | HENKAN + i/o           | PgUp PgDn     |
    | HENKAN + ,/.           | Home End      |
    | HENKAN + n             | Insert        |
    | HENKAN + m             | Delete        |
    | HENKAN + u             | AppsKey       |

### app.ahk

- アプリケーションの切り替え

  変換+キーボードの左半分のキーでアプリケーションをフォーカス or 起動

### tile.ahk + function.ahk

- RWin(リソースにより左下端キー(Left Ctrl)に設定)

    | KEY                  | TO                        |
    | -------------------- | ------------------------- |
    | RWin + h / j / k / l | 1/2 - 左 / 下 / 上 / 右   |
    | RWin + SPC           | 中央 60%幅                |
    | RWin + y             | 70%幅で左寄せ             |
    | RWin + u             | 30%幅で右寄せ             |
    | RWin + Y             | 30%幅で左寄せ             |
    | RWin + U             | 70%幅で右寄せ             |
    | RWin + m             | 最大化                    |
    | RWin + i / o / , / . | 1/4 - 左上/右上/左下/右下 |
    | RWin + ]             | 次のモニタへ              |
    | RWin + [             | 前のモニタへ              |
