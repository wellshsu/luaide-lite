# luaide-lite
[![](https://vsmarketplacebadge.apphb.com/version-short/wellshsu.luaide-lite.svg?style=flat-square)](https://marketplace.visualstudio.com/items?itemName=wellshsu.luaide-lite)
[![](https://vsmarketplacebadge.apphb.com/installs-short/wellshsu.luaide-lite.svg?style=flat-square)](https://marketplace.visualstudio.com/items?itemName=wellshsu.luaide-lite)
[![](https://vsmarketplacebadge.apphb.com/rating-short/wellshsu.luaide-lite.svg?style=flat-square)](https://marketplace.visualstudio.com/items?itemName=wellshsu.luaide-lite)
* Author: Wells Hsu
* Email: wellshsu@outlook.com
* **QQ群: 952522807 (仅供交流学习，原621598820已失效)**
* Github: https://github.com/hsu2017/luaide-lite

# Features | 功能特性
* **legacy的解析库不再维护(推介使用emmy), debug和format会继续维护.**

## 【代码编写】
* **标准格式化: 与 IntelliJ IDEA 平台的 EmmyLua 格式化结果一致, 参考VS的格式化标准, 大文件格式化更快.**
* 批量格式化: 选中文件/文件夹, 点击'Lua/Format File(s)'以格式化这些文件.
* 代码注解: 引用自 EmmyLua, 使用参考 https://emmylua.github.io/annotation.html
* 智能提示: 支持查找引用, 重构, 定义跳转, 文件符号, 变量颜色高亮等.

## 【代码调试】
* 多平台调试: 支持cocos, lua51, tolua, slua, xlua 等, 调试示例在群文件或Github中下载, 环境配置请参考各示例的README.md文件.
* 单文件调试: 支持使用Lua51调试demo.
* **条件断点: 支持设置表达式以及断点次数.**

## 【辅助功能】
* 解析库切换: 设置 'luaide-lite.core' 以指定代码解析工具, **emmy-使用emmylua库解析工程(推介使用)**, legacy-使用既有版本解析工程(不再维护).
* **To Typescript: 将Lua代码转换为Typescript.**
* 模板文件: 在设置中添加 'templateDir' 和 'templateDefine' 以指定模板文件目录以及全局文本替换字段, 在工程结构目录右键选择 'Lua/New Template' 以创建模板文件.

# FAQ | 常见问题
* 插件是否会持续更新?
    * 插件不定期更新, **其中legacy的解析库不再维护(推介使用emmy), debug和format会继续维护**, 有严重问题的可以告知我, 我会尽量安排时间修复.
* 插件不流畅以及符号重复定义如何解决?
    * 请检查一下插件列表, 确保其他lua插件是禁用的.
* 工程有很多解析异常的文件怎么解决?
    * 由于新版本vscode会将有错误的文件标记为红色, 导致部分同学的工程有很多报错, 目前已经修复大部分解析问题, 如果代码分析还存在问题, 你可以设置 "luaide-lite.enableDiagnostic" = false 直接禁用代码分析.
* 较大的工程占用很多内存怎么办?
    * 插件在内存这方面还没有做优化, 你可以通过设置 'luaide-lite.exclude' 该选项以忽略不常用的文件(夹), 同时支持lagacy和emmy两种模式.
* 是否有使用教程?
    * 插件没有使用教程, 但是有示例工程, 包含cocos, lua51, tolua, slua, xlua 等, 在群文件或Github中下载.
* 是否支持luajit调试?
    * 支持, 在你的lua工程里面引用LuaDebug.lua即可, 其他的参考示例工程.
* 网狐框架或其他Cocos-lua游戏无法调试?
    * https://www.jianshu.com/p/bcf94dcac9dd?tdsourcetag=s_pcqq_aiomsg, 在AppDelegate.cpp->register_all_packages注册luaopen_lua_extensions_cjson(tolua_S);
   
# Fulllist | 完整列表
* 标准格式化: [稳定] 与 IntelliJ IDEA 平台的 EmmyLua 格式化结果一致, 参考VS的格式化标准, 设置'enableFormat'以启用或禁用格式化, 你可以选择其他的格式化库, 例如vscode-lua.
* 远程调试: [稳定][继承] 使用Socket传送断点数据, 调试示例在群文件或Github中下载, 包含cocos, lua51, tolua, slua, xlua 等, 环境配置请参考各示例的README.md文件.
* 代码检查: [稳定][继承] 标准的代码检查.
* 智能代码提示: [稳定][继承] 代码片段, 代码完成提示, 全局提示, 定义跳转.
* 注解: [稳定][继承] 引用自 EmmyLua and LDoc.
* 全局高亮: [稳定][继承] 将全局变量高亮显示, 代码编辑时对全局变量更敏感, 设置中的'enableHighlight'等可以选择是否启用高亮以及设置高亮颜色.
* 批量格式化: [稳定] 选中文件/文件夹, 点击'Lua/Format File(s)'以格式化这些文件.
* 查找所有引用: [稳定][继承] 选中代码片段 Alt + F2 或 右键 Fild All References.
* 代码重构: [稳定][继承] 选中代码片段Ctrl + R + R 重命名所有文件中相关的标识符.
* 模板文件: [稳定] 你可以在设置中添加 'templateDir' 和 'templateDefine' 以指定模板文件目录以及全局文本替换字段, 在工程结构目录右键选择 'Lua/New Template' 以创建模板文件.
* 单文件调试: [稳定] 支持使用Lua51调试demo.
* 条件断点: [稳定] 支持设置表达式以及断点次数.
* Standard Code Format: [Stable] Same format result between luaide-lite and EmmyLua.
* Remote Debug: [Stable][Legacy] Use socket to transfer breakinfo.
* Code Check: [Stable][Legacy] Standard lua code check.
* Smart Code: [Stable] Snippets, Syntaxes, Hint.
* Annotation: [Stable][Legacy] Refers from EmmyLua and LDoc.
* _G Highlight: [Stable][Legacy] Highlight global vars.
* Reformat Code: [Stable] Batch format files.
* Find All References: [Stable][Legacy] Find references from all files.
* Refactor Code: [Stable][Legacy] Rename all relative symbols.
* Template: [Stable] 'templateDir' and 'templateDefine' are supported in settings, focus project explorer and right click then use 'Lua/New Template' to create template file.
* Lua51 Debug: [Stable] support use lua51 to debug single demo.
* Conditional breakpoint: [Stable] support expression and hit count.

# [See Changelog] | 详细请查阅版本记录
## 0.2.4 [2020.07.22] 
* 修复 kill("SIGUP") 导致的异常.
* Fix kill("SIGUP") exception.

## 0.2.2-0.2.3 [2020.07.07] 
* **新增输入 '---@xxxx ' 触发代码补全功能(triggerSuggest).**
* 优化 '---@xxxx ' 的匹配规则.
* Trigger code suggest when input '---@xxxx '.
* Optimize '---@xxxx ' match regulation.

## 0.2.1 [2020.07.07] 
* 新增 'luaide-lite.formatUseTab' 设置, 控制是否使用tab来缩进代码, 默认关闭.
* **更新 emmy 的解析库.**
* **修复调试时快速按F10跳下一步逻辑异常(无响应).**
* **新增 'luaide-lite.apiFolders' 设置, 支持指定 emmy api 文件目录.**
* 优化 Snippets.json 文件, 区分 emmy 和 legacy.
* Add 'luaide-lite.formatUseTab', default is false.
* Update emmy library.
* Fix step next error(unresponsive).
* Add 'luaide-lite.apiFolders' for emmy api lint.
* Optimize Snippets.json file.

## 0.2.0 [2019.04.12]
* 修复在 VSCode ^1.33.0 以上版本调试闪退问题.
* Fix debugserver crash on VSCode ^1.33.0.

## 0.1.9 [2019.03.20]
* 新增 'luaide-lite.showWeather' 设置, 默认关闭天气功能.
* 新增 'luaide-lite.debugLanguageServer' 设置, 是否调试LSP(面向开发者), 默认关闭.
* 修改 README.md
* Add 'luaide-lite.showWeather', default is false.
* Add 'luaide-lite.debugLanguageServer', default is false.
* Modify README.md

## 0.1.8 [2019.03.19]
* 修复调试堆栈显示错误问题(常发生于同文件内F10跳转).
* 优化 'luaide-lite.exclude' 设置, 同时支持lagacy和emmy两种模式, 如果内存占用过高请设置该选项以忽略不常用的文件(夹).
* 优化 'Legacy' 代码结构, 方便有兴趣的同学学习, 后续将继续梳理代码结构.
* 新增天气显示.
* Fix incorrect stacktrace request.
* Optimize 'luaide-lite.exclude', support legacy and emmy mode.
* Optimize 'Legacy' code structure.
* Add weather feature.

## 0.1.7 [2019.01.31]
* 新增 'luaide-lite.core' 设置, 你可以指定不同版本的代码解析工具, emmy-使用emmylua库解析工程, legacy-使用既有版本解析工程.
* 修改插件图标, 增加辨识度.
* Add 'luaide-lite.core', use it to translate lua to typescript.
* Modify plugin's logo.

## 0.1.6 [2018.05.22]
* 新增 'To Typescript' 转换功能, 你可以使用此功能将Lua代码转换为Typescript.
* 紧急修复在 VSCode 最新版本 1.28.0 上无法查看堆栈的问题.
* Add 'To Typescript', use it to translate lua to typescript.
* Fix stacktrace request doesn't work on VSCode 1.28.0.

## 0.1.5 [2018.03.23]
* 修改匿名方法名称 TempFun_line_start -> Anonymous(line:start).
* 修复外部文本编辑器修改工程文本时, 变量高亮颜色没有及时刷新的问题.
* 修复修改配置文件(settings.json)不会即时生效的问题.
* 修复 'func() [key]' 格式化问题.
* 修复 table 构造时 'function() end;' 解析异常问题.
* 修复 'a()[b] = c' 解析异常问题.
* 修复 'a:b()[c(d)] = e' 解析异常问题.
* Modify anonymous function, TempFun_line_start -> Anonymous(line:start).
* Fix incorrect highlight _G issue when document was modified by external editor.
* Fix modify settings.json doesn't work until restart workspace.
* Fix format issue on 'func() [key]'.
* Fix parse issue on 'function() end;' in table define.
* Fix parse issue on 'a()[b] = c'.
* Fix parse issue on 'a:b()[c(d)] = e'.

## 0.1.4 [2018.03.10]
* 新增解析文件的进度显示, 方便开发大型项目的同学查看.
* 新增打印日志时前缀日期时间, 在launch.json中设置printDate = true.
* 新增 "luaide-lite.enableDiagnostic" , 指定该设置可以启用或关闭代码错误分析.
* 修复 'local a, b;' , 'self:a().b[c] = d' 复杂赋值解析错误问题.
* 修复新增方法无法提示或跳转定义的问题.
* 修复Table定义会跳转至Function定义的问题.
* Add parse file progress display.
* Add datetime when print log, set printDate = true in launch.json.
* Add "luaide-lite.enableDiagnostic" for enable code diagnostic.
* Fix 'local a, b;' , 'self:a().b[c] = d' complicated assignment parse error.
* Fix new function doesn't have hint or can not go to define issue.
* Fix incorrect table define issue.

## 0.1.3 [2018.02.11]
* 新增 Unity LuaBehaviour 模板文件.
* 新增创建完模板文件之后打开编辑.
* 新增 "luaide-lite.exclude" , 指定该设置以排除文件或文件夹.
* 新增 "luaide-lite.formatHex" , 指定该设置以选择格式化时是否转换十六进制数为十进制数.
* 新增 "luaide-lite.numberRadix" , 指定该设置以选择是否在调试时显示二进制, 十进制, 十六进制等, 方便服务器同学调试使用.
* 修复调试时鼠标hover数字常量时显示nil的问题.
* 优化调试时'EADDRINUSE'端口占用, 自动关闭上一个调试会话.
* 移除顶部加入QQ群(621598820)的提示.
* Add Unity LuaBehaviour template file.
* Add Open edit when created template file.
* Add "luaide-lite.exclude" for excluding specific file(s) or folder(s).
* Add "luaide-lite.formatHex" for choosing whether convert hex to decimal.
* Add "luaide-lite.numberRadix" for displaying number radix when debug number value.
* Fix debug const number display nil while mouse is hovering.
* Optimize 'EADDRINUSE' when debug port is busy, close last debug session automatically.
* Remove join QQ Group(621598820) hint.

## 0.1.2 [2018.02.08]
* 紧急修复在 VSCode 最新版本 1.20.0 上禁用断点依然会命中的问题, 经验证, 新版本的vscode路径盘符有时是大写的有时是小写的.
* 修复在 Win7 以及 OS X 上断点次数无效的问题, 经验证这是vscode的问题, 已经反馈至官方.
* 修复F5跳到下一个断点时, print无法输出至控制台的问题.
* 校正若干README.md和CHANGELOG.md中的表达错误.
* Fix disable break point doesn't work on VSCode 1.20.0.
* Fix hit count doesn't work on Win7 and OS X, it's caused by a vscode issue.
* Fix can not print log to console when press F5 continue next break point.
* Correct many incorrect expressions in README.md and CHANGELOG.md.

## 0.1.1 [2018.02.04]
* 新增条件断点, 支持设置表达式以及断点次数, 需要替换'LuaDebug.lua'(右键'Lua/Open Res' 打开debug/adapter目录).
* 修复Cocos调试时, commandLine参数解析问题, string -> array, 将字符串改成了数组.
* 修复若干LuaDebug的潜在问题, 合并两种LuaDebug, 不再区分jit.
* 修复在 OS X 上使用Lua51调试时提示权限错误的问题.
* 完整的 OS X 测试用例, 工作环境为Mac的同学可以放心使用. 
* Add conditional breakpoint, support expression and hit count, need replace 'LuaDebug.lua'(right click 'Lua/Open Res' and open debug/adapter).
* Fix incorrect commandLine type issue, string -> array.
* Fix some potential LuaDebug.lua issues, luadebug and luadebugjit has been merged.
* Fix permission deny issue when debug on OS X.
* Complete test on OS X, it works fine on Mac. 

## 0.1.0 [2018.01.29]
* 修复Cocos调试黑屏的问题, 新增参数commandLine, 兼容mainFile 和 commandLine 两种模式运行Cocos.
* 请使用0.3.7 'LuaDebug.lua' 的同学右键 'Lua/Open Res' 打开资源目录, 'LuaDebug.lua' 文件在 'debug/adapter'目录下, 否则调试会乱码.
* Fix cocos debug crash issue, add new arg 'commandLine', 'mainFile' is also support for debug on Cocos.
* If you are using 0.3.7 'LuaDebug.lua', please use 'Lua/Open Res' to open res folder, 'LuaDebug.lua' is located in 'debug/adapter'.

## 0.0.9 [2018.01.26]
* 修复调试控制台输出base64乱码问题.
* 修复转义字符导致文件整体无法被格式化的问题, 例如 '\n', '\t', '\\' 等.
* 新增对控制台输出类型的支持.
* 新增对Lua51调试的支持.
* 新增右键 'Lua/Open Res' 打开资源目录, 后续版本的LuaDebug.lua以及其他工具都会放在该目录下.
* Fix console print base64 encode issue.
* Fix escape char format error such as '\n', '\t', '\\' etc.
* Add print type to console support.
* Add lua51 debug support.
* Add 'Lua/Open Res' to open res folder, LuaDebug.lua and other tools will be in this foler.

## 0.0.8 [2018.01.24]
* 修复Launch调试Cocos时, 点击 ■ 停止调试无法关闭Cocos模拟器的问题.
* 修复关掉Cosos模拟器, 端口占用等调试服务器异常时主动关闭调试会话.
* 修改每天只显示一次进群广告.
* Fix can not shutdown cocos simulator issue.
* Fix auto close debug session when shutdown cocos simulator or some other debug server error occured.
* Only show 'join QQ Group' once every single day.

# Diff with kangping.luaide | 和kangping.luaide的差异
* 修复若干格式化的问题.
* 修复源码在vscode1.19.0上编译错误.
* 移除在线统计, 登录模块.
* 移除 'luaide.utils.createFunction' 等其他创建模板的选项.
* 简化设置, 移除 'luaide.isShowDest', 'luaide.scriptRoots', 'luaide.maxFileSize', 'luaide.showOnLine' 等设置.
* 简化调试设置.
* 新的名字 'luaide-lite' 以及新的Icon.
* 新的注解方式, 引用自 EmmyLua and LDoc.
* 标准代码解析提示: 'unexcepted token', 'uncomplete function', 等.
* 优化代码解析: 只在判断代码块完成时重新解析代码, 提升效率.
* 新增设置 'luaide-lite.highlight' 控制是否启用代码高亮，其他设置如 高亮颜色, 关闭格式化详见工作区设置.
* 新增编辑器上下文: 在文件/夹处右键, 选择 'Lua/Format File(s)' 以批量格式化文件/夹.
* 优化Unity工作流程.
* Fix many format bugs. 
* Fix compile error on vscode 1.19.0.
* Remove online module.
* Remove 'luaide.utils.createFunction' and other template options.
* Simplify settings, remove 'luaide.isShowDest', 'luaide.scriptRoots', 'luaide.maxFileSize', 'luaide.showOnLine' and etc.
* Simplify debug settings.
* New name 'luaide-lite' and new icon.
* New annotation refers from EmmyLua and LDoc.
* Standard code check hint: 'unexcepted token', 'uncomplete function', etc.
* Optimize code check: only check when code block is completed.
* New setting 'luaide-lite.highlight' to ctrl whether highlight global vars.
* New context 'Explorer/Reformat Code' to batch format files.
* Optimize Unity workflow. 

# luaide -> luaide-lite || EmmyLua
* 卸载 luaide 插件, 安装 vscode-lua 插件, 在工作区设置 "lua.format.lineWidth": 2000.
* 使用 vscode-lua 格式化所有lua文件, 确保所有lua文件被正确的格式化.
* 卸载 vscode-lua 插件, 在工作区中删除 "lua.format.lineWidth": 2000.
* 然后你可以使用vscode或者idea编辑lua文件, 并且两个插件的格式化结果是一致的.
* 插件操作如下:
* 假设你已经安装了 luaide-lite, 在文件/夹处右键, 选择 'Lua/Format File(s)' 以批量格式化文件/夹, 确保所有lua文件被正确的格式化.
* 安装 IntelliJ IDEA 社区版, 在idea中安装 EmmyLua 插件.
* 前往 IntelliJ IDEA Settings-> Editor -> Code Style -> Lua 设置如下:
    [Tabs and Indents]
        '☒Use tab character', '☒Keep indents on empty lines'
        'Tab size: 4', 'Indent: 4', 'Condition indent: 0'
    [Spaces]
        '☑Assignment Operators', '☒Before comma', '☑After comma', '☑After field sep'
    [Wrapping and Braces]
        '☑Simple blocks in one line', '☒Method declaration parameters'
        '☒Method call arguments', '☒Group declarations', '☒Table'
* Uninstall luaide, install vscode-lua ex, set "lua.format.lineWidth": 2000 in workspace settings.
* Use vscode-lua to format all lua files that ensures lua file are formated totally.
* Uninstall vscode-lua ex, delete "lua.format.lineWidth": 2000 in workspace settings.
* Then you can use vscode or idea to edit lua file, format lua file will get same result.
* Detail is here:
* Install luaide-lite, use Lua/Format File(s) to format all files that ensures lua files are formated completely.
* Install IntelliJ IDEA, install EmmyLua ex in idea.
* Go to IntelliJ IDEA Settings-> Editor -> Code Style -> Lua
    [Tabs and Indents]
        '☒Use tab character', '☒Keep indents on empty lines'
        'Tab size: 4', 'Indent: 4', 'Condition indent: 0'
    [Spaces]
        '☑Assignment Operators', '☒Before comma', '☑After comma', '☑After field sep'
    [Wrapping and Braces]
        '☑Simple blocks in one line', '☒Method declaration parameters'
        '☒Method call arguments', '☒Group declarations', '☒Table'

# Known Issues | 已知问题
* 条件断点和断点次数会有冲突, 不能同时使用, 后续版本会优化.
* 格式化错误:
    'a = {function() end }
     b = function()
     if c then end
     end'.
* 'a = {
     -- comment
     b = 1,
    }'
   这样的格式再EmmyLua是不支持的, 请使用 '---'.
* EmmyLua 不会剔除文本的最后一个空格字符.
* luaide-lite 将不会被格式化 第一行如果是 \n(换行符) 的文本.
* if con then -- comment
   end
   在EmmyLua中该注释会被移到下一行
* for    i = 0, 10 do : luaide-lite中空格字符如果超过4个将不会被格式化.
* '-- comment   ' luaide-lite不会把注释后面的空格符移除.
* array[1] [2] EmmyLua不会格式化二维数组, 但是luaide-lite会将其正确格式化.
* UTF8 BOM 内容文本 不会被格式化, 请使用 'Lua/Format File(s)' 将其转换成 UFT8 格式.
* expression and hit count is conflicting.
* Format error on
    'a = {function() end }
     b = function()
     if c then end
     end'.
* 'a = {
     -- comment
     b = 1,
    }'
   is not support in EmmyLua, please use '---'.
* EmmyLua dosen't slice last space char at file end.
* First char is \n in file might not be formated in luaide-lite.
* if con then -- comment
   end
   the comment will be move to a newline.
* for    i = 0, 10 do the space char will not be formated when count >= 4 in luaide-lite.
* '-- comment   ' the space char after comment will not be removed in luaide-lite.
* array[1] [2] will not be formated in EmmyLua but luaide-lite will do.
* UTF8 BOM content will not be formated, please use 'Lua/Format File(s)' to convert to UFT8.

# Ref | 引用
* Emoji: http://www.fhdq.net/
* VSCode: https://code.visualstudio.com/docs
* LDoc: https://github.com/stevedonovan/LDoc
* rd: https://www.npmjs.com/package/rd
* Markdown: https://www.jianshu.com/p/82e730892d42
* debug: http://www.runoob.com/lua/lua-debug.html
* debug2: https://wiki.garrysmod.com/page/debug/
* escape: https://www.cnblogs.com/zhangyfr/p/7207799.html
* tolua: https://github.com/topameng/tolua
* slua: https://github.com/pangweiwei/slua
* xlua: https://github.com/Tencent/xLua
* lua51: http://www.lua.org/manual/5.1/
* EmmyLua: https://emmylua.github.io/
* kangping.luaide: https://github.com/k0204/LuaIde/

# For Developer | 开发者
* npm install
* npm install -g vsce
* vsce package
* vsce login wellshsu
* vsce publish
* vsce unpublish (publisher name).(extension name)
* code --install-extension luaide-lite-0.2.4.vsix
* https://marketplace.visualstudio.com/manage/
* https://code.visualstudio.com/api/working-with-extensions/bundling-extension