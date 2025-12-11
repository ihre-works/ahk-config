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
- setup\SETUP.cmd を管理者権限で実行し、リソースを変更して、キーボードレイアウトを「101/102キー」に設定し、キーマップを次のように変更する。

    | FROM      | (FROM_CODE) | TO                | (TO_CODE) |
    | --------- | ----------- | ----------------- | --------- |
    | ` ~       | (00_29)     | Escape            | (00_01)   |
    | ¥ -       | (00_7D)     | ` ~               | (00_29)   |
    | Caps_Lock | (00_3A)     | Left Ctrl         | (00_1D)   |
    | Left Ctrl | (00_1D)     | ひらがな/カタカナ | (00_70)   |
    | かな      | (00_70)     | Right Alt         | (E0_38)   |
    | \ _       | (00_73)     | Left Shift        | (00_2A)   |

- 設定（Win+I）→「システム」→「マルチタスク」で、
  ウインドウのスナップを「オン」にする。
  （ウインドウ関連のショートカットキーが変わるため）

## ファイル

### henkan.ahk

- 変換キーと同時押し

    | KEY                  | TO            |
    | -------------------- | ------------- |
    | 変換 + h/j/k/l       | 矢印キー      |
    | 変換 + 1/2/.../0/-/^ | F1 F2 ... F12 |
    | 変換 + i             | PgUp          |
    | 変換 + o             | PgDn          |
    | 変換 + ,             | Home          |
    | 変換 + .             | End           |
    | 変換 + n             | Insert        |
    | 変換 + m             | Delete        |
    | 変換 + u             | AppsKey       |

- 無変換キーと同時押し

    | KEY        | TO     |
    | ---------- | ------ |
    | 無変換 + j | 変換   |
    | 無変換 + l | 無変換 |
    | 無変換     | Escape |

### app.ahk

- アプリケーション切り替え、もしくは、起動
- KEY2 が設定されているものは、タスクバーにピン留めする
- オプションは、set-launcher.ps1 コマンドで変更しながら使う

    | KEY        | KEY2  | アプリ           |
    | ---------- | ----- | ---------------- |
    | 変換 + SPC | Win+1 | CoPilot          |
    | 変換 + a   | Win+2 | Explorer         |
    | 変換 + s   | Win+3 | Windows Terminal |
    | 変換 + w   | Win+4 | Microsoft Edge   |
    | 変換 + g   | Win+5 | Google Chrome    |
    | 変換 + t   | Win+6 | Teams            |
    | 変換 + r   | Win+7 | Thunderbird      |
    | 変換 + c   | Win+8 | Outlook          |
    | 変換 + z   | Win+9 | OneNote          |
    | 変換 + e   |       | オプション       |
    | 変換 + d   |       | オプション       |
    | 変換 + f   |       | オプション       |
    | 変換 + x   |       | オプション       |
    | 変換 + v   |       | オプション       |

### tile.ahk

- HIRAKATA（リソースにより、左下端キー(Left Ctrl)に設定）

    | KEY                  | 機能                      |
    | -------------------- | ------------------------- |
    | HIRAKATA + SPC       | 中央 60%幅                |
    | HIRAKATA + Enter     | 最大化                    |
    | HIRAKATA + Backspace | 最小化（HIDE）            |
    | HIRAKATA + h/j/k/l   | 1/2 - 左 / 下 / 上 / 右   |
    | HIRAKATA + y/u/n/m   | 1/4 - 左上/右上/左下/右下 |
    | HIRAKATA + i         | 30%幅で左寄せ             |
    | HIRAKATA + o         | 70%幅で右寄せ             |
    | HIRAKATA + ,         | 70%幅で左寄せ             |
    | HIRAKATA + .         | 30%幅で右寄せ             |
    | HIRAKATA + ]         | 次のモニタへ              |
    | HIRAKATA + [         | 前のモニタへ              |
    | HIRAKATA + →         | 右のワークスペースへ      |
    | HIRAKATA + ←         | 左のワークスペースへ      |
    | HIRAKATA + ↑         | ワークスペース一覧        |

### misc.ahk

- いろいろ

    | KEY      | TO          |
    | -------- | ----------- |
    | Win + q  | Alt+F4      |
    | Ctrl + m | Enter       |
    | Ctrl + h | Backspace   |
    | RAlt + j | AltTab      |
    | RAlt + k | ShiftAltTab |

### explorer.ahk

- Explorer 用

    | KEY       | 機能                  |
    | --------- | --------------------- |
    | Alt + D   | TreeView にフォーカス |
    | Alt + F   | MainView にフォーカス |
    | Ctrl + 左 | 左のタブへ            |
    | Ctrl + 右 | 右のタブへ            |

## メモ

vkF2 sc070 ... ひらがな/カタカナキー
vk1C SC079 ... 変換キー
vk1D SC07B ... 無変換キー
