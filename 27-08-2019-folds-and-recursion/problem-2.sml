(* val foo = fn : ('a -> 'b) -> 'a * 'b list -> 'b list *)
fun foo fo ( x, list1 ) = ( fo x )::list1 ;

(* val map = fn : ('a -> 'b) -> 'a list -> 'b list *)
val map = fn fo => foldr ( foo fo ) [];


(* Example--> *)
(* val r = fn : int -> int *)
fun r a = a*a ;

map r [ 1, 2, 3, 4, 5 ];
(* Output--> val it = [1,4,9,16,25] : int list *)