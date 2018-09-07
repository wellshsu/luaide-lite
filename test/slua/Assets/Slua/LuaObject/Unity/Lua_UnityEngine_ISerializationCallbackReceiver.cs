using System;
using SLua;
using System.Collections.Generic;
[UnityEngine.Scripting.Preserve]
public class Lua_UnityEngine_ISerializationCallbackReceiver : LuaObject {
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int OnBeforeSerialize(IntPtr l) {
		try {
			UnityEngine.ISerializationCallbackReceiver self=(UnityEngine.ISerializationCallbackReceiver)checkSelf(l);
			self.OnBeforeSerialize();
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int OnAfterDeserialize(IntPtr l) {
		try {
			UnityEngine.ISerializationCallbackReceiver self=(UnityEngine.ISerializationCallbackReceiver)checkSelf(l);
			self.OnAfterDeserialize();
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[UnityEngine.Scripting.Preserve]
	static public void reg(IntPtr l) {
		getTypeTable(l,"UnityEngine.ISerializationCallbackReceiver");
		addMember(l,OnBeforeSerialize);
		addMember(l,OnAfterDeserialize);
		createTypeMetatable(l,null, typeof(UnityEngine.ISerializationCallbackReceiver));
	}
}
