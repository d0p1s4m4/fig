open Cmdliner

let version = "%%VERSION%%"

let fig files = 
	print_endline (String.concat ", " (List.map Fig.compile files))

let files =
	Arg.(non_empty & pos_all file [] & info [] ~docv:"FILE")

let cmd =
	let doc = "Fukurō Interface Generator" in
	let sdocs = Manpage.s_common_options in
	let info = Cmd.info "fig" ~version ~doc ~sdocs in
	Cmd.v info Term.(const fig $ files)

let () = exit (Cmd.eval cmd)
