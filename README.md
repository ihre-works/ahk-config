# ahk-config / AutoHotkey V2 設定ファイル

## 概要

- 日本語キーボードを US 配列で使用
- タイルウインドウ操作
- 矢印/PageUp/PageDown/Home/End 等を変換キーとの同時押しで
- よく使うアプリケーションの Launch or Focus

## 設定方法(HHKB-JP)

- (HHKB) 左Fn -> 左Ctrl / Contrl -> Caps になるようにディップスイッチで設定
- リソースを変更して次のようにマッピング

    | FROM                | TO                    |
    | ------------------- | --------------------- |
    | ¥ - (00_7D)         | `~ (00_29)            |
    | Caps (00_3A)        | Left Ctrl (00_1D)     |
    | Escape (00_01)      | `~ (00_29)            |
    | Left Ctrl (00_1D)   | Right Alt (E0_38)     |
    | かな (00_70)        | Right Windows (E0_5C) |
    | (00_73)             | Left Shift (00_2A)    |

- Windows の設定で[英語101]キーボードを選択

## マッピング

- Ctrl キーとの同時押し (ctrl.ahk)

      | FROM | TO        |
      | ---- | --------- |
      | h    | Backspace |
      | m    | Enter     |

- 変換+?: 矢印/PgUp/PgDn/Home/Endキーマッピング（henkan.ahk）

      | FROM          | TO            |
      | ------------- | ------------- |
      | h j k l       | 矢印キー      |
      | 1 2 ... 0 - ^ | F1 F2 ... F10 |
      | i o           | PgUp PgDn     |
      | , .           | Home End      |
      | n             | Insert        |
      | m             | Delete        |
      | u             | AppsKey       |

- アプリケーション切り替え (app.ahk + function.ahk）

  変換+キーボードの左半分のキーでアプリケーションをフォーカスor起動

- RAlt(リソースにより左下に設定)+?: ウインドウコントロール （tile.ahk + function.ahk）

      | KEY     | Window                    |
      | ------- | ------------------------- |
      | h j k l | 1/2-{左 下 上 右}         |
      | SPC     | 中央 60%幅                |
      | 1       | 70%幅で左寄せ             |
      | 2       | 70%幅で右寄せ             |
      | 3       | 30%幅で左寄せ             |
      | 4       | 30%幅で右寄せ             |
      | m       | 最大化                    |
      | a s z x | 1/4-{左上 右上 左下 右下} |
      | ]       | 次のモニタへ              |
      | [       | 前のモニタへ              |

- win.ahk

      | KEY      | Window        |
      | -------- | ------------- |
      | RWIN + m | WinMaximize   |
      | RWIN + h | WinMinimize,A |
      | RWIN + j | AltTab        |
      | RWIN + k | ShiftAltTab   |
      | WIN + q  | Quit          |
