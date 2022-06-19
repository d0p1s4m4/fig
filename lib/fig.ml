let parse f s =
  let lexbuf = Lexing.from_string s in
  try f Scanner.token lexbuf with Parser.Error -> raise (Failure "Error")

let read_file file =
  let ch = open_in file in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s

let preprocess file =
  let tmp = Filename.temp_file file "prep" in
  let _ = Sys.command ("cpp " ^ file ^ " > " ^ tmp) in
  tmp

let compile file =
  let prep_file = preprocess file in
  Ast.dump_interface (parse Parser.interface (read_file prep_file))
