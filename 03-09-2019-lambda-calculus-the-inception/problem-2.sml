datatype expr = Variable of string
              | Application of expr * expr
              | Lambda of string * expr ;
              

(* Function to delete an element from list *)
(* val delete = fn : ''a -> ''a list -> ''a list *)
fun delete y []        = []
  | delete y (x :: xs) = if (y = x) then delete y xs
                         else x :: (delete y xs) ;
                             
                             
(* Function to extract all free variables from an expression into a list *)                             
(* val free = fn : expr -> string list *)                             
fun free (Variable x)           = [x]
  | free (Application (e1, e2)) = (free e1) @ (free e2)
  | free (Lambda (x, e))        = delete x (free e) ;
  
  
(* Function to extract all the variables from an expression into a list *)  
(* val all = fn : expr -> string list *)  
fun all (Variable x)           = [x]
  | all (Application (e1, e2)) = (all e1) @ (all e2)
  | all (Lambda (x, e))        = all e ;
  

(* Function to check if a variable is in freelist(list of free variables) or not *)
(* val check_free = fn : ''a -> ''a list -> bool *)
fun check_free y []        = false
  | check_free y (x :: xs) = if (y = x) then true
                             else check_free y xs ;
                             

(* Function to delete variables from a given list if it is a free variable and return the left out list *)
(* val delete_free = fn : ''a list -> ''a list -> ''a list *)
fun delete_free [] freelist        = []
  | delete_free (x :: xs) freelist = if (check_free x freelist = false) then x :: (delete_free xs freelist)
                                    else (delete_free xs freelist) ;
                                    

(* Function to return a list of bound variables in an expression *)
(* val bound = fn : expr -> string list *)
fun bound exp = delete_free (all exp) (free exp) ;


(* Example--> *)
(* λy.λx.(x(uy)) *)
val exa = Lambda("y", Lambda("x", Application(Variable("x"), Application(Variable("u"), Variable("y"))))) ;
val ans_all = all exa ;
val ans_free = free exa ;
val ans_bound = bound exa ;
(* Answer--> *)
(*
val exa = Lambda ("y",Lambda ("x",Application #)) : expr
val ans_all = ["x","u","y"] : string list
val ans_free = ["u"] : string list
val ans_bound = ["x","y"] : string list
*)

