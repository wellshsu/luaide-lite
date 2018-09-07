[Closed]需要支持自行计算端口
[Closed]需要支持修改相对路径的窗口名称
[Closed]变量需要支持修改
[Closed]蒙蒙蒙蒙蒙蒙牛 2018/3/26 17:21:25   就是说 报错的时候 能不能像babelua一样直接调到错误地方？跳转到错误处

[Solved]能加个看16进制的吗
[Solved]全局方法无法跳转
[Solved]调试控制台输入base64乱码问题 
[Solved]launch方式关闭客户端
[Solved]模拟器关掉，端口占用或调试服务器异常时主动关闭调试会话
[Solved]需要添加条件
[Solved]需要添加命中次数
[Solved]新增了 S2C_DebugClose
[Solved]LuaDebug.lua LoadScript 返回的结构体有问题
[Solved]LuaDebug.lua 有大量的全局变量问题
[Solved]找到问题了，是我在别的lua文件中下了断点，在这个Lua文件就没打印，就是socket那边有点问题，用Luaide是可以的，也不是这版插件的问题，上一版本也是有问题的
[Solved]就在print()这行下个断点，然后点继续运行，不会输出
[Solved]命中次数的判断有问题
[Solved]下次日志上可以加个日期

[Pending]A文件中有个全局的this, B文件跳local this 有问题
[Pending]FBCtx.MasterName = (string.len(FBCtx.MasterName) > 0 and FBCtx.MasterName) 中间的MasterName有问题
[Pending]第一次查找引用可能有问题
[Pending]local obj; obj = 1; obj = 2; 会跳转到第二个obj
[Pending]遇到个问题，我调试开了一个exe，然后双击打开个非调试的exe，调试有概率死掉
[Pending]function ZZBase64.__left1(res, index, text, len)
    res[index + 3] = "=" end
    格式化有问题

[New]quick 3.3的 "大神们，打包加密后的lua代码运行后，断点进去，大家有没有遇到过？运行日志什么的都是正常显示的",因为main.lua里的断点也能进去，就是其他目录进不去，其他目录的文件打包时做了加密
[New]只要是这种复杂结构赋值都会这样提示

蒙蒙蒙蒙蒙蒙牛 2018/3/20 14:50:16
那个跳转 可以不可以跨文件跳转
不是全局函数
(是继承的原因导致的)

King 2018/3/21 16:18:19
如果我一直刷，可以先点暂停再放开，看看这个过程中有什么日志
是不需要做这个功能还是？
如果有还是有点用处的