%{

  let escape s = 
    let substitutions = [("'","\\'");("(","\\(");(")","\\)");("/","\\/")] in
    let replace s (fst,snd) = Str.global_replace (Str.regexp fst) snd s in
    List.fold_left replace s substitutions

%}

%token <string> TEXT
%token SPACE
%token NEWLINE
%token BACKSPACE
%token APOSTROPHE
%token LBRACE
%token RBRACE
%token BACKSLASH
%token ESCAPE

%start main
%type <unit> main

%%

  main:
    TEXT       { print_endline $1; ignore(Sys.command ("adb shell input text \""^(escape $1)^"\"")) }
  | SPACE      { ignore(Sys.command "adb shell input keyevent 62") }
  | NEWLINE    { ignore(Sys.command "adb shell input keyevent 66") }
  | BACKSPACE  { ignore(Sys.command "adb shell input keyevent 67") }
  | BACKSLASH  { ignore(Sys.command "adb shell input keyevent 73") }
  | ESCAPE     { ignore(Sys.command "adb shell input keyevent 4") }
  ;
