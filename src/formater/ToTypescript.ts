import { Range } from 'vscode-languageclient'
import { LFrag, LToken, LTT, LComment, LRange, LET, LError } from '../parser/LEntity'
import { ExtMgr } from '../context/ExtMgr';
import { LFileMgr } from '../provider/LFileMgr';
import { LParse } from '../parser/LParse';
import { LFItem } from '../provider/LFItem';
import { LFile } from '../provider/LFile';
import { Helper } from '../context/Helper';
import { LParseHelper } from '../parser/LParseHelper';
import { LCItem } from '../provider/LCItem';
var querystring = require('querystring')

export class ToTypescript {
  private fm: LFileMgr
  private index: number = 0; //当前解析到的位置
  private length: number = 0; //文本总长度
  public input: string = "";
  private line: number = 0; //当前解析的行
  private lineStart: number = 0; //当前行开始的开始的位置
  private tokenStart: number = 0; //标示符 或者 关键字 开始的 位置
  private token: LToken; //当前块
  private tokens: Array<LToken>;
  public formatContent: string = "";
  private funTabAdd: boolean = false; //方法缩进
  private funTabMCount: number = -1;
  private ignoreTabAdd: boolean = false;
  private Bracket_B: Array<boolean> = new Array<boolean>();
  private formatTabCount: number = null;
  private isAddTab: boolean = false;
  private attachFuncBracket: boolean = false;

  private isForScope: boolean = false
  private isForLogic: boolean = false
  private isFori: boolean = false
  private isForAsc: boolean = false
  private isForArr: boolean = false
  private forVar1: string = ""
  private forVar2: string = ""
  private forVar3: string = ""
  private forExpression: string = ""

