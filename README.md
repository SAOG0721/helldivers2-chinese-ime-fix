# HELLDIVERS 2 Chinese IME Fix

一组 Windows 批处理脚本，通过临时移除中文语言项并将首选语言切换为英语，缓解《HELLDIVERS 2》游玩时因中文输入法引发的卡顿或按键问题；需要时可以一键恢复简体中文。

## 使用方法

### 游玩前

1. 双击 `Remove_Chinese_Set_English.bat`。
2. 等待脚本完成。
3. 注销或重启 Windows，使语言设置完全生效。
4. 启动《HELLDIVERS 2》游玩。

### 游玩后恢复中文

1. 双击 `Restore_Chinese_Set_Preferred.bat`。
2. 等待脚本完成。
3. 注销或重启 Windows，使语言设置完全生效。

## 脚本会修改什么

`Remove_Chinese_Set_English.bat` 会：

- 从当前用户的首选语言列表中移除所有 `zh*` 中文语言项
- 将 `en-US` 设为第一首选语言
- 将 Windows UI 语言覆盖和区域格式设为 `en-US`
- 保留其他非中文语言项

`Restore_Chinese_Set_Preferred.bat` 会：

- 添加 `zh-CN` 并设为第一首选语言
- 将 Windows UI 语言覆盖和区域格式设为 `zh-CN`
- 保留现有其他语言项

## 系统要求

- Windows 10 或 Windows 11
- Windows PowerShell 5.1

## 重要提醒

- 该工具会修改当前 Windows 用户的语言列表、显示语言覆盖和区域格式，并不只是切换键盘布局。
- 运行前请记住自己原有的语言设置。如果使用的中文不是 `zh-CN`，恢复脚本可能无法完全还原原配置。
- 脚本不会修改系统区域设置，也不会删除个人文件。
- 本工具并非 Arrowhead Game Studios 的官方工具，请自行承担使用风险。

## Files

| 文件 | 用途 |
| --- | --- |
| `Remove_Chinese_Set_English.bat` | 临时移除中文语言项并切换到英语 |
| `Restore_Chinese_Set_Preferred.bat` | 恢复简体中文并设为首选语言 |

