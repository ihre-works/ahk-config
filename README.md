# ahk-config / AutoHotkey V2 設定ファイル

## 概要

- 日本語キーボードを US 配列で使用
- タイルウインドウ操作
- 矢印/PageUp/PageDown/Home/End 等を変換キーとの同時押しで入力
- よく使うアプリケーションの Focus or Launch

## AutoHotkey の起動方法

管理者権限で実行されるアプリについても、AutoHotkey を有効にするため、
AutoHotkey_UIA.exe を /uiAccess オプション付きで起動する。

## 設定方法(HHKB-JP)

- (HHKB-JP) 左Fn -> 左Ctrl / Contrl -> Caps になるようにディップスイッチで設定する。
- setup\SETUP.cmd を管理者権限で実行し、リソースを変更してキーマップを変更する。

    | FROM      | (FROM_CODE) | TO                | (TO_CODE) |
    | --------- | ----------- | ----------------- | --------- |
    | ` ~       | (00_29)     | Escape            | (00_01)   |
    | ¥ -       | (00_7D)     | ` ~               | (00_29)   |
    | Caps_Lock | (00_3A)     | Left Ctrl         | (00_1D)   |
    | Left Ctrl | (00_1D)     | ひらがな/カタカナ | (00_70)   |
    | かな      | (00_70)     | Right Alt         | (E0_38)   |
    | \ _       | (00_73)     | Left Shift        | (00_2A)   |
    | 無変換    | (00_7B)     | Escape            | (00_01)   |

- 設定（Win+I）を開き、「システム」→「マルチタスク」で、
  ウインドウのスナップを「オフ」にする。
  （ウインドウ関連のショートカットキーが変わるため）

## マッピング

### henkan.ahk

- 変換キーと同時押し

    | KEY                    | TO            |
    | ---------------------- | ------------- |
    | HENKAN + h/j/k/l       | 矢印キー      |
    | HENKAN + 1/2/.../0/-/^ | F1 F2 ... F12 |
    | HENKAN + i             | PgUp          |
    | HENKAN + o             | PgDn          |
    | HENKAN + ,             | Home          |
    | HENKAN + .             | End           |
    | HENKAN + n             | Insert        |
    | HENKAN + m             | Delete        |
    | HENKAN + u             | AppsKey       |

### app.ahk

- アプリケーション切り替え、もしくは、起動
- KEY2 が設定されているものは、タスクバーにピン留めする
- オプションは、set-launcher.ps1 コマンドで変更しながら使う

    | KEY          | KEY2  | アプリ           |
    | ------------ | ----- | ---------------- |
    | HENKAN + SPC | Win+1 | CoPilot          |
    | HENKAN + a   | Win+2 | Explorer         |
    | HENKAN + s   | Win+3 | Windows Terminal |
    | HENKAN + w   | Win+4 | Microsoft Edge   |
    | HENKAN + g   | Win+5 | Google Chrome    |
    | HENKAN + t   | Win+6 | Teams            |
    | HENKAN + r   | Win+7 | Thunderbirdt     |
    | HENKAN + c   | Win+8 | Outlook          |
    | HENKAN + z   | Win+9 | OneNote          |
    | HENKAN + e   |       | オプション       |
    | HENKAN + d   |       | オプション       |
    | HENKAN + f   |       | オプション       |
    | HENKAN + x   |       | オプション       |
    | HENKAN + v   |       | オプション       |

### tile.ahk + function.ahk

- HIRAKATA(リソースにより、左下端キー(Left Ctrl)に設定)

    | KEY                      | 機能                      |
    | ------------------------ | ------------------------- |
    | HIRAKATA + SPC           | 中央 60%幅                |
    | HIRAKATA + Enter         | 最大化                    |
    | HIRAKATA + Backspace     | 最小化（HIDE）            |
    | HIRAKATA + h / j / k / l | 1/2 - 左 / 下 / 上 / 右   |
    | HIRAKATA + y / u / n / m | 1/4 - 左上/右上/左下/右下 |
    | HIRAKATA + i             | 30%幅で左寄せ             |
    | HIRAKATA + o             | 70%幅で右寄せ             |
    | HIRAKATA + ,             | 70%幅で左寄せ             |
    | HIRAKATA + .             | 30%幅で右寄せ             |
    | HIRAKATA + ]             | 次のモニタへ              |
    | HIRAKATA + [             | 前のモニタへ              |

### explorer.ahk

- Explorer 用

    | KEY                   | 機能                  |
    | --------------------- | --------------------- |
    | Ctrl + D              | TreeView にフォーカス |
    | Ctrl + F              | MainView にフォーカス |
    | Ctrl + 左 / Ctrl + 右 | タブ切り替え          |


### misc.ahk

- いろいろ

    | KEY      | TO          |
    | -------- | ----------- |
    | Win + q  | Alt+F4      |
    | Ctrl + m | Enter       |
    | Ctrl + h | Backspace   |
    | RAlt + j | AltTab      |
    | RAlt + k | ShiftAltTab |


## メモ

vkF2 sc070 ... ひらがな/カタカナキー
vk1C SC079 ... 変換キー
vk1D SC07B ... 無変換キー
