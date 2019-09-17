datatype expr = Variable of string
    | Application of expr * expr
    | Lambda of string * expr ;


(* val subst = fn : expr -> string -> expr -> expr *)
fun subst (Variable y) x e           = if (y=x) then e
                                       else Variable y
  | subst (Application (e1, e2)) x e = Application (subst e1 x e, subst e2 x e)
  | subst (Lambda (y, e1)) x e       = if (y=x) then Lambda (y, e1) 
                                       else Lambda (y, subst e1 x e) ;