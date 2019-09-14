datatype 'a Tree = nulltree
    | node of 'a Tree * 'a * 'a Tree ;
    
    
(* val map = fn : ('a  -> 'b) -> 'a Tree -> 'b Tree *)
fun map f nulltree           = nulltree
  | map f ( node (x, y, z) ) = node (map f x, f y, map f z);
