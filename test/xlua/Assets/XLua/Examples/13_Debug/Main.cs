using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System.IO;

public class Main : MonoBehaviour
{
    public LuaTable Table;
    public LuaFunction AwakeFunction;
    public LuaFunction StartFunction;
    public LuaFunction UpdateFunction;
    public LuaFunction OnDestroyFunction;

    void Awake()
    {
        string dir = Application.dataPath + "/XLua/Examples/13_Debug/";
        LuaEnv luaenv = new LuaEnv();
        luaenv.AddLoader(new LuaEnv.CustomLoader((ref string f) =>
        {
            f = f.Replace(".", "/");
            f = dir + f + ".lua";
            return File.ReadAllBytes(f);
        }));
        luaenv.DoString("require 'Main'");
        Table = luaenv.Global.Get<LuaTable>("Main");
        AwakeFunction = Table.Get<LuaFunction>("Awake");
        StartFunction = Table.Get<LuaFunction>("Start");
        UpdateFunction = Table.Get<LuaFunction>("Update");
        OnDestroyFunction = Table.Get<LuaFunction>("OnDestroy");

        if (AwakeFunction != null) { AwakeFunction.Call(gameObject); }
    }

    void Start()
    {
        if (StartFunction != null) { StartFunction.Call(); }
    }

    void Update()
    {
        if (UpdateFunction != null) { UpdateFunction.Call(); }
    }

    void OnDestroy()
    {
        if (OnDestroyFunction != null) { OnDestroyFunction.Call(); }
    }
}
