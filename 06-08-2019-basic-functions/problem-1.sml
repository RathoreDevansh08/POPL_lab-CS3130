(* CURRY *)
(* 

val curry = fn : ('a * 'b * 'c -> 'd) -> 'a -> 'b -> 'c -> 'd
curry f: 'a->'b->'c->'d
curry f x: 'b->'c->'d
curry f x y: 'c->'d
curry f x y z: 'd
curry f x y z: f(x,y,z)

 *)
fun curry f x y z = f(x,y,z);


(* UNCURRY *)
(*

val uncurry = fn : ('a -> 'b -> 'c -> 'd) -> 'a * 'b * 'c -> 'd
uncurry f:'a*'b*'c->'d
by pattern matching, (x,y,z): ('a*'b*'c)
uncurry f(x,y,z)=f x y z;

*)
fun uncurry f(x,y,z)=f x y z;
