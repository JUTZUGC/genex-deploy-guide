# Genex 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/genex-games/genex-desktop/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -L --fail -o Genex-Setup.exe "https://github.com/genex-games/genex-desktop/releases/download/v0.1.25/Genex-Setup.exe"
if ((Get-FileHash Genex-Setup.exe -Algorithm SHA256).Hash.ToLower() -ne '706311e69a5e8105e2540d0abf808d5b7e107e005735e9c968eb1648cfb2bbe0') { throw 'SHA256 校验失败，请重新下载' }
Start-Process -FilePath .\Genex-Setup.exe

Write-Host ''

Write-Host '安装完成：打开 Genex，登录 Claude Code 或 ChatGPT 订阅，或切到本地模型，然后新建一个游戏项目'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/genex-games/genex-desktop/blob/main/README.md'
