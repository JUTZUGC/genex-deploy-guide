#!/usr/bin/env bash
set -euo pipefail
# Genex 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/genex-games/genex-desktop/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

if [ "$(uname -s)" = "Darwin" ]; then url=https://github.com/genex-games/genex-desktop/releases/download/v0.1.25/Genex-darwin-arm64-0.1.25.zip ; want=159224bd67204df1af35fd89f3e7dc33c667cbc64307d5f2eeda580132b426ba ; file=Genex.zip ; elif [ "$(uname -s)" = "Linux" ]; then url=https://github.com/genex-games/genex-desktop/releases/download/v0.1.25/Genex-linux-amd64.deb ; want=e1a3df34dea2164b444b306c4cdc8f92d2b20fd1658458615b2ffe3e131fc298 ; file=genex.deb ; else echo "Windows 请使用 PowerShell 步骤下载安装包"; exit 1 ; fi
curl -fL -o "$file" "$url"
if [ "$file" = "genex.deb" ]; then echo "$want  $file" | sha256sum -c - ; sudo dpkg -i "$file" || sudo apt-get install -f -y ; else echo "$want  $file" | shasum -a 256 -c - ; unzip -o "$file" ; echo "解压完成：打开 Genex.app" ; fi

echo ""

echo "安装完成：打开 Genex，登录 Claude Code 或 ChatGPT 订阅，或切到本地模型，然后新建一个游戏项目"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/genex-games/genex-desktop/blob/main/README.md"
