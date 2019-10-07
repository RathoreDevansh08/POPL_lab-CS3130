(* signature COUNTER *)
signature COUNTER = sig 
	val incr : unit -> unit
	val set : int -> unit
	val get : unit -> int
end

(* functor MkCounter that takes unit and gives out structure of signature COUNTER *)
functor MkCounter () : COUNTER = struct
	val x = ref 0

	fun incr () = let
			  	    val _ = x := !x + 1
			      in
			  	    ()
			      end
			  
	fun set y   = let
			  	    val _ = x := y
			      in
			  	    ()
			      end
			  
	fun get ()  = !x
	
end	


(* Example ---------------------> *)
	
structure A = MkCounter () ;
(* structure A : COUNTER *)

structure B = MkCounter () ;
(* structure B : COUNTER *)

A.set 42 ;
(* val it = () : unit *)

B.set 56 ;
(* val it = () : unit *)