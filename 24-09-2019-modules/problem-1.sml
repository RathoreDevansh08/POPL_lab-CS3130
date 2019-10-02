signature SORT = sig
	type t
	val sort : t list -> t list
end

signature ORD_KEY = sig
	type ord_key
	val compare : ord_key * ord_key -> order
end

functor QSort (O : ORD_KEY) : SORT = struct
	type t = O.ord_key
	
	fun less [] x      = [] 
	  | less (y::ys) x = if(O.compare (x,y) = GREATER) then y::(less ys x)
						 else if (O.compare (x,y) = EQUAL) then y::(less ys x)
						 else (less ys x)  
			
	fun great [] x      = []			 
	  | great (y::ys) x = if(O.compare (x,y) = LESS) then y::(great ys x)
						  else (great ys x) 
	
	fun sort [] = []
	  | sort (x::xs) = (sort (less xs x)) @ [x] @ (sort (great xs x)) ; 
end

structure IntOrd : ORD_KEY = struct
	type ord_key      = int
	fun compare (x,y) = Int.compare (x,y)
end ;

structure A = QSort (IntOrd) ;

A.sort [ 7, 2, 5, 4 ]  ;
