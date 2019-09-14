datatype 'a Tree = nullTree
    | node of 'a Tree * 'a * 'a Tree ;


(* val rotate = fn : 'a Tree -> 'a Tree *)

fun rotate (node ((node (x,b,z)), a, ar))  = node (x, b, (node (z, a, ar)))
  | rotate x                               = x ;
