kb : lexer.mll parser.mly kb.ml
	ocamllex lexer.mll       # generates lexer.ml
	ocamlyacc parser.mly     # generates parser.ml and parser.mli
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml
	ocamlc -c kb.ml
	ocamlc -o kb str.cma lexer.cmo parser.cmo kb.cmo

.PHONY : clean install

clean: 
	-rm parser.mli kb.cmi kb.cmo lexer.cmi lexer.cmo lexer.ml parser.cmi parser.cmo parser.ml

install: kb
	chmod 755 kb
	cp kb /usr/local/bin/kb