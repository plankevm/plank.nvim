; Identifier conventions

; Assume all-caps names are constants
((identifier) @constant
 (#match? @constant "^[A-Z][A-Z\\d_]+$"))

; Assume uppercase names are types
((identifier) @type
 (#match? @type "^[A-Z]"))

; Function calls

(fn_call
  fn: (identifier) @function)
(fn_call
  fn: (member
    (identifier) @function.method .))

; Member/field access

(member (identifier) @property .)

; Struct field definitions and initializations

(field_def
  name: (identifier) @property)
(field_init
  name: (identifier) @property)

; Parameters

(param_def
  name: (identifier) @variable.parameter)

; Comments

(line_comment) @comment
(block_comment) @comment

; Punctuation - brackets

"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket

; Punctuation - delimiters

"::" @punctuation.delimiter
":" @punctuation.delimiter
"." @punctuation.delimiter
"," @punctuation.delimiter
";" @punctuation.delimiter

; Keywords

"as" @keyword
"comptime" @keyword
"const" @keyword
"else" @keyword
"fn" @keyword
"if" @keyword
"import" @keyword
"init" @keyword
"inline" @keyword
"let" @keyword
"mut" @keyword
"return" @keyword
"run" @keyword
"struct" @keyword
"while" @keyword

"or" @keyword
"and" @keyword

; Literals

(bool_literal) @boolean
(hex_literal) @number
(bin_literal) @number
(dec_literal) @number

; Operators

"=" @operator
"==" @operator
"!=" @operator
"<" @operator
">" @operator
"<=" @operator
">=" @operator
"|" @operator
"^" @operator
"&" @operator
"<<" @operator
">>" @operator
"+" @operator
"-" @operator
"+%" @operator
"-%" @operator
"*" @operator
"/" @operator
"%" @operator
"*%" @operator
"/+" @operator
"/-" @operator
"/<" @operator
"/>" @operator
"!" @operator
"~" @operator
