(* Computing fresh variable name using Diagnolization *)

(* Function to replace a character at an index to a different value *)
(* val change = fn : string -> string *)
fun change "a" = "b" 
  | change _   = "a" ;


(* 
    Function to generate a string using diagnolization and added "a" in the end so as to avoid the cases where all the possible strings
    of a given length are occupied under the constraints of limited characters ("special exception case").
*)
(* val diag = fn : string list -> int -> string *)
fun diag [] _      = "a"
  | diag (x::xs) i = if ((size x)>i) then (change (substring (x, i, 1))) ^ (diag (xs) (i+1))
                      else diag xs i ;

(* Function to generate fresh variable *)
(* val fresh = fn : string list -> string *)
fun fresh ls = diag ls 0;


(* Example--> *)
fresh ["12a", "b", "aa", "aba"] ;    
(* Answer--> val it = "abba" : string *)

(* Handling "special exception case" *)
fresh ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"] ;
(* Answer--> val it = "ba" : string *)