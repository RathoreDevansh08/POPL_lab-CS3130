datatype 'a option = NONE | SOME of 'a ;

(* val foo = fn : 'a * (int -> 'a option) -> int -> 'a option *)
fun foo (x,fo) n = if(n=0) then SOME x
                   else fo (n-1) ;
                  
(* val nth = fn : 'a list -> int -> 'a option *)  
(* To find value at nth index in a list *)
fun nth n = foldr foo (fn x => NONE) n ;           


(* Example--> *)
nth [8,9,7,11,10,5,6] 1 ;
(* Output--> val it = SOME 9 : int option *)