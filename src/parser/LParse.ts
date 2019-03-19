import { LFrag, LToken, LTT, LFT } from './LEntity'
import { LParseHelper } from './LParseHelper'
import { LuaTableParse } from './LuaTableParse'
import { LuaFunctionParse } from './LuaFunctionParse'
import { LuaIfLogic } from './LuaIfLogic'
import { LFileMgr } from '../provider/LFileMgr'
import { LuaWhileLogic } from './LuaWhileLogic'
import { LuaForLogic } from './LuaForLogic'
import { LuaFunctionCall } from '../parser/LuaFunctionCall'
import { LFile } from "../provider/LFile"
import { ExtMgr } from '../context/ExtMgr'
import { LuaCheckReturn } from './LuaCheckReturn'
import { LuaLeftCheck } from './LuaLeftCheck'
import { LuaCheckUnary } from './LuaCheckUnary'
import { LuaValidateBracket_G } from './LuaValidateBracket_G'
import { LuaChuckInfo } from './LuaChuckInfo'
import { LuaValidateConstValue } from './LuaValidateConstValue'
import { LuaValidateOperator } from './LuaValidateOperator'
import { LuaCheckLuaInfos } from './LuaCheckLuaInfos'
import { LuaSetValue } from './LuaSetValue'
import { LuaValidateBracket_M } from './LuaValidateBracket_M'
import { LuaFuncitonCheck } from './LuaFuncitonCheck'
import { LuaCheckRepeat } from './LuaCheckRepeat'
import { LuaCheckDoEnd } from './LuaCheckDoEnd'
import * as path from 'path'
import vscode = require('vscode')
import { LGItem } from "../provider/LGItem"

export class LParse {
  public static ins: LParse;
  public lpt: LParseHelper;

  public luaTableParse: LuaTableParse;
  public tokenIndex: number = 0;
  public luaFunctionParse: LuaFunctionParse;
  public luaIfLogic: LuaIfLogic;
  public tokensLength: number = 0;
  public isError: boolean = false; // is Error when parsing.
  public errorMsg: Array<string> = new Array<string>();
  public tokens: Array<LToken>;
  public rootLuaInfo: LFrag;
  public fileMgr: LFileMgr;
  public luaWhileLogic: LuaWhileLogic;
  public luaForLogic: LuaForLogic;
  public functionCall: LuaFunctionCall;
  public luaCheckReturn: LuaCheckReturn;
  public luaLeftCheck: LuaLeftCheck;
  public luaCheckUnary: LuaCheckUnary;
  public luaValidateBracket_G: LuaValidateBracket_G;
  public luaChuckInfo: LuaChuckInfo;
  public luaValidateConstValue: LuaValidateConstValue;
  public luaValidateOperator: LuaValidateOperator;
  public luaCheckLuaInfos: LuaCheckLuaInfos;
  public luaSetValue: LuaSetValue;
  public luaValidateBracket_M: LuaValidateBracket_M;
  public luaFuncitonCheck: LuaFuncitonCheck;
  private isSaveCompletion: boolean;
  public diagnosticCollection: vscode.DiagnosticCollection;
  public luaCheckRepeat: LuaCheckRepeat;
  public luaCheckDoEnd: LuaCheckDoEnd;
  public currentUri: vscode.Uri;
  public tempUri: vscode.Uri;
  public errorFilePaths: Array<vscode.Uri>;
  public static checkTempFilePath: string;

