(* val map = fn : ('a -> 'b) -> 'a list -> 'b list *)
(*
    f: 'a -> 'b
    Domain of map : function f, list L
*)

fun map f (x::xs) = f x :: map f xs
    | map f [] = [];
