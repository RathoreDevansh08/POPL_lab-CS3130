datatype Nat = O | S of Nat;

(* Range function *)
(* val range = fn : int -> int -> int list *)

fun range n m = if n<m then n::(range (n+1) m)
                else if m<n then []
                else [m];


(* Factorial function *)
(* val fact = fn : int -> int *)
(* (op * ) => val it = fn : int * int -> int *)

fun fact n = foldl (op * ) 1 (range 2 n) ;
