(lang dune 3.2)

(name fig)

(generate_opam_files true)

(source
 (github d0p1s4m4/fig))

(authors "d0p1")

(maintainers "d0p1")

(license LICENSE)

;(documentation https://url/to/documentation)

(using menhir 2.0)

(package
 (name fig)
 (synopsis "Fukurō Interface Generator")
 (description "The Fukurō Interface Generator (FIG) is an IDL compiler.")
 (depends ocaml dune cmdliner)
 (tags
  (topics IDL DSL)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
