(* File calc.ml *)
        let _ =
          try
            let lexbuf = Lexing.from_channel stdin in
            while true do
              Parser.main Lexer.token lexbuf
            done
          with Lexer.Eof ->
            exit 0