  constructor(text: string) {
    this.Reset(text)
    this.tokens = new Array<LToken>();
    while (true) {
      var token: LToken = this.next();
      if (token.error != null) {
        this.formatContent = text
        return;
      }
      if (token.type == LTT.EOF) {
        token.value = ""
        this.tokens.push(token)
        break;
      }
      if (token.type == LTT.Keyword && (token.value == "else" || token.value == "elseif")) {
        var tindex = this.tokens.length - 1
        while (true) {
          if (tindex >= 0) {
            if (this.tokens[tindex].type == LTT.Wrap) {
              break;
            } else if (this.tokens[tindex].type == LTT.Tab) {
              tindex--;
            } else {
              var Wraptoken: LToken = new LToken()
              Wraptoken.type = LTT.Wrap;
              this.tokens.push(Wraptoken);
              Wraptoken.index = this.tokens.length
              break;
            }
          } else {
            break;
          }
        }
      }
      if (this.spaceCount > 0 && token.type == LTT.Tab) {
        var ttoken: LToken = new LToken();
        ttoken.type = LTT.Tab
        this.tokens.push(ttoken)
      }
      this.tokens.push(token);
      token.index = this.tokens.length;
      if (token.type != LTT.Wrap) {
        //去掉空格
        this.skipWhiteSpace(true);
        if (this.tokens[this.tokens.length - 1].type != LTT.Wrap) {
          //先判断有没有注释
          while (45 == this.input.charCodeAt(this.index) &&
            45 == this.input.charCodeAt(this.index + 1) &&
            this.input.charAt(this.index + 2) != '['
          ) {
            //如果有注释 将tab 全部删除
            while (true) {
              var tindex = this.tokens.length - 1;
              if (this.tokens[tindex].type == LTT.Tab) {
                this.tokens.pop()
              } else {
                break
              }
            }
            //获取评论
            this.scanComment(token, true);
            if (this.tokens.length > 0) {
              if (this.tokens[this.tokens.length - 1].type != LTT.Wrap) {
                var wtoken: LToken = new LToken()
                wtoken.type = LTT.Wrap
                this.tokens.push(wtoken)
              }
            }
            break
          }
        }
      }
    }
    var content = "";
    var newWrap = false;
    for (var index = 0; index < this.tokens.length; index++) {
      var token = this.tokens[index];
      var nextToken: LToken = null;
      if (index < this.tokens.length - 1) {
        nextToken = this.tokens[index + 1]
      }
      var upToken: LToken = null
      if (index > 0) {
        upToken = this.tokens[index - 1]
      }
      if (token.type == LTT.Keyword) {
        if (token.value == "for") {
          this.isForScope = true
          this.forExpression = ""
          this.isFori = false
          this.isForAsc = false
          this.isForArr = false
          this.forVar1 = null
          this.forVar2 = null
          this.forVar3 = null
        }
        if (token.value == "do") {
          if (this.forExpression != null && this.forExpression != "") {
            this.isForScope = false
            this.isForLogic = true
            this.isFori = !(this.forExpression.indexOf("pairs") >= 0)
            this.isForArr = this.forExpression.indexOf("#") >= 0
            this.forExpression = this.forExpression.replace("for", "")
            this.forExpression = this.forExpression.replace("in", "")
            this.forExpression = this.forExpression.replace("pairs", "")
            this.forExpression = this.forExpression.replace(")", "")
            if (this.isFori) {
              var strs = this.forExpression.split("=")
              this.forVar1 = strs[0]
              this.forExpression = strs[1]
              strs = this.forExpression.split(",")
              this.forVar2 = strs[0]
              this.forVar3 = strs[1]
              if (this.isForArr) {
                if (this.forVar2.indexOf("#") >= 0) {
                  this.isForAsc = false
                  this.forVar2 = this.forVar2.replace("#", "")
                } else {
                  this.isForAsc = true
                  this.forVar3 = this.forVar3.replace("#", "")
                }
              } else {
                this.isForAsc = strs[2] == null
              }
            } else {
              var strs = this.forExpression.split(",")
              this.forVar1 = strs[0]
              this.forExpression = strs[1]
              strs = this.forExpression.split("(")
              this.forVar2 = strs[0]
              this.forVar3 = strs[1]
            }
          }
        }
      }
      if (this.isForScope) {
        this.forExpression += token.value
        continue
      }
      //文件尾部
      if (upToken && upToken.type != 1 && token.type == 1 && token.comments.length == 0 && nextToken == null) {
        content = content.slice(0, content.length - 1)
        continue
      }
      //方法缩进
      if (token.type == LTT.Keyword && token.value == "function") {
        this.funTabAdd = true;
      }
      if (this.funTabAdd) {
        if (token.type == LTT.Punctuator && token.value == "(") {
          if (this.funTabMCount == -1) {
            this.funTabMCount = 1
          } else {
            this.funTabMCount++;
          }
        }
        if (token.type == LTT.Punctuator && token.value == ")") {
          this.attachFuncBracket = true
          this.funTabMCount--
          if (this.funTabMCount == 0) {
            this.funTabMCount = -1;
            this.formatTabCount++;
            this.funTabAdd = false
          }
          //function() ....end 无需缩进
          // if (nextToken && nextToken.type == TokenTypes.Wrap) {
          //   this.funTabMCount--
          //   if (this.funTabMCount == 0) {
          //     this.funTabMCount = -1;
          //     this.formatTabCount++;
          //     this.funTabAdd = false
          //   }
          // }
          // else {
          //   this.formatTabCount--
          // }
        }
      }
      //end 减少一个tab
      if (token.type == LTT.Keyword && (token.value == "end" || token.value == "until")) {
        this.formatTabCount--;
        if (this.formatTabCount >= 0 && !this.isAddTab) {
          content = content.slice(0, content.length - 4)
        }
      }

      if (token.type == LTT.Keyword &&
        (token.value == "do" ||
          token.value == "then" ||
          token.value == "repeat")) {
        if (this.ignoreTabAdd) {
          this.ignoreTabAdd = false;
        } else {
          this.formatTabCount++;
        }
      }

      if (token.type == LTT.Wrap) {
        if (!newWrap) {
          if (upToken.value != "=") {
            if (this.attachFuncBracket) {
              this.attachFuncBracket = false
              content += "{"
            }
            content += "\n"
          }
          else {
            content += " ";
          }
        }

        if (nextToken != null && nextToken.type == LTT.Keyword &&
          (nextToken.value == "else" || nextToken.value == "elseif")) {
          if (nextToken.comments.length > 0) {
            nextToken.comments.forEach(comment => {
              for (var i = 0; i < this.formatTabCount; i++) {
                content += "    "
              }
              if (comment.isLong) {
                content += "//[[" + comment.content + "]]\n";
              } else {
                content += "//" + comment.content + "\n";
              }
            });
          }
          this.formatTabCount--;
        }
        this.isAddTab = false;
        for (var i = 0; i < this.formatTabCount; i++) {
          var sigNewline = this.isLineTerminator(content.charCodeAt(content.length - 1))
          if (sigNewline && token.type == 10 && nextToken.type == 10) {
            // 空的一行不需要tab
          } else {
            content += "    "
          }
        }
        if (nextToken != null && nextToken.type == LTT.Keyword &&
          (nextToken.value == "else")) {
          this.formatTabCount++;
        }
      }
      else if (token.type == LTT.Tab) {
        if (this.isAddTab && nextToken.type != LTT.Wrap) {
          content += '    '
        }
      }
      else {
        this.isAddTab = true;
        if (token.type == LTT.Punctuator && token.value == "{") {
          if (nextToken != null && nextToken.type == LTT.Wrap) {
            this.Bracket_B.push(true)
            this.formatTabCount++;
          } else {
            this.Bracket_B.push(false)
          }
        }
        if (this.Bracket_B.length && token.type == LTT.Punctuator && token.value == "}") {
          if (this.Bracket_B[this.Bracket_B.length - 1]) {
            this.formatTabCount--;
            if (upToken != null && upToken.type != LTT.Wrap) {
              //手动换行
              content += "\n";
              for (var i = 0; i < this.formatTabCount; i++) {
                content += "    "
              }
            } else if (upToken != null && upToken.type == LTT.Wrap) {
              content = content.slice(0, content.length - 4)
            }
          }
          this.Bracket_B.pop();
        }
        //前注释
        if (token.comments.length > 0 && !(token.type == LTT.Keyword && (token.value == "else" || token.value == "elseif"))) {
          token.comments.forEach(comment => {
            var isLast = nextToken == null
            if (comment.isLong) {
              if (isLast) {
                content += "//[[" + comment.content + "]]";
              } else {
                content += "//[[" + comment.content + "]]\n";
              }
            } else {
              if (token.type == LTT.Keyword && (
                token.value == "end" ||
                token.value == "until"
              )) {
                content += "    "
              }
              if (isLast) {
                content += "//" + comment.content;
              } else {
                content += "//" + comment.content + "\n";
              }
            }
            for (var i = 0; i < this.formatTabCount; i++) {
              content += "    "
            }
          });
        }
        var con1 = function () {
          var sig = nextToken != null &&
            nextToken.type != LTT.Tab &&
            nextToken.type != LTT.Wrap
          return sig
        }
        var con2 = function () {
          var sig = token.type == LTT.Identifier && nextToken.type == LTT.Punctuator && nextToken.value == '['
          return !sig
        }
        var con3 = function () {
          var sig = (nextToken.value == '(' || nextToken.value == "[") && nextToken.type == LTT.Punctuator &&
            // a() (); issue
            ((token.value == ")") ||
              // 括号贴合问题
              (token.type != LTT.Keyword || token.value == "function") && (token.type != LTT.Punctuator))
          return !sig
        }
        var con4 = function () {
          var sig = nextToken.value == ',' && nextToken.type == LTT.Punctuator
          return !sig
        }
        var con5 = function () {
          var sig = nextToken.value == ')' && nextToken.type == LTT.Punctuator
          return !sig
        }
        var con6 = function () {
          var sig = nextToken.value == ']' && nextToken.type == LTT.Punctuator
          return !sig;
        }
        var con7 = function () {
          var sig = nextToken.value == ':' && nextToken.type == LTT.Punctuator
          return !sig
        }
        var con8 = function () {
          var sig = nextToken.value == '}' && nextToken.type == LTT.Punctuator &&
            // ... a = 1} 问题 
            !(token.type == LTT.NumericLiteral || token.type == LTT.Identifier ||
              token.type == LTT.BooleanLiteral || token.type == LTT.Keyword ||
              token.type == LTT.StringLiteral) &&
            // ...} 问题
            !(token.type == LTT.VarargLiteral) &&
            // =nil} issue
            !(token.type == LTT.NilLiteral) &&
            // }} issue
            !(token.value == '}') &&
            // )} issue
            !(token.value == ')') &&
            // a = { b = c[1]} 问题
            !(token.value == "]")
          return !sig
        }
        var con9 = function () {
          var sig = nextToken.value == ';' && nextToken.type == LTT.Punctuator
          return !sig
        }
        var con10 = function () {
          var sig = nextToken.value == '.' && nextToken.type == LTT.Punctuator
          return !sig
        }

        var con11 = function () {
          var sig = token.value == '#' && token.type == LTT.Punctuator
          return !sig
        }
        var con12 = function () {
          var sig = token.value == '.' && token.type == LTT.Punctuator
          return !sig
        }
        var con13 = function () {
          var sig = token.value == '(' && token.type == LTT.Punctuator
          return !sig
        }
        var con14 = function () {
          var sig = token.value == ':' && token.type == LTT.Punctuator
          return !sig
        }
        var con15 = function () {
          // {Text = ... 问题 
          var sig = token.value == '{' && token.type == LTT.Punctuator && nextToken.type != LTT.Identifier &&
            // {... 问题
            nextToken.type != LTT.VarargLiteral &&
            // {1= issue
            nextToken.type != LTT.NumericLiteral &&
            // {"%d" issue
            nextToken.type != LTT.StringLiteral &&
            // {{ issue
            nextToken.value != '{'
          return !sig
        }
        var con16 = function () {
          var sig = token.value == '[' && token.type == LTT.Punctuator
          return !sig
        }
        var con17 = function () {
          var sig = token.value == ']' && (nextToken.value == "[" || nextToken.value == "(")
          return !sig
        }
        var con18 = function () {
          // 负号连接符问题
          var sig = token.value == "-" && ((upToken.type == LTT.Punctuator && upToken.value != ")" && upToken.value != "]") ||
            (upToken.type == LTT.Keyword && (upToken.value == "and" || upToken.value == "or" || upToken.value == "not")) || upToken.value == "return" || upToken.type == LTT.Wrap) &&
            (nextToken.type == LTT.NumericLiteral || nextToken.type == LTT.Identifier || (nextToken.value == "(" && nextToken.type == LTT.Punctuator))
          return !sig
        }
        var con19 = function () {
          // var sig = false
          // if (upToken && upToken.type != 1 && token.type == 1 && (nextToken == null || nextToken.type == 1)) {
          //   sig = true
          // }
          return true
        }
        var con100 = function () {
          var sig = (token.afterComments == null || (token.afterComments != null && token.afterComments.length == 0))
          return sig
        }
        if (con1() && con2() && con3() && con4() && con5() && con6() && con7() && con8() && con9() && con10() &&
          con11() && con12() && con13() && con14() && con15() && con16() && con17() && con18() && con19() && con100()) {
          content += this.getTokenValue(token) + " "
        } else {
          //如果为换行 和 \t 就直接添加
          content += this.getTokenValue(token);
        }
        if (token.afterComments != null && token.afterComments.length > 0) {
          token.afterComments.forEach(comment => {
            if (token.value == ",") {
              // 注释标准化
              var idx = comment.content.indexOf('-')
              var newc = comment.content.slice(idx, comment.content.length)
              newc = " " + newc
              content += newc.replace(/--/g, "//")
            } else {
              content += comment.content.replace(/--/g, "//")
            }
          });
        }
      }
      if (token.type != LTT.Tab && token.type != LTT.Wrap) {
        newWrap = false
      }
    }
    this.formatContent = content
  }

