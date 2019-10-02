(* signature for SORT *)
signature SORT = sig
	type t
	val sort : t list -> t list
end

(* signature for ORD_KEY *)
signature ORD_KEY = sig
	type ord_key
	val compare : ord_key * ord_key -> order
end

(* Functor QSORT to produce a structure of signature SORT from a structure of signature ORD_KEY *)
functor QSort (O : ORD_KEY) : SORT = struct
	type t = O.ord_key
	
	fun less [] x      = [] 
	  | less (y::ys) x = if(O.compare (x,y) = GREATER) then y::(less ys x)
						 else if (O.compare (x,y) = EQUAL) then y::(less ys x)
						 else (less ys x)  
			
	fun great [] x      = []			 
	  | great (y::ys) x = if(O.compare (x,y) = LESS) then y::(great ys x)
						  else (great ys x) 
	
	fun sort []      = []
	  | sort (x::xs) = (sort (less xs x)) @ [x] @ (sort (great xs x)) ; 
end

structure IntOrd : ORD_KEY = struct
	type ord_key      = int
	fun compare (x,y) = Int.compare (x,y)
end


(* structure A : SORT *)
structure A = QSort (IntOrd) ;


(* Example --> *)
A.sort [ 7, 2, 5, 4 ]  ;
(*
   Output -->
   val it = [2,4,5,7] : A.t list
*)