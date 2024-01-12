package org.intellij.sdk.language;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;

import static com.intellij.psi.TokenType.BAD_CHARACTER;
import static com.intellij.psi.TokenType.WHITE_SPACE;
import static org.intellij.sdk.language.psi.SppTypes.*;

%%

%{
  public _SppLexer() {
    this((java.io.Reader)null);
  }
%}

%public
%class _SppLexer
%implements FlexLexer
%function advance
%type IElementType
%unicode

EOL=\R
WHITE_SPACE=\s+

LINE_COMMENT=#.*
BLOCK_COMMENT="/"\*([^*]|\*[^/])*\*"/"
NEWLINE=\n
SPACE=[ \t\n\x0B\f\r]+
LX_REGEX=r\"[^\"]*\"
LX_IDENTIFIER=[a-z_][a-z0-9_]*
LX_UPPER_IDENTIFIER=[A-Z][a-zA-Z0-9_]*
LX_BIN_DIGITS=0b[01]+
LX_HEX_DIGITS=0x[0-9a-f]+
LX_DEC_DIGITS=[0-9]+(_[0-9]+)*
LX_DEC_FLOAT=[0-9]+(_[0-9]+)*\.[0-9]+(_[0-9]+)*
LX_DOUBLE_QUOTE_STR=\"[^\"]*\"

%%
<YYINITIAL> {
  {WHITE_SPACE}               { return WHITE_SPACE; }

  "&&"                        { return TK_LOGICAL_AND; }
  "&&="                       { return TK_LOGICAL_AND_ASSIGN; }
  "||"                        { return TK_LOGICAL_OR; }
  "||="                       { return TK_LOGICAL_OR_ASSIGN; }
  "&"                         { return TK_BIT_AND; }
  "&="                        { return TK_BIT_AND_ASSIGN; }
  "|"                         { return TK_BIT_OR; }
  "|="                        { return TK_BIT_OR_ASSIGN; }
  "^"                         { return TK_BIT_XOR; }
  "^="                        { return TK_BIT_XOR_ASSIGN; }
  "<<"                        { return TK_BIT_SHIFT_LEFT; }
  "<<="                       { return TK_BIT_SHIFT_LEFT_ASSIGN; }
  ">>"                        { return TK_BIT_SHIFT_RIGHT; }
  ">>="                       { return TK_BIT_SHIFT_RIGHT_ASSIGN; }
  "<<<"                       { return TK_BIT_ROTATE_LEFT; }
  "<<<="                      { return TK_BIT_ROTATE_LEFT_ASSIGN; }
  ">>>"                       { return TK_BIT_ROTATE_RIGHT; }
  ">>>="                      { return TK_BIT_ROTATE_RIGHT_ASSIGN; }
  "=="                        { return TK_EQ; }
  "!="                        { return TK_NE; }
  ">="                        { return TK_GE; }
  "<="                        { return TK_LE; }
  ">"                         { return TK_GT; }
  "<"                         { return TK_LT; }
  "<=>"                       { return TK_SS; }
  "+"                         { return TK_ADD; }
  "+="                        { return TK_ADD_ASSIGN; }
  "-"                         { return TK_SUB; }
  "-="                        { return TK_SUB_ASSIGN; }
  "*"                         { return TK_MUL; }
  "*="                        { return TK_MUL_ASSIGN; }
  "/"                         { return TK_DIV; }
  "/="                        { return TK_DIV_ASSIGN; }
  "%"                         { return TK_REM; }
  "%="                        { return TK_REM_ASSIGN; }
  "%%"                        { return TK_MOD; }
  "%%="                       { return TK_MOD_ASSIGN; }
  "**"                        { return TK_POW; }
  "**="                       { return TK_POW_ASSIGN; }
  "("                         { return TK_PAREN_L; }
  ")"                         { return TK_PAREN_R; }
  "["                         { return TK_BRACK_L; }
  "]"                         { return TK_BRACK_R; }
  "{"                         { return TK_BRACE_L; }
  "}"                         { return TK_BRACE_R; }
  "??"                        { return TK_COALESCE; }
  "??="                       { return TK_COALESCE_ASSIGN; }
  "?"                         { return TK_QST; }
  ".."                        { return TK_VARIADIC; }
  ":"                         { return TK_COLON; }
  "."                         { return TK_DOT; }
  ","                         { return TK_COMMA; }
  "="                         { return TK_ASSIGN; }
  "->"                        { return TK_ARROW_R; }
  "@"                         { return TK_AT; }
  "mod"                       { return KW_MOD; }
  "cls"                       { return KW_CLS; }
  "sup"                       { return KW_SUP; }
  "fun"                       { return KW_FUN; }
  "use"                       { return KW_USE; }
  "let"                       { return KW_LET; }
  "mut"                       { return KW_MUT; }
  "if"                        { return KW_IF; }
  "else"                      { return KW_ELSE; }
  "while"                     { return KW_WHILE; }
  "with"                      { return KW_WITH; }
  "ret"                       { return KW_RET; }
  "yield"                     { return KW_YIELD; }
  "where"                     { return KW_WHERE; }
  "is"                        { return KW_IS; }
  "as"                        { return KW_AS; }
  "true"                      { return KW_TRUE; }
  "false"                     { return KW_FALSE; }
  "self"                      { return KW_SELF; }
  "Self"                      { return KW_SELF_TYPE; }
  "on"                        { return KW_ON; }
  "async"                     { return KW_ASYNC; }
  "TK_AS"                     { return TK_AS; }

  {LINE_COMMENT}              { return LINE_COMMENT; }
  {BLOCK_COMMENT}             { return BLOCK_COMMENT; }
  {NEWLINE}                   { return NEWLINE; }
  {SPACE}                     { return SPACE; }
  {LX_REGEX}                  { return LX_REGEX; }
  {LX_IDENTIFIER}             { return LX_IDENTIFIER; }
  {LX_UPPER_IDENTIFIER}       { return LX_UPPER_IDENTIFIER; }
  {LX_BIN_DIGITS}             { return LX_BIN_DIGITS; }
  {LX_HEX_DIGITS}             { return LX_HEX_DIGITS; }
  {LX_DEC_DIGITS}             { return LX_DEC_DIGITS; }
  {LX_DEC_FLOAT}              { return LX_DEC_FLOAT; }
  {LX_DOUBLE_QUOTE_STR}       { return LX_DOUBLE_QUOTE_STR; }

}

[^] { return BAD_CHARACTER; }
