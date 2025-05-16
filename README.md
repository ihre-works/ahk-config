# ahk-config / AutoHotkey V2 設定ファイル

## 概要

- 日本語キーボードを US 配列で使用
- タイルウインドウ操作
- 矢印/PageUp/PageDown/Home/End 等を変換キーとの同時押しで入力
- よく使うアプリケーションの Launch or Focus

## 設定方法(HHKB-JP)

- (HHKB) 左Fn -> 左Ctrl / Contrl -> Caps になるようにディップスイッチで設定
- リソースを変更して次のようにマッピング

    | FROM                | TO                    |
    | ------------------- | --------------------- |
    | `~ (00_29)          | Escape (00_01)        |
    | ¥ - (00_7D)         | `~ (00_29)            |
    | Caps_Lock (00_3A)   | Left Ctrl (00_1D)     |
    | Escape (00_01)      | `~ (00_29)            |
    | Left Ctrl (00_1D)   | Right Windows (E0_5C) |
    | かな (00_70)        | Right Alt (E0_38)     |
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

- RWin(リソースにより左下端キーに設定)+?: ウインドウコントロール （tile.ahk + function.ahk）

      | KEY     | Window                    |
      | ------- | ------------------------- |
      | h j k l | 1/2-{左 下 上 右}         |
      | SPC     | 中央 60%幅                |
      | y       | 70%幅で左寄せ             |
      | u       | 30%幅で右寄せ             |
      | Y       | 30%幅で左寄せ             |
      | U       | 70%幅で右寄せ             |
      | m       | 最大化                    |
      | i o , . | 1/4-{左上 右上 左下 右下} |
      | ]       | 次のモニタへ              |
      | [       | 前のモニタへ              |

- window.ahk

      | KEY      | Window        |
      | -------- | ------------- |
      | RAlt + m | WinMaximize   |
      | RAlt + h | WinMinimize,A |
      | RAlt + j | AltTab        |
      | RAlt + k | ShiftAltTab   |
      | RAlt + ] | AltTab        |
      | RAlt + [ | ShiftAltTab   |
      | Win + q  | Quit          |