  private getTokenValue(token: LToken) {
    if (token.type == LTT.StringLiteral && token.delimiter != null) {
      return token.delimiter + token.value + token.enddelimiter;
    } else if (token.type == LTT.NilLiteral) {
      return "null"
    } else if (token.type == LTT.Keyword) {
      if (token.value == "local") {
        return "let"
      }
      else if (token.value == "for") {
        return "for(let"
      }
      else if (token.value == "while") {
        return "while("
      }
      else if (token.value == "if") {
        return "if("
      }
      else if (token.value == "else") {
        return "}else{"
      }
      else if (token.value == "elseif") {
        return "}else if("
      }
      else if (token.value == "then") {
        return "){"
      }
      else if (token.value == "do") {
        if (this.isForLogic) {
          this.isForLogic = false
          var str = ""
          if (this.isFori) {
            if (this.isForAsc) {
              if (this.isForArr) {
                if (parseInt(this.forVar2) == 1) {
                  this.forVar2 = "0"
                }
                str = "for(let " + this.forVar1 + " = " + this.forVar2 + ";" + this.forVar1 + " < " + this.forVar3 + ".length;" + this.forVar1 + "++){"
              } else {
                str = "for(let " + this.forVar1 + " = " + this.forVar2 + ";" + this.forVar1 + " <= " + this.forVar3 + ";" + this.forVar1 + "++){"
              }
            } else {
              if (this.isForArr) {
                str = "for(let " + this.forVar1 + " = " + this.forVar2 + ".length - 1;" + this.forVar1 + " >= " + this.forVar3 + ";" + this.forVar1 + "--){"
              } else {
                str = "for(let " + this.forVar1 + " = " + this.forVar2 + ";" + this.forVar1 + " >= " + this.forVar3 + ";" + this.forVar1 + "--){"
              }
            }
          } else {
            str = "for(let " + this.forVar1 + " in " + this.forVar3 + "){"
            str += "\n"
            for (var i = 0; i < this.formatTabCount; i++) {
              str += "    "
            }
            str += "let " + this.forVar2 + " = " + this.forVar3 + "[" + this.forVar1 + "]"
          }
          return str
        } else {
          return "){"
        }
      }
      else if (token.value == "not") {
        return "!"
      } else if (token.value == "and") {
        return "&&"
      } else if (token.value == "or") {
        return "||"
      } else if (token.value == "end") {
        return "}"
      }
    } else if (token.type == LTT.Punctuator) {
      if (token.value == "..") {
        return "+"
      } else if (token.value == "~=") {
        return "!="
      }
    }
    return token.value
  }

  // 重置
  public Reset(text: string): void {
    this.input = text;
    //检查第一个字符是否为#
    this.index = 0;
    this.length = this.input.length;
    this.line = 0;
    this.lineStart = 0;
    if (this.input.charAt(0) == '#') {
      while (true) {
        if (this.consumeEOL(true)) {
          break
        } else {
          this.index++;
        }
      }
    }
  }

  public next(): LToken {
    var token = new LToken();
    //去掉空格
    this.skipWhiteSpace(true);
    var isComment = false
    //先判断有没有注释
    while (45 == this.input.charCodeAt(this.index) &&
      45 == this.input.charCodeAt(this.index + 1)) {
      //获取评论
      this.scanComment(token, false);
      isComment = true
      this.skipWhiteSpace(false);
    }
    if (isComment) {
      if (this.tokens.length > 0) {
        if (this.tokens[this.tokens.length - 1].type != LTT.Wrap) {
          var wtoken: LToken = new LToken()
          wtoken.type = LTT.Wrap
          this.tokens.push(wtoken)
        }
      }
    }
    //没有下一个
    if (this.index >= this.length) {
      token.type = LTT.EOF;
      token.value = '<eof>';
      token.line = this.line;
      token.lineStart = this.lineStart;
      token.range = new LRange(this.index, this.index)
      return token;
    }

    //开始正式解析变量了
    var charCode = this.input.charCodeAt(this.index)
    var next = this.input.charCodeAt(this.index + 1);

    // Memorize the range index where the token begins.
    this.tokenStart = this.index;
    if (this.isIdentifierStart(charCode)) {
      return this.scanIdentifierOrKeyword(token);
    }

    switch (charCode) {
      case 39: case 34: // '"
        return this.scanStringLiteral(token);
      // 0-9
      case 48: case 49: case 50: case 51: case 52: case 53:
      case 54: case 55: case 56: case 57:
        return this.scanNumericLiteral(token);
      case 46: // .
        // If the dot is followed by a digit it's a float.
        if (this.isDecDigit(next)) return this.scanNumericLiteral(token);
        if (46 === next) { // ..
          if (46 === this.input.charCodeAt(this.index + 2)) // ...
          {
            return this.scanVarargLiteral(token);
          }
          return this.scanPunctuator('..', token);
        }
        return this.scanPunctuator('.', token);
      case 61: // =
        if (61 === next) // ==
        {
          return this.scanPunctuator('==', token);
        }
        return this.scanPunctuator('=', token);
      case 62: // >
        if (61 === next)// >=
        {
          return this.scanPunctuator('>=', token);
        }
        if (62 === next) // >>
        {
          return this.scanPunctuator('>>', token);
        }
        return this.scanPunctuator('>', token);
      case 60: // <
        if (60 === next) {
          return this.scanPunctuator('<<', token);
        }
        if (61 === next) {
          return this.scanPunctuator('<=', token);
        }
        return this.scanPunctuator('<', token);
      case 126: // ~
        if (61 === next)//~=
        {
          return this.scanPunctuator('~=', token);
        }
        return this.scanPunctuator('~', token);
      case 58: // :
        if (58 === next) {
          //goto 标签
          return this.scanPunctuator('::', token);
        }
        return this.scanPunctuator(':', token);
      case 91: // [
        // Check for a multiline string, they begin with [= or [[
        if (91 === next || 61 === next) {
          //长字符串
          return this.scanLongStringLiteral(token);
        }
        return this.scanPunctuator('[', token);
      case 47: // /
        // Check for integer division op (//)
        if (47 === next) return this.scanPunctuator('//', token);
        return this.scanPunctuator('/', token);
      // * ^ % , { } ] ( ) ; & # - + |
      case 42: case 94: case 37: case 44: case 123: case 124: case 125:
      case 93: case 40: case 41: case 59: case 38: case 35: case 45: case 43:
        return this.scanPunctuator(this.input.charAt(this.index), token);
    }
    token.type = LTT.Punctuator;
    token.value = this.input.charAt(this.index)
    return this.unexpected(token);
  }

