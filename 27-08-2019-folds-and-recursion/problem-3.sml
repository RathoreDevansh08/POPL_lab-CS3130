(* val foo = fn : 'a * 'a list -> 'a list *)
fun foo ( x, list1 ) = [x] @ list1 ;

(* val reverse = fn : 'a list -> 'a list *)
fun reverse list = foldl foo [] list ; 
(* OR *)
val reverse = fn list => foldl foo [] list ;


(* Example--> *)
reverse [ 1, 2, 3, 4, 5 ] ;
(* Output--> val it = [5,4,3,2,1] : int list *)