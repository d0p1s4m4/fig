type atom = Int of int | String of string
type interface = Interface of atom list

let dump_atom = function
  | Int i -> "Int(" ^ string_of_int i ^ ")"
  | String s -> "Str(" ^ s ^ ")"

let dump_interface (Interface atoms) =
  String.concat ", " (List.map dump_atom atoms)
