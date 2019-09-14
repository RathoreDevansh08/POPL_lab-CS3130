datatype Nat = O | S of Nat;

fun plus O y = y
    | plus (S x) y = S (plus x y);
(* 

val plus = fn : Nat -> Nat -> Nat 
Eg- plus (S O) (S (S O));
    val it = S (S (S O)) : Nat
    
*)
    
fun mul O y = O
    | mul (S O) y = y
    | mul (S x) y = plus (mul x y) y;
(* 

val mul = fn : Nat -> Nat -> Nat 
Eg- mul (S O) (S (S O));
    val it = S (S O) : Nat

*)
    
fun pow y O = (S O)
    | pow y (S x) = mul (pow y x) y;
(* 

val pow = fn : Nat -> Nat -> Nat 
Eg- pow O O;
    val it = S O : Nat
Eg- pow (S (S O)) (S (S O));
    val it = S (S (S (S O))) : Nat

*)
    
fun toInt O = 0
    | toInt (S x) = toInt(x) + 1;
(* 

val toInt = fn : Nat -> int 
Eg- toInt (S (S O));
    val it = 2 : int

*)    
    
    
