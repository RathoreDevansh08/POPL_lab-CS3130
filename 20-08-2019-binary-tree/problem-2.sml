datatype 'a Tree = nulltree
    | node of 'a Tree * 'a * 'a Tree ;
 
(* List Concatination function *)
(* val cc = fn : 'a list -> 'a list -> 'a list *)
fun cc [] x      = x
  | cc (x::xs) y = x :: (cc xs y); 

(* val ino = fn : 'a Tree -> 'a list *)
fun ino nulltree           = []
  | ino ( node (x, y, z) ) = cc (ino x) (y :: ino z);

(* val pre = fn : 'a Tree -> 'a list *)
fun pre nulltree           = []
  | pre ( node (x, y, z) ) = cc (y :: pre x) (pre z);
  
(* val pos = fn : 'a Tree -> 'a list *)
fun pos nulltree = []
  | pos ( node (x, y, z) ) = cc (pos x) (cc (pos z) [y]) ;
