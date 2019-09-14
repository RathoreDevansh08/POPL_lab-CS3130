(* fst: 'a*'b*'c->'a *)
(* 

by pattern matching (x,y,z):('a*'b*'c)
function only considers first entry in (x,y,z)

*)
fun fst (x,_,_)=x;

(* snd: 'a*'b*'c->'b *)
(*

by pattern matching (x,y,z):('a*'b*'c)
function only considers second entry in (x,y,z)

*)
fun snd (_,y,_)=y;

(* thd: 'a*'b*'c->'c *)
(*

by pattern matching (x,y,z):('a*'b*'c)
function only considers third entry in (x,y,z)

*)
fun thd (_,_,z)=z;
