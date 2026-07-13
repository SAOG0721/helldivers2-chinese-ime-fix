@echo off
chcp 437 >nul
title Restore Chinese language and set it as preferred

set "PS1=%TEMP%\restore_chinese_language_%RANDOM%.ps1"

> "%PS1%" echo $ErrorActionPreference = 'Stop'
>> "%PS1%" echo Write-Host "=== Current language information ==="
>> "%PS1%" echo Write-Host ("Current UI culture: " + (Get-UICulture).Name)
>> "%PS1%" echo Write-Host ("Current culture: " + (Get-Culture).Name)
>> "%PS1%" echo $uiOverride = Get-WinUILanguageOverride
>> "%PS1%" echo if ($uiOverride) { Write-Host ("Windows UI language override: " + $uiOverride.Name) } else { Write-Host "Windows UI language override: None" }
>> "%PS1%" echo Write-Host ("System locale: " + (Get-WinSystemLocale).Name)
>> "%PS1%" echo Write-Host ""
>> "%PS1%" echo Write-Host "=== Current preferred language list ==="
>> "%PS1%" echo $current = Get-WinUserLanguageList
>> "%PS1%" echo foreach ($lang in $current) {
>> "%PS1%" echo     Write-Host ("- " + $lang.LanguageTag + " | " + $lang.EnglishName)
>> "%PS1%" echo }
>> "%PS1%" echo Write-Host ""
>> "%PS1%" echo $target = 'zh-CN'
>> "%PS1%" echo Write-Host "Target preferred language: Chinese (Simplified, China) / zh-CN"
>> "%PS1%" echo $newList = New-WinUserLanguageList $target
>> "%PS1%" echo foreach ($lang in $current) {
>> "%PS1%" echo     if ($lang.LanguageTag -eq $target) { continue }
>> "%PS1%" echo     $newList.Add($lang) ^| Out-Null
>> "%PS1%" echo }
>> "%PS1%" echo Set-WinUserLanguageList -LanguageList $newList -Force
>> "%PS1%" echo Set-WinUILanguageOverride -Language $target
>> "%PS1%" echo Set-Culture $target
>> "%PS1%" echo Write-Host ""
>> "%PS1%" echo Write-Host "=== New preferred language list ==="
>> "%PS1%" echo $after = Get-WinUserLanguageList
>> "%PS1%" echo foreach ($lang in $after) {
>> "%PS1%" echo     Write-Host ("- " + $lang.LanguageTag + " | " + $lang.EnglishName)
>> "%PS1%" echo }
>> "%PS1%" echo Write-Host ""
>> "%PS1%" echo Write-Host "Done. Please sign out or restart Windows to fully apply the display language change."

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"
set "RC=%ERRORLEVEL%"

del "%PS1%" >nul 2>nul

echo.
if not "%RC%"=="0" (
    echo Failed. Exit code: %RC%
) else (
    echo Completed.
)

pause
exit /b %RC%
