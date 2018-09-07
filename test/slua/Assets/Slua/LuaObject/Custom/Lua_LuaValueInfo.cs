using System;
using SLua;
using System.Collections.Generic;
[UnityEngine.Scripting.Preserve]
public class Lua_LuaValueInfo : LuaObject {
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int constructor(IntPtr l) {
		try {
			LuaValueInfo o;
			o=new LuaValueInfo();
			pushValue(l,true);
			pushValue(l,o);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int get_name(IntPtr l) {
		try {
			LuaValueInfo self=(LuaValueInfo)checkSelf(l);
			pushValue(l,true);
			pushValue(l,self.name);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int set_name(IntPtr l) {
		try {
			LuaValueInfo self=(LuaValueInfo)checkSelf(l);
			System.String v;
			checkType(l,2,out v);
			self.name=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int get_valueType(IntPtr l) {
		try {
			LuaValueInfo self=(LuaValueInfo)checkSelf(l);
			pushValue(l,true);
			pushValue(l,self.valueType);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int set_valueType(IntPtr l) {
		try {
			LuaValueInfo self=(LuaValueInfo)checkSelf(l);
			System.String v;
			checkType(l,2,out v);
			self.valueType=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int get_valueStr(IntPtr l) {
		try {
			LuaValueInfo self=(LuaValueInfo)checkSelf(l);
			pushValue(l,true);
			pushValue(l,self.valueStr);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int set_valueStr(IntPtr l) {
		try {
			LuaValueInfo self=(LuaValueInfo)checkSelf(l);
			System.String v;
			checkType(l,2,out v);
			self.valueStr=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int get_isValue(IntPtr l) {
		try {
			LuaValueInfo self=(LuaValueInfo)checkSelf(l);
			pushValue(l,true);
			pushValue(l,self.isValue);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int set_isValue(IntPtr l) {
		try {
			LuaValueInfo self=(LuaValueInfo)checkSelf(l);
			System.Boolean v;
			checkType(l,2,out v);
			self.isValue=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[UnityEngine.Scripting.Preserve]
	static public void reg(IntPtr l) {
		getTypeTable(l,"LuaValueInfo");
		addMember(l,"name",get_name,set_name,true);
		addMember(l,"valueType",get_valueType,set_valueType,true);
		addMember(l,"valueStr",get_valueStr,set_valueStr,true);
		addMember(l,"isValue",get_isValue,set_isValue,true);
		createTypeMetatable(l,constructor, typeof(LuaValueInfo));
	}
}