  /**
   * 解析 ...
  */
  private scanVarargLiteral(token: LToken): LToken {
    this.index += 3;
    token.type = LTT.VarargLiteral;
    token.value = '...';
    token.line = this.line;
    token.lineStart = this.lineStart;
    token.range = new LRange(this.tokenStart, this.index)
    return token;
  }

  /***
   * 解析数字
   *  */
  private scanNumericLiteral(token: LToken): LToken {
    var character: string = this.input.charAt(this.index);
    var next: string = this.input.charAt(this.index + 1);
    //这里需要检查 是否为 ..
    var value: any = 0;
    if ('0' === character && 'xX'.indexOf(next || null) >= 0) {
      if (ExtMgr.formatHex) {
        value = this.readHexLiteral(token)
        if (token.error != null) {
          return token
        }
      } else {
        var start = this.index
        this.index += 2
        while (this.isHexDigit(this.input.charCodeAt(this.index))) this.index++;
        value = this.input.slice(start, this.index)
      }
    } else if (this.input.charAt(this.index + 2) != null && next === '.' && this.input.charAt(this.index + 2) === '.') {
      this.index++
      value = parseInt(character)
    }
    else {
      if (next)
        value = this.readDecLiteral(token);
      else {
        value = parseInt(character)
        this.index++;
      }
      if (token.error != null) {
        return token;
      }
    }
    token.type = LTT.NumericLiteral;
    token.value = value;
    token.line = this.line;
    token.lineStart = this.lineStart;
    token.range = new LRange(this.tokenStart, this.index);
    return token;
  }

  /**
   * 读取非十进制数
   */
  private readHexLiteral(token: LToken): number {
    var fraction: any = 0 // defaults to 0 as it gets summed
    var binaryExponent: any = 1 // defaults to 1 as it gets multiplied
    var binarySign: number = 1 // positive
    var digit: number;
    var fractionStart: number;
    var exponentStart: number;
    var digitStart: number = this.index += 2; // Skip 0x part

    //这里保证 16 进制 的最小 字符串长度 例: 0x:  那么就是违法的
    if (!this.isHexDigit(this.input.charCodeAt(this.index))) {
      token.line = this.line;
      token.lineStart = this.lineStart;
      token.range = new LRange(this.tokenStart, this.index)
      token.error = new LError(LET.malformedNumber, this.input.slice(this.tokenStart, this.index))
      return 0;
    }
    while (this.isHexDigit(this.input.charCodeAt(this.index))) this.index++;
    // Convert the hexadecimal digit to base 10.
    digit = parseInt(this.input.slice(digitStart, this.index), 16);

    // Fraction part i optional.
    if ('.' === this.input.charAt(this.index)) {

      fractionStart = ++this.index;
      while (this.isHexDigit(this.input.charCodeAt(this.index))) this.index++;
      fraction = this.input.slice(fractionStart, this.index);

      // Empty fraction parts should default to 0, others should be converted
      // 0.x form so we can use summation at the end.
      fraction = (fractionStart === this.index) ? 0
        : parseInt(fraction, 16) / Math.pow(16, this.index - fractionStart);
    }

    // Binary exponents are optional
    if ('pP'.indexOf(this.input.charAt(this.index) || null) >= 0) {
      this.index++;

      // Sign part is optional and defaults to 1 (positive).
      if ('+-'.indexOf(this.input.charAt(this.index) || null) >= 0)
        binarySign = ('+' === this.input.charAt(this.index++)) ? 1 : -1;

      exponentStart = this.index;

      // The binary exponent sign requires a decimal digit.
      if (!this.isDecDigit(this.input.charCodeAt(this.index))) {
        token.line = this.line;
        token.lineStart = this.lineStart;
        token.range = new LRange(this.tokenStart, this.index)
        token.error = new LError(LET.malformedNumber, this.input.slice(this.tokenStart, this.index))
        return 0;
      }


      while (this.isDecDigit(this.input.charCodeAt(this.index))) this.index++;
      binaryExponent = this.input.slice(exponentStart, this.index);

      // Calculate the binary exponent of the number.
      binaryExponent = Math.pow(2, binaryExponent * binarySign);
    }

    return (digit + fraction) * binaryExponent;
  }

  /**
   * 解析十进制数
   */
  private readDecLiteral(token: LToken): number {

    while (this.isDecDigit(this.input.charCodeAt(this.index))) this.index++;
    // Fraction part is optional
    if ('.' === this.input.charAt(this.index)) {
      this.index++;
      //这里还需要进行判断 是否 为 ..
      // Fraction part defaults to 0
      while (true) {
        var codeNumber: number = this.input.charCodeAt(this.index)
        if (this.isDecDigit(codeNumber)) {
          this.index++;
        }
        else if (this.isWhiteSpace(codeNumber, false) || this.isLineTerminator(codeNumber)) {
          break
        } else if (';' === this.input.charAt(this.index)) {
          break
        }
        else if ('+' === this.input.charAt(this.index)) {
          break
        }
        else if ('-' === this.input.charAt(this.index)) {
          break
        }
        else if (',' === this.input.charAt(this.index)) {
          break
        }
        else if (']' === this.input.charAt(this.index)) {
          break
        }
        else if (')' === this.input.charAt(this.index)) {
          break
        }
        else if ('}' === this.input.charAt(this.index)) {
          break
        }
        else if ('*' === this.input.charAt(this.index)) {
          break
        }
        else if ('/' === this.input.charAt(this.index)) {
          break
        }
        else if ('^' === this.input.charAt(this.index)) {
          break
        }
        else if ('eE'.indexOf(this.input.charAt(this.index)) >= 0) {
          break
        }
        else {
          this.index++;
          token.line = this.line;
          token.lineStart = this.lineStart;
          token.range = new LRange(this.tokenStart, this.index)
          token.error = new LError(LET.malformedNumber, this.input.slice(this.tokenStart, this.index))
          return
        }
      }
    }
    // Exponent part is optional.
    if ('eE'.indexOf(this.input.charAt(this.index) || null) >= 0) {
      this.index++;
      // Sign part is optional.
      if ('+-'.indexOf(this.input.charAt(this.index) || null) >= 0) this.index++;
      // An exponent is required to contain at least one decimal digit.
      if (!this.isDecDigit(this.input.charCodeAt(this.index))) {
        token.line = this.line;
        token.lineStart = this.lineStart;
        token.range = new LRange(this.tokenStart, this.index)
        token.error = new LError(LET.malformedNumber, this.input.slice(this.tokenStart, this.index))
        return
      }
      while (this.isDecDigit(this.input.charCodeAt(this.index))) this.index++;
    }
    var chatat = this.input.charAt(this.index)
    var chatat1 = this.input.charAt(this.index + 1)
    if (this.isWhiteSpace(this.input.charCodeAt(this.index), false) ||
      this.isLineTerminator(this.input.charCodeAt(this.index)) ||
      ';' === chatat ||
      '' === chatat ||
      ']' === chatat ||
      ')' === chatat ||
      ',' === chatat ||
      '}' === chatat ||
      chatat == '+' ||
      chatat == '-' ||
      chatat == '*' ||
      chatat == '/' ||
      chatat == '>' ||
      chatat == '>' ||
      chatat == ',' ||
      chatat == '}' ||
      chatat == '^' ||

      ('=' == chatat && '=' == chatat1) ||
      ('>' == chatat && '=' == chatat1) ||
      ('<' == chatat && '=' == chatat1) ||
      ('~' == chatat && '=' == chatat1)
    ) {
      return parseFloat(this.input.slice(this.tokenStart, this.index));
    } else {
      this.index++;
      token.line = this.line;
      token.lineStart = this.lineStart;
      token.range = new LRange(this.tokenStart, this.index)
      token.error = new LError(LET.malformedNumber, this.input.slice(this.tokenStart, this.index))
    }
  }

  /**
 * 获取注释
 */
  private scanComment(token: LToken, afterComment: boolean): void {
    //  this.tokenStart = this.index;
    this.index += 2;
    //当前字符
    var character = this.input.charAt(this.index);
    //注释内容
    var content;
    // 是否为长注释  --[[  长注释 ]]
    var isLong = false;
    var commentStart = this.index;
    var lineStartComment = this.lineStart;
    var lineComment = this.line;

    if ('[' == character) {
      content = this.readLongString(null);
      if (content == false) {
        content = character;
      }
      else {
        isLong = true;
      }
    }
    if (!isLong) {
      var isLineT: boolean = false
      var cindex = 0
      while (this.index < this.length) {
        var charCode: number = this.input.charCodeAt(this.index)
        if (this.isLineTerminator(charCode)) {

          isLineT = true
          var peekCharCode = this.input.charCodeAt(this.index + 1);
          //判断是否换行
          if (10 === charCode && 13 === peekCharCode) {
            this.index++;
          }
          if (13 === charCode && 10 === peekCharCode) {

            this.index++;
          }
          if (cindex == 0) {
            cindex = this.index
          }
          this.line++;
          this.lineStart = ++this.index;

          if (afterComment) {
            break;
          }

        } else {
          if (isLineT) {
            break
          }
          this.index++;
        }

      }
      cindex = cindex == 0 ? this.index : cindex
      if (afterComment) {
        content = this.input.slice(token.range.end, cindex);
      } else {
        content = this.input.slice(commentStart, cindex);
      }
    }
    var range = {
      start: { line: lineComment, character: lineStartComment },
      end: { line: this.lineStart, character: cindex - this.lineStart }
    }
    if (afterComment) {
      token.addAfterComment(new LComment(content, range, isLong));
    } else {
      token.addComment(new LComment(content, range, isLong));
    }
  }

