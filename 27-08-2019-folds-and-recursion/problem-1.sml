(* val foo = fn : ('a -> bool) -> 'a * ('a list * 'a list) -> 'a list * 'a list *)
fun foo fo ( x , ( list1 , list2 ) ) = if ( fo x = true ) then ( ( x::list1 ) , list2 )
                                       else ( list1 , ( x::list2 ) ) ;
                         
(* val partition = fn : ('a -> bool) -> 'a list -> 'a list * 'a list *)                         
val partition = fn fo => foldr ( foo fo ) ( [], [] ) ; 


(* Example--> *)
(* val r = fn : int -> bool *)
fun r a = if a<5 then true
          else false ;
         
partition r [1,5,3,7,9] ; 
(* Output--> val it = ([1,3],[5,7,9]) : int list * int list *)