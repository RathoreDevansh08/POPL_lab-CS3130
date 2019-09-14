(* foldr *)
(* val foldr = fn : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)

fun foldr f (a::xs) b = f a (foldr f xs b)
  | foldr f [] b = b;
  


(* foldl *)
(* val foldl = fn : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)

fun foldl f b (a::xs) = foldl f (f b a) xs
  | foldl f b [] = b; 