  /**
    * 获取长字符串
    *  * return 
    *          为长字符串 content
    *          不为长字符串  false
    */
  private readLongString(token: LToken): any {
    //多少个  等于符号
    var level: number = 0;
    //注释内容  
    var content: string = '';
    var terminator: boolean = false;
    var character: string = null;
    var stringStart: number = 0;
    var beginDIndex: number = this.index;
    this.index++; //将位置移到 需要判断的字符  上已阶段以及判断到了 [
    // 获取等于符号的多少

    while ('=' === this.input.charAt(this.index + level)) {
      level++;
    }
    // 如果是[ 那么继续 如果不为 [ 那么 直接返回
    if ('[' !== this.input.charAt(this.index + level)) {
      return false;
    }
    this.index += level + 1;
    if (this.isLineTerminator(this.input.charCodeAt(this.index))) {
      this.consumeEOL(false);
    }
    //注释开始的位置
    stringStart = this.index;
    if (token) {
      token.delimiter = this.input.slice(beginDIndex, stringStart)
    }

    // 读取注释内容
    while (this.index < this.length) {
      while (true) {
        if (this.isLineTerminator(this.input.charCodeAt(this.index))) {
          this.consumeEOL(false);
        } else {
          break;
        }
      }
      var endDindex = this.index
      character = this.input.charAt(this.index++);

      if (']' == character) {

        terminator = true;
        for (var i = 0; i < level; i++) {
          if ('=' !== this.input.charAt(this.index + i)) {
            terminator = false;
          }
        }
        if (']' !== this.input.charAt(this.index + level)) {
          terminator = false;
        }

        if (token) {
          var endDstr = this.input.slice(endDindex, this.index + level + 1)
          token.enddelimiter = endDstr
        }
      }
      if (terminator) break;

    }
    if (terminator) {
      content += this.input.slice(stringStart, this.index - 1);
      this.index += level + 1;
      return content;
    } return false;
  }

  private readEscapeSequence(): string {
    var sequenceStart = this.index;
    switch (this.input.charAt(this.index)) {
      // Lua allow the following escape sequences.
      // We don't escape the bell sequence.
      case 'n': this.index++; return '\\n';
      case 'r': this.index++; return '\\r';
      case 't': this.index++; return '\\t';
      case 'v': this.index++; return '\\x0B';
      case 'b': this.index++; return '\\b';
      case 'f': this.index++; return '\\f';
      case '"': this.index++; return '\\"';
      case '\\': this.index++; return '\\' + '\\';
      // Skips the following span of white-space.
      case 'z': this.index++; this.skipWhiteSpace(false); return '';
      // Byte representation should for now be returned as is.
      case 'x':
        // \xXX, where XX is a sequence of exactly two hexadecimal digits
        if (this.isHexDigit(this.input.charCodeAt(this.index + 1)) &&
          this.isHexDigit(this.input.charCodeAt(this.index + 2))) {
          this.index += 3;
          // Return it as is, without translating the byte.
          return '\\' + this.input.slice(sequenceStart, this.index);
        }
        return '\\' + this.input.charAt(this.index++);
      default:
        // \ddd, where ddd is a sequence of up to three decimal digits.
        if (this.isDecDigit(this.input.charCodeAt(this.index))) {
          while (this.isDecDigit(this.input.charCodeAt(++this.index)));
          return '\\' + this.input.slice(sequenceStart, this.index);
        }
        // Simply return the \ as is, it's not escaping any sequence.
        return this.input.charAt(this.index++);
    }
  }

  private scanStringLiteral(token: LToken): LToken {
    token.delimiter = this.input.charAt(this.index)
    token.enddelimiter = token.delimiter;
    var delimiter: number = this.input.charCodeAt(this.index++);
    var stringStart: number = this.index;
    var str: string = '';
    var charCode: number;
    while (this.index < this.length) {
      charCode = this.input.charCodeAt(this.index++);
      // ===  ' or "
      if (delimiter === charCode) break;
      if (92 === charCode) { // \
        var prefix = this.input.slice(stringStart, this.index - 1)
        var escape = this.readEscapeSequence()
        escape = querystring.unescape(escape)
        str += prefix + escape
        stringStart = this.index;
      }
      //"->没有了   or " ->换行了
      else if (this.index >= this.length || this.isLineTerminator(charCode)) {
        str += this.input.slice(stringStart, this.index - 1);
        token.line = this.line;
        token.lineStart = this.lineStart;
        token.range = new LRange(stringStart, this.index)
        token.error = new LError(LET.unfinishedString, str + String.fromCharCode(charCode))
        return token;
      }
    }
    str += this.input.slice(stringStart, this.index - 1);

    token.type = LTT.StringLiteral;
    token.value = str;
    token.line = this.line;
    token.lineStart = this.lineStart;
    token.range = new LRange(stringStart, this.index)
    return token;
  }

  private scanLongStringLiteral(token: LToken): LToken {
    var str = this.readLongString(token);
    // Fail if it's not a multiline literal.
    if (false === str) {

      token.line = this.line;
      token.lineStart = this.lineStart;
      token.range = new LRange(this.tokenStart, this.index)
      token.error = new LError(LET.expected, '[ 长字符串未 结尾   [[  ]]')
    } else {
      token.type = LTT.StringLiteral;
      token.value = str;
      token.line = this.line;
      token.lineStart = this.lineStart;
      token.range = new LRange(this.tokenStart, this.index)
    }
    return token;
  }

