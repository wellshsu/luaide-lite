using System;
using SLua;
using System.Collections.Generic;
[UnityEngine.Scripting.Preserve]
public class Lua_UnityEngine_ILogHandler : LuaObject {
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int LogFormat(IntPtr l) {
		try {
			UnityEngine.ILogHandler self=(UnityEngine.ILogHandler)checkSelf(l);
			UnityEngine.LogType a1;
			checkEnum(l,2,out a1);
			UnityEngine.Object a2;
			checkType(l,3,out a2);
			System.String a3;
			checkType(l,4,out a3);
			System.Object[] a4;
			checkParams(l,5,out a4);
			self.LogFormat(a1,a2,a3,a4);
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int LogException(IntPtr l) {
		try {
			UnityEngine.ILogHandler self=(UnityEngine.ILogHandler)checkSelf(l);
			System.Exception a1;
			checkType(l,2,out a1);
			UnityEngine.Object a2;
			checkType(l,3,out a2);
			self.LogException(a1,a2);
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[UnityEngine.Scripting.Preserve]
	static public void reg(IntPtr l) {
		getTypeTable(l,"UnityEngine.ILogHandler");
		addMember(l,LogFormat);
		addMember(l,LogException);
		createTypeMetatable(l,null, typeof(UnityEngine.ILogHandler));
	}
}
