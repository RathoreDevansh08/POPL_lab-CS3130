datatype 'a Tree = nullTree
    | node of 'a Tree * 'a * 'a Tree ;
    
  
(* val recTree = fn : 'a -> ('a * 'b * 'a -> 'a) -> 'b Tree -> 'a *)

fun recTree b f nullTree       = b
  | recTree b f (node (x,y,z)) = f ((recTree b f x), y, (recTree b f z)) ;
  
  
(* function to create sample nodes for constructing tree *)
fun createNode a = node (nullTree, a, nullTree) ;