  private unexpected(token: LToken): LToken {
    var error: LError = new LError(LET.unexpected, token.value);
    var value: string = token.value + ""
    token.range = new LRange(this.tokenStart, this.tokenStart + value.length)
    token.line = this.line;
    token.lineStart = this.lineStart;
    token.error = error;
    return token;
  }

  private scanPunctuator(value: string, token: LToken): LToken {
    this.index += value.length;
    token.type = LTT.Punctuator;
    token.value = value;
    token.line = this.line;
    token.lineStart = this.lineStart;
    token.range = new LRange(this.tokenStart, this.index)
    return token;
  }

  private skipWhiteSpace(isAddWrapToken: boolean): void {
    while (this.index < this.length) {
      var charCode = this.input.charCodeAt(this.index);
      //空格 解析
      if (this.isWhiteSpace(charCode, true)) {
        this.index++;
      }
      //解析换行 
      else if (!this.consumeEOL(isAddWrapToken)) {
        break;
      }
    }
  }

  private EOLIndex: number = 0;

  private consumeEOL(isAddWrapToken: boolean): boolean {
    var charCode = this.input.charCodeAt(this.index);
    var peekCharCode = this.input.charCodeAt(this.index + 1);
    //判断是否换行
    if (this.isLineTerminator(charCode)) {
      if (10 === charCode && 13 === peekCharCode) this.index++;
      if (13 === charCode && 10 === peekCharCode) this.index++;
      this.line++;
      this.lineStart = ++this.index;
      if (isAddWrapToken) {
        if (this.EOLIndex < this.index) {
          var currenToken: LToken = null
          if (this.tokens.length > 0) {
            currenToken = this.tokens[this.tokens.length - 1]
          }
          // if (currenToken == null || currenToken.type != TokenTypes.Wrap) {
          var token: LToken = new LToken()
          token.type = LTT.Wrap;
          this.tokens.push(token);
        }
      }
      this.EOLIndex = this.index;
      return true;
    }
    return false;
  }

  private spaceCount: number = 0;
  private spaceIndex: number = -1;

  public isWhiteSpace(charCode, isAddTab: boolean): boolean {
    if (9 === charCode) {
      if (this.spaceIndex != this.index) {
        if (isAddTab) {
          var currenToken = null;
          if (this.tokens.length > 0) currenToken = this.tokens[this.tokens.length - 1]
          if (currenToken != null && currenToken.type != LTT.Wrap) {

            var token: LToken = new LToken();
            token.type = LTT.Tab
            this.tokens.push(token)
          }
        }
      }
      this.spaceIndex = this.index
      return true
    }
    if (32 === charCode || 0xB === charCode || 0xC === charCode) {
      if (this.spaceIndex != this.index) {
        this.spaceCount++;
        if (isAddTab) {
          if (this.spaceCount == 4) {
            if (this.tokens.length > 0) currenToken = this.tokens[this.tokens.length - 1]
            if (currenToken != null && currenToken.type != LTT.Wrap) {
              var token: LToken = new LToken();
              token.type = LTT.Tab
              this.tokens.push(token)
            }
            this.spaceCount = 0;
          }
        }
      }
      this.spaceIndex = this.index
      return true
    } else {
      this.spaceCount = 0;
      this.spaceIndex = this.index
      return false;
    }
  }

  public isLineTerminator(charCode): boolean {
    return 10 === charCode || 13 === charCode;
  }

  public isKeyword(id): boolean {
    switch (id.length) {
      case 2:
        return 'do' === id || 'if' === id || 'in' === id || 'or' === id;
      case 3:
        return 'and' === id || 'end' === id || 'for' === id || 'not' === id;
      case 4:
        return 'else' === id || 'goto' === id || 'then' === id;
      case 5:
        return 'break' === id || 'local' === id || 'until' === id || 'while' === id;
      case 6:
        return 'elseif' === id || 'repeat' === id || 'return' === id;
      case 8:
        return 'function' === id;
    }
    return false;
  }

  private isIdentifierStart(charCode): boolean {
    return (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || 95 === charCode;
  }

  private isIdentifierPart(charCode): boolean {
    return (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || 95 === charCode || (charCode >= 48 && charCode <= 57);
  }

  private isDecDigit(charCode) {
    return charCode >= 48 && charCode <= 57;
  }

  private isHexDigit(charCode) {
    return (charCode >= 48 && charCode <= 57) || (charCode >= 97 && charCode <= 102) || (charCode >= 65 && charCode <= 70);
  }

  private scanIdentifierOrKeyword(token: LToken): LToken {
    var value: any = null;
    var type;
    //循环检查 标志符 或者关键字
    while (this.isIdentifierPart(this.input.charCodeAt(++this.index)));
    //获取token
    value = this.input.slice(this.tokenStart, this.index);
    if (this.isKeyword(value)) {
      type = LTT.Keyword;
    } else if ('true' === value || 'false' === value) {
      type = LTT.BooleanLiteral;
      value = ('true' === value);
    } else if ('nil' === value) {
      type = LTT.NilLiteral;
      value = 'nil';
    } else {
      type = LTT.Identifier;
    }
    token.type = type;
    token.value = value;
    token.line = this.line;
    token.lineStart = this.lineStart;
    token.range = new LRange(this.tokenStart, this.index)
    return token;
  }
}