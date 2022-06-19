%{
	open Ast
%}

%token <int> INT
%token <string> STRING
%token EOF

%start <Ast.interface> interface

%%

interface:
	| atom* EOF { Interface $1 }
	;

atom:
	| i=INT { Int i }
	| s=STRING { String s }
	;