  constructor(diagnosticCollection: vscode.DiagnosticCollection) {
    LParse.ins = this;
    this.errorFilePaths = new Array<vscode.Uri>();
    this.fileMgr = new LFileMgr();
    this.diagnosticCollection = diagnosticCollection;
    this.lpt = new LParseHelper();
    this.luaTableParse = new LuaTableParse(this);
    this.luaFunctionParse = new LuaFunctionParse(this)
    this.luaIfLogic = new LuaIfLogic(this)
    this.luaWhileLogic = new LuaWhileLogic(this);
    this.luaForLogic = new LuaForLogic(this)
    this.luaCheckRepeat = new LuaCheckRepeat(this)
    this.functionCall = new LuaFunctionCall(this)
    this.luaCheckReturn = new LuaCheckReturn(this)
    this.luaLeftCheck = new LuaLeftCheck(this)
    this.luaCheckUnary = new LuaCheckUnary(this)
    this.luaValidateBracket_G = new LuaValidateBracket_G(this)
    this.luaChuckInfo = new LuaChuckInfo(this)
    this.luaValidateConstValue = new LuaValidateConstValue(this)
    this.luaValidateOperator = new LuaValidateOperator(this)
    this.luaCheckLuaInfos = new LuaCheckLuaInfos(this)
    this.luaSetValue = new LuaSetValue(this)
    this.luaValidateBracket_M = new LuaValidateBracket_M(this)
    this.luaFuncitonCheck = new LuaFuncitonCheck(this);
    this.luaCheckDoEnd = new LuaCheckDoEnd(this)

    var tempFile = path.join(ExtMgr.extensionPath, "res", "parse.temp")
    this.currentUri = vscode.Uri.parse(tempFile)
    LParse.checkTempFilePath = tempFile
  }

  //传入的需要解析的代码
  public Parse(uri: vscode.Uri, text: string, isSaveCompletion: boolean = true): any {
    this.isSaveCompletion = isSaveCompletion
    this.luaFuncitonCheck.currentFunLuaInfo = null
    this.tempUri = uri
    this.rootLuaInfo = new LFrag(null)
    this.rootLuaInfo.type = LFT.ROOT
    this.lpt.reset(text)
    this.isError = false
    this.end()
    var file: LFile = this.fileMgr.getFile(uri)
    if (file) {
      file.tokens = this.tokens
      if (file.hlG) {
        file.hlG.render(this.tokens)
      }
    }
  }

  public Parse2(uri: vscode.Uri, tokens: Array<LToken>, isSaveCompletion: boolean = true) {
    this.isSaveCompletion = isSaveCompletion
    this.luaFuncitonCheck.currentFunLuaInfo = null
    this.tempUri = uri
    this.rootLuaInfo = new LFrag(null)
    this.rootLuaInfo.type = LFT.ROOT
    this.isError = false
    this.tokens = tokens
    this.end2()
    var file: LFile = this.fileMgr.getFile(uri)
    if (file) {
      file.tokens = this.tokens
      if (file.hlG) {
        file.hlG.render(this.tokens)
      }
    }
  }

  private end(): void {
    var tokens = new Array<LToken>();
    while (true) {
      var token: LToken = this.lpt.next();
      if (token.error != null) {
        this.setError(token, token.error.msg)
        return;
      }
      if (token.type == LTT.EOF) {
        break;
      }
      token.index = tokens.length;
      tokens.push(token);
    }
    this.tokens = tokens;
    this.fileMgr.initialize(this, this.currentUri, this.tempUri);
    this.tokenIndex = 0;
    this.tokensLength = tokens.length;
    var isReturn = false
    try {
      isReturn = this.setLuaInfo(this.rootLuaInfo, null, null)
    } catch (error) {
      console.log(error)
    }

    var returnValueToken: LToken = null;
    if (isReturn) {
      if (this.tokenIndex < this.tokensLength) {
        this.setError(this.getLastToken(), "return unnecessary tokens")
      }
    }
    if (this.isError == false) {
      for (var i = 0; i < this.errorFilePaths.length; i++) {
        if (this.tempUri.path == this.errorFilePaths[i].path) {
          this.errorFilePaths.splice(i, 1)
          break;
        }
      }

      //正确了删除错误提示
      if (this.diagnosticCollection && this.diagnosticCollection.has(this.tempUri)) {
        this.diagnosticCollection.delete(this.tempUri)
      }

      var file: LFile = this.fileMgr.curFile
      file.tempFuncNames = null

      if (this.isSaveCompletion || (this.isSaveCompletion == false && this.isError == false)) {
        var oldFile = this.fileMgr.getFileByPath(this.tempUri.path)
        if (oldFile != null) {
          LGItem.clearGolbalCompletion(oldFile.fields)
        }
        if (isReturn) {
          if (this.tokensLength - 2 >= 0) {
            var returnToken: LToken = tokens[this.tokensLength - 2]
            if (returnToken.type == LTT.Keyword && returnToken.value == "return") {
              if (tokens[this.tokensLength - 1].type == LTT.Identifier) {
                returnValueToken = tokens[this.tokensLength - 1]
                file.setRootCompletionInfo(returnValueToken.value)
              }
            }
          }
        }

        this.fileMgr.files.set(this.tempUri.path, file)
        file.checkFunCompletion()
        LGItem.setGolbalCompletion(file.fields)
        this.fileMgr.curFile = null
        file.tokens = null
      }

      this.fileMgr.files.delete(this.currentUri.path)
    } else {

      var file: LFile = this.fileMgr.files.get(this.currentUri.path);
      file.clear()
    }
  }

  private end2(): void {
    this.fileMgr.initialize(this, this.currentUri, this.tempUri);
    this.tokenIndex = 0;
    this.tokensLength = this.tokens.length;
    var isReturn = false
    try {
      isReturn = this.setLuaInfo(this.rootLuaInfo, null, null)
    } catch (error) {
      console.log(error)
    }

    var returnValueToken: LToken = null;
    if (isReturn) {
      if (this.tokenIndex < this.tokensLength) {
        this.setError(this.getLastToken(), "return unnecessary tokens")
      }
    }
    if (this.isError == false) {
      for (var i = 0; i < this.errorFilePaths.length; i++) {
        if (this.tempUri.path == this.errorFilePaths[i].path) {
          this.errorFilePaths.splice(i, 1)
          break;
        }
      }

      //正确了删除错误提示
      if (this.diagnosticCollection && this.diagnosticCollection.has(this.tempUri)) {
        this.diagnosticCollection.delete(this.tempUri)
      }

      var file: LFile = this.fileMgr.curFile
      file.tempFuncNames = null

      if (this.isSaveCompletion || (this.isSaveCompletion == false && this.isError == false)) {
        var oldFile = this.fileMgr.getFileByPath(this.tempUri.path)
        if (oldFile != null) {
          LGItem.clearGolbalCompletion(oldFile.fields)
        }
        if (isReturn) {
          if (this.tokensLength - 2 >= 0) {
            var returnToken: LToken = this.tokens[this.tokensLength - 2]
            if (returnToken.type == LTT.Keyword && returnToken.value == "return") {
              if (this.tokens[this.tokensLength - 1].type == LTT.Identifier) {
                returnValueToken = this.tokens[this.tokensLength - 1]
                file.setRootCompletionInfo(returnValueToken.value)
              }
            }
          }
        }

        this.fileMgr.files.set(this.tempUri.path, file)
        file.checkFunCompletion()
        LGItem.setGolbalCompletion(file.fields)
        this.fileMgr.curFile = null
        file.tokens = null
      }

      this.fileMgr.files.delete(this.currentUri.path)
    } else {

      var file: LFile = this.fileMgr.files.get(this.currentUri.path);
      file.clear()
    }
  }

