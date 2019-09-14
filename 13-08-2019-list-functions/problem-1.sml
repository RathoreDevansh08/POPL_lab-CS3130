(* val isEmpty = fn : 'a list -> bool *)
(* 
By pattern matching, only for empty string the isfunction returns true, for every other case its false
*)

fun isEmpty [] = true
   | isEmpty _ = false;
