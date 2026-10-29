# Genex 一键安装指南

> 第三方部署指南 · 非 Genex 官方仓库。官方项目：[genex-games/genex-desktop](https://github.com/genex-games/genex-desktop)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://github.com/genex-games/genex-desktop/blob/main/README.md)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用配一堆引擎插件，让百度搭子把 Genex 装好，在对话里把游戏原型做出来。

⚠️ 项目处于早期预览，功能与格式会变。需要 Claude Code / ChatGPT 订阅，或自备本地模型与足够显存。Windows 安装包尚未签名；macOS 只提供 Apple Silicon 包。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/genex-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统下载 Windows / macOS / Linux 安装包并校验 SHA256，再启动安装，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## Genex 是什么？

Genex 是开源的0.8k stars，MIT，用对话和多个 Agent 做游戏的桌面工作台（协议：MIT，<img src="https://img.shields.io/github/stars/genex-games/genex-desktop?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

把游戏开发放进一个桌面工作台：主 Agent、子 Agent 与审查 Agent 协作，边聊边生成代码与资产，能调 Blender 插件做 3D，也能导出到 Unreal、Godot 或发布到 Web。

- 对话式开发：描述玩法，Agent 直接写代码与资源
- 多 Agent：主 Agent、worker 与 reviewer 可混用不同模型
- 本地 3D：通过 Blender 插件在本机生成资产
- 外部工具：Meshy、Tripo、ElevenLabs 等经工具路由接入
- 订阅复用：可直接用 Claude Code 或 ChatGPT 订阅
- 多平台：Windows、macOS Apple Silicon、Linux

（来源：[官方仓库](https://github.com/genex-games/genex-desktop)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 0.8k stars | 10 月新项目，名字搜索竞争很低 |
| 对话即开发 | 不用手工搭工程就能出原型 |
| 多 Agent | 主 Agent、worker、reviewer 分工 |
| 订阅复用 | 能用已有的 Claude / ChatGPT 订阅 |
| 本地 3D | Blender 插件在本机生成资产 |
| 三平台 | Windows、macOS、Linux 都有包 |

| 需要注意 | 说明 |
|---|---|
| 早期预览 | 功能与项目格式会变 |
| 依赖模型账号 | 订阅或本地显存至少要有一样 |
| Windows 未签名 | 首次安装要手动放行 |
| macOS 仅 Apple Silicon | Intel Mac 没有官方包 |
| 生成资产质量不稳 | 仍要人工筛选与调整 |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
if [ "$(uname -s)" = "Darwin" ]; then url=https://github.com/genex-games/genex-desktop/releases/download/v0.1.25/Genex-darwin-arm64-0.1.25.zip ; want=159224bd67204df1af35fd89f3e7dc33c667cbc64307d5f2eeda580132b426ba ; file=Genex.zip ; elif [ "$(uname -s)" = "Linux" ]; then url=https://github.com/genex-games/genex-desktop/releases/download/v0.1.25/Genex-linux-amd64.deb ; want=e1a3df34dea2164b444b306c4cdc8f92d2b20fd1658458615b2ffe3e131fc298 ; file=genex.deb ; else echo "Windows 请使用 PowerShell 步骤下载安装包"; exit 1 ; fi
curl -fL -o "$file" "$url"
if [ "$file" = "genex.deb" ]; then echo "$want  $file" | sha256sum -c - ; sudo dpkg -i "$file" || sudo apt-get install -f -y ; else echo "$want  $file" | shasum -a 256 -c - ; unzip -o "$file" ; echo "解压完成：打开 Genex.app" ; fi
```

安装包来源：[https://github.com/genex-games/genex-desktop/releases/tag/v0.1.25](https://github.com/genex-games/genex-desktop/releases/tag/v0.1.25)

## 验证状态

| 场景 | 状态 |
|---|---|
| Release v0.1.25 的 Windows / macOS / Linux 安装包与 SHA256 digest 已核对 | 已核对 2026-10-28 |
| README 确认订阅 / 本地模型两种用法与三平台安装包 | 已核对 2026-10-28 |
| 未实测安装与生成（安装包 120–290 MB，需要模型账号） | 说明 2026-10-28 |
| 非目标宿主调用被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-28 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Genex 通过自身的工具路由与插件扩展能力接入外部服务，不含通用 MCP server；本仓库的 MCP 只提供安装步骤与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\genex-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装包怎么选

| 平台 | 文件 |
|---|---|
| Windows x64（预览） | `Genex-Setup.exe` |
| macOS Apple Silicon | `Genex.dmg` 或 `Genex-darwin-arm64-0.1.25.zip` |
| Linux x64 | `.deb` / `.rpm` / `.zip` |

## 第一次使用

1. 打开 Genex，选择模型来源：Claude Code 订阅、ChatGPT 订阅，或本地模型
2. 新建项目，描述想做的玩法与美术风格
3. 让主 Agent 拆任务，worker 写代码、reviewer 检查
4. 需要 3D 资产时启用 Blender 插件，或接 Meshy / Tripo
5. 从项目里导出到 Unreal、Godot 或发布到 Web

## 注意

- 项目还在早期预览，遇到问题先看 issues
- 本地模型需要足够显存；订阅模式消耗对应账号额度
- Windows 安装包未签名，SmartScreen 提示时选「更多信息 → 仍要运行」

> ⚠️ 只用自己有权限的模型账号与素材；生成资产商用前确认模型服务条款。

## 常见坑

- Windows 提示已保护电脑：选「更多信息 → 仍要运行」
- 登录后不能用：确认订阅有效，或切到本地模型
- 本地模型很慢：换更小模型，或改用订阅模式
- Blender 插件不生效：确认本机 Blender 版本与插件匹配
- 导出失败：先在同项目里跑一次预览，确认资源路径完整
- 项目打不开：早期版本格式会变，保留旧版本安装包

## 免责声明

本仓库为第三方指南，与 Genex 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://github.com/genex-games/genex-desktop/blob/main/README.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