  /**
   * 返回值为 是否是 checkEnd 的返回值
   */
  public setLuaInfo(parent: LFrag, checkEnd: Function, checkBreak: Function): any {
    while (true) {

      var returnValue = false
      if (this.tokenIndex < this.tokensLength) {

        if (checkBreak) {
          checkBreak(this)
          if (this.isError) return false

        } else {
          var breaktoken: LToken = this.getTokenByIndex(this.tokenIndex, null)
          if (this.Compare("break", breaktoken, LTT.Keyword)) {

            this.checkSemicolons()
            this.tokenIndex++;
          }
        }

        //检查function
        returnValue = this.luaCheckReturn.check(parent, checkEnd, false)
        if (returnValue != false) {
          return returnValue
        }
        if (this.isError) return false
        if (checkEnd != null) {
          returnValue = checkEnd(this);
          if (this.isError) return
          if (returnValue != false) return returnValue;

        }
        if (this.luaFuncitonCheck.check()) {
          if (this.isError) return false

          continue;
        }
        if (this.isError) return
        if (this.tokenIndex >= this.tokens.length) {
          return true
        }
        if (this.luaForLogic.check()) {
          continue;
        }
        if (this.isError) return false
        //检查 Repeat
        if (this.luaCheckRepeat.check()) {
          if (this.isError) return false
          continue;
        }
        //检查if
        if (this.luaIfLogic.check(parent, true, false, false, checkBreak)) {
          if (this.isError) return false

          continue;
        }
        if (this.isError) return false
        if (this.luaCheckDoEnd.check()) {
          if (this.isError) return false
          continue;
        }

        if (this.isError) return false

        if (this.tokenIndex >= this.tokens.length) {
          return true
        }
        //检查while
        if (this.luaWhileLogic.check(parent)) {
          if (this.isError) return false
          continue;
        }
        if (this.isError) return false
        this.luaLeftCheck.check(parent)
        if (this.isError) return
        this.tokenIndex++;
        //检查是否未 字符
        if (this.isError) {
          return false
        } else {
          if (checkEnd != null) {
            returnValue = checkEnd(this);

            if (this.isError) return
            if (returnValue != false) {
              return returnValue;
            } else {

              continue;
            }
          } else {

            continue;
          }
        }
      } else {
        return false
      }
    }
  }

  /**检查分号 */
  public checkSemicolons() {
    var token: LToken = this.getNextToken(null)
    if (token != null && this.Compare(';', token, LTT.Punctuator)) {
      return true
    }
    this.tokenIndex--;
    return false
  }

  public setError(token: LToken, typeMsg: string, startToen: LToken = null): void {
    this.isError = true;
    if (startToen == null) {
      startToen = token;
    }
    if (ExtMgr.enableDiagnostic) {
      var starPo: vscode.Position = new vscode.Position(startToen.line, startToen.range.start - startToen.lineStart)
      var endPo: vscode.Position = new vscode.Position(token.line, token.range.end - token.lineStart)
      var range: vscode.Range = new vscode.Range(starPo, endPo)
      var currentDiagnostic: vscode.Diagnostic = new vscode.Diagnostic(range, typeMsg, vscode.DiagnosticSeverity.Error);
      this.diagnosticCollection.set(this.tempUri, [currentDiagnostic]);
    }
  }

  public getUpToken(): LToken {
    return this.tokens[this.tokenIndex - 1];
  }

  public getLastToken(): LToken {
    return this.tokens[this.tokens.length - 1]
  }

  public getTokenByIndex(tokenIndex: number, errorMsg: string): LToken {
    if (tokenIndex < this.tokensLength) {
      return this.tokens[tokenIndex]
    }
    if (errorMsg != null) {
      var upToken = null
      while (true) {
        tokenIndex -= 1
        upToken = this.tokens[tokenIndex]
        if (upToken != null) {
          break;
        }
      }
      this.setError(upToken, errorMsg);
    }
    return null
  }

  public getNextToken(errorMsg: string): LToken {
    this.tokenIndex++;
    return this.getCurrentToken(errorMsg)
  }

  public getCurrentToken(errorMsg: string): LToken {
    if (this.tokenIndex < this.tokensLength) {
      return this.tokens[this.tokenIndex]
    }
    if (errorMsg != null) {
      var tokenIndex = this.tokenIndex;
      var upToken: LToken = null;
      while (true) {

        tokenIndex -= 1
        upToken = this.tokens[tokenIndex]
        if (upToken != null) {
          break;
        }
      }
      this.setError(upToken, errorMsg);
    }
    return null
  }

  public Compare(value: string, target: LToken, type: LTT): boolean {
    if (target == null) return false;
    if (value === target.value && target.type == type) {
      return true;
    }
    return false;
  }

}