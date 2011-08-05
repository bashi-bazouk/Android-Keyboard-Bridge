
{
  open Parser        (* The type token is defined in parser.mli *)
  exception Eof
}

rule token = parse
    '\n'         { token lexbuf }
  | ' '          { SPACE }
  | "\\b"        { BACKSPACE }
  | "\\n"        { NEWLINE }
  | "\\e"        { ESCAPE }
  | "\\"|"\\\\"  { BACKSLASH }
  | eof          { raise Eof }
  | ([^'\n' '\\' ' ']* as s) 
    { TEXT(s) }
