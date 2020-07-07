# 0.2.2-0.2.3 [2020.07.07] 
* **新增输入 '---@xxxx ' 触发代码补全功能(triggerSuggest).**
* 优化 '---@xxxx ' 的匹配规则.
* Trigger code suggest when input '---@xxxx '.
* Optimize '---@xxxx ' match regulation.

# 0.2.1 [2020.07.07] 
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

# 0.2.0 [2019.04.12]
* 修复在 VSCode ^1.33.0 以上版本调试闪退问题.
* Fix debugserver crash on VSCode ^1.33.0.

# 0.1.9 [2019.03.20]
* 新增 'luaide-lite.showWeather' 设置, 默认关闭天气功能.
* 新增 'luaide-lite.debugLanguageServer' 设置, 是否调试LSP(面向开发者), 默认关闭.
* 修改 README.md
* Add 'luaide-lite.showWeather', default is false.
* Add 'luaide-lite.debugLanguageServer', default is false.
* Modify README.md

# 0.1.8 [2019.03.19]
* 修复调试堆栈显示错误问题(常发生于同文件内F10跳转).
* 优化 'luaide-lite.exclude' 设置, 同时支持lagacy和emmy两种模式, 如果内存占用过高请设置该选项以忽略不常用的文件(夹).
* 优化 'Legacy' 代码结构, 方便有兴趣的同学学习, 后续将继续梳理代码结构.
* 新增天气显示.
* Fix incorrect stacktrace request.
* Optimize 'luaide-lite.exclude', support legacy and emmy mode.
* Optimize 'Legacy' code structure.
* Add weather feature.

# 0.1.7 [2019.01.31]
* 新增 'luaide-lite.core' 设置, 你可以指定不同版本的代码解析工具, emmy-使用emmylua库解析工程, legacy-使用既有版本解析工程.
* 修改插件图标, 增加辨识度.
* Add 'luaide-lite.core', use it to translate lua to typescript.
* Modify plugin's logo.

# 0.1.6 [2018.05.22]
* 新增 'To Typescript' 转换功能, 你可以使用此功能将Lua代码转换为Typescript.
* 紧急修复在 VSCode 最新版本 1.28.0 上无法查看堆栈的问题.
* Add 'To Typescript', use it to translate lua to typescript.
* Fix stacktrace request doesn't work on VSCode 1.28.0.

# 0.1.5 [2018.03.23]
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

# 0.1.4 [2018.03.10]
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

# 0.1.3 [2018.02.11]
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

# 0.1.2 [2018.02.08]
* 紧急修复在 vscode 最新版本 1.20.0 上禁用断点依然会命中的问题, 经验证, 新版本的vscode路径盘符有时是大写的有时是小写的.
* 修复在 Win7 以及 OS X 上断点次数无效的问题, 经验证这是vscode的问题, 已经反馈至官方.
* 修复F5跳到下一个断点时, print无法输出至控制台的问题.
* 校正若干README.md和CHANGELOG.md中的表达错误.
* Fix disable break point doesn't work on vscode 1.20.0.
* Fix hit count doesn't work on Win7 and OS X, it's caused by a vscode issue.
* Fix can not print log to console when press F5 continue next break point.
* Correct many incorrect expressions in README.md and CHANGELOG.md.

# 0.1.1 [2018.02.04]
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

# 0.1.0 [2018.01.29]
* 修复Cocos调试黑屏的问题, 新增参数commandLine, 兼容mainFile 和 commandLine 两种模式运行Cocos.
* 请使用0.3.7 'LuaDebug.lua' 的同学右键 'Lua/Open Res' 打开资源目录, 'LuaDebug.lua' 文件在 'debug/adapter'目录下, 否则调试会乱码.
* Fix cocos debug crash issue, add new arg 'commandLine', 'mainFile' is also support for debug on Cocos.
* If you are using 0.3.7 'LuaDebug.lua', please use 'Lua/Open Res' to open res folder, 'LuaDebug.lua' is located in 'debug/adapter'.

# 0.0.9 [2018.01.26]
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

# 0.0.8 [2018.01.24]
* 修复Launch调试Cocos时, 点击 ■ 停止调试无法关闭Cocos模拟器的问题.
* 修复关掉Cosos模拟器, 端口占用等调试服务器异常时主动关闭调试会话.
* 修改每天只显示一次进群广告.
* Fix can not shutdown cocos simulator issue.
* Fix auto close debug session when shutdown cocos simulator or some other debug server error occured.
* Only show 'join QQ Group' once every single day.

# 0.0.7 [2018.01.23]
* 修复Win10系统调试时 'Can not getExtensionPath()!' 的异常.
* 新增加入QQ群(621598820)的提示, 欢迎加入QQ群反馈问题!
* Fix 'Can not getExtensionPath()!' error when debug on Win10.
* Add QQ Group(621598820) hint, welcome to join and feedback issues.

# 0.0.6 [2018.01.22]
* 紧急修复部分定义无法跳转的问题.
* 增强定义跳转的准确度.
* Fix some symbols' define can not be peeked.
* Enhance symbol's define peeking.

# 0.0.5 [2018.01.20]
* 修复打开单个文件, 无workSpace时问题'replace is not define'.
* 修复部分不正确的高亮提示.
* 新增创建模板文件功能, 你可以在设置中添加 'templateDir' 和 'templateDefine' 以指定模板文件目录以及全局文本替换字段, 在工程结构目录右键选择 'Lua/New Template' 以创建模板文件.
* 重命名 'Reformat Code', 在工程结构目录右键选择 'Lua/Format File(s)' 以格式化选中的文件.
* 重构代码结构.
* 优化代码提示, 移除部分不必要的代码片段提示.
* 增强代码定义跳转, 支持 'this....', 'local a = Type; b = a; a.$field/$func'等.
* 修复部分引用查找结果不正确.
* 修复部分重命名冲突.
* Fix open single lua file error 'replace is not define'.
* Fix some incorrect global var highlight.
* Add create standard template file, 'templateDir' and 'templateDefine' are supported in settings, focus project explorer and right click then use 'Lua/New Template' to create template file.
* Rename 'Reformat Code' to 'Lua/Format File(s)', focus project explorer and right click then use 'Lua/Format File(s)' to format selected file(s).
* Refactor code structure.
* Optimize code completion and code snippets.
* Enhance peek define, support 'this....', 'local a = Type; b = a; a.$field/$func'
* Fix incorrect find reference result.
* Fix incorrect rename symbol result.

# 0.0.2 [2018.01.17]
* 修复 Cosos 调试错误.
* 修复内置代码片段提示错误.
* Fix Cocos debug error.
* Fix internal snippets error.

# 0.0.1 [2018.01.17]
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