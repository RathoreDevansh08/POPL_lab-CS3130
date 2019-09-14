datatype Nat = O | S of Nat;

fun iterate O f x0 = x0
    | iterate (S n) f x0 = iterate n f (f x0);

fun toInt O = 0
    | toInt (S n) = 1 + toInt n;

(* plus, mult, pow *)

(* Plus: *)
fun plus x y = iterate y S x;

(* Mul: *)
fun mul x y = iterate y (plus x) O;

(* Pow: *)
fun pow x n = iterate n (mul x) (S O);

