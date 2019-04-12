#if USE_UNI_LUA
using LuaAPI = UniLua.Lua;
using RealStatePtr = UniLua.ILuaState;
using LuaCSFunction = UniLua.CSharpFunctionDelegate;
#else
using LuaAPI = XLua.LuaDLL.Lua;
using RealStatePtr = System.IntPtr;
using LuaCSFunction = XLua.LuaDLL.lua_CSFunction;
#endif

using XLua;
using System.Collections.Generic;


namespace XLua.CSObjectWrap
{
    using Utils = XLua.Utils;
    public class LuaValueInfoWrap 
    {
        public static void __Register(RealStatePtr L)
        {
			ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			System.Type type = typeof(LuaValueInfo);
			Utils.BeginObjectRegister(type, L, translator, 0, 0, 4, 4);
			
			
			
			Utils.RegisterFunc(L, Utils.GETTER_IDX, "name", _g_get_name);
            Utils.RegisterFunc(L, Utils.GETTER_IDX, "valueType", _g_get_valueType);
            Utils.RegisterFunc(L, Utils.GETTER_IDX, "valueStr", _g_get_valueStr);
            Utils.RegisterFunc(L, Utils.GETTER_IDX, "isValue", _g_get_isValue);
            
			Utils.RegisterFunc(L, Utils.SETTER_IDX, "name", _s_set_name);
            Utils.RegisterFunc(L, Utils.SETTER_IDX, "valueType", _s_set_valueType);
            Utils.RegisterFunc(L, Utils.SETTER_IDX, "valueStr", _s_set_valueStr);
            Utils.RegisterFunc(L, Utils.SETTER_IDX, "isValue", _s_set_isValue);
            
			
			Utils.EndObjectRegister(type, L, translator, null, null,
			    null, null, null);

		    Utils.BeginClassRegister(type, L, __CreateInstance, 1, 0, 0);
			
			
            
			
			
			
			Utils.EndClassRegister(type, L, translator);
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int __CreateInstance(RealStatePtr L)
        {
            
			try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
				if(LuaAPI.lua_gettop(L) == 1)
				{
					
					LuaValueInfo __cl_gen_ret = new LuaValueInfo();
					translator.Push(L, __cl_gen_ret);
                    
					return 1;
				}
				
			}
			catch(System.Exception __gen_e) {
				return LuaAPI.luaL_error(L, "c# exception:" + __gen_e);
			}
            return LuaAPI.luaL_error(L, "invalid arguments to LuaValueInfo constructor!");
            
        }
        
		
        
		
        
        
        
        
        
        
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _g_get_name(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                LuaValueInfo __cl_gen_to_be_invoked = (LuaValueInfo)translator.FastGetCSObj(L, 1);
                LuaAPI.lua_pushstring(L, __cl_gen_to_be_invoked.name);
            } catch(System.Exception __gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + __gen_e);
            }
            return 1;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _g_get_valueType(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                LuaValueInfo __cl_gen_to_be_invoked = (LuaValueInfo)translator.FastGetCSObj(L, 1);
                LuaAPI.lua_pushstring(L, __cl_gen_to_be_invoked.valueType);
            } catch(System.Exception __gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + __gen_e);
            }
            return 1;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _g_get_valueStr(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                LuaValueInfo __cl_gen_to_be_invoked = (LuaValueInfo)translator.FastGetCSObj(L, 1);
                LuaAPI.lua_pushstring(L, __cl_gen_to_be_invoked.valueStr);
            } catch(System.Exception __gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + __gen_e);
            }
            return 1;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _g_get_isValue(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                LuaValueInfo __cl_gen_to_be_invoked = (LuaValueInfo)translator.FastGetCSObj(L, 1);
                LuaAPI.lua_pushboolean(L, __cl_gen_to_be_invoked.isValue);
            } catch(System.Exception __gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + __gen_e);
            }
            return 1;
        }
        
        
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _s_set_name(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                LuaValueInfo __cl_gen_to_be_invoked = (LuaValueInfo)translator.FastGetCSObj(L, 1);
                __cl_gen_to_be_invoked.name = LuaAPI.lua_tostring(L, 2);
            
            } catch(System.Exception __gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + __gen_e);
            }
            return 0;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _s_set_valueType(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                LuaValueInfo __cl_gen_to_be_invoked = (LuaValueInfo)translator.FastGetCSObj(L, 1);
                __cl_gen_to_be_invoked.valueType = LuaAPI.lua_tostring(L, 2);
            
            } catch(System.Exception __gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + __gen_e);
            }
            return 0;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _s_set_valueStr(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                LuaValueInfo __cl_gen_to_be_invoked = (LuaValueInfo)translator.FastGetCSObj(L, 1);
                __cl_gen_to_be_invoked.valueStr = LuaAPI.lua_tostring(L, 2);
            
            } catch(System.Exception __gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + __gen_e);
            }
            return 0;
        }
        
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        static int _s_set_isValue(RealStatePtr L)
        {
		    try {
                ObjectTranslator translator = ObjectTranslatorPool.Instance.Find(L);
			
                LuaValueInfo __cl_gen_to_be_invoked = (LuaValueInfo)translator.FastGetCSObj(L, 1);
                __cl_gen_to_be_invoked.isValue = LuaAPI.lua_toboolean(L, 2);
            
            } catch(System.Exception __gen_e) {
                return LuaAPI.luaL_error(L, "c# exception:" + __gen_e);
            }
            return 0;
        }
        
		
		
		
		
    }
}
