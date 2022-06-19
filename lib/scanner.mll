{
	open Parser
}

let digit = ['0' - '9']
let alpha = ['a' - 'z' 'A' - 'Z']
let sign = ['-' '+']

let number = sign? digit+
let hexnumer = "0x" digit+
let identifier = (alpha | '_') (alpha | digit | '_')*
let whitespace = [' ' '\n' '\r' '\t']+
let tmp = ('(' | ')' | '{' | '}' | '[' | ']' | '*') 

rule token = parse
	| number { INT (int_of_string (Lexing.lexeme lexbuf ))}
	| identifier { STRING (Lexing.lexeme lexbuf )}
	| tmp { token lexbuf }
	| '#' { c_preprocessor lexbuf }
	| whitespace { token lexbuf }
	| eof { EOF }
	| _ { raise (Failure ("???: '" ^ Lexing.lexeme lexbuf ^ "'")) }

and c_preprocessor = parse
	| '\n' { token lexbuf }
	| _ { c_preprocessor  lexbuf }
	