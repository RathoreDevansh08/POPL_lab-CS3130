(* signature COUNTER *)
signature COUNTER = sig 
	val incr : unit -> unit
	val set : int -> unit
	val get : unit -> int
end

(* structure Counter of signature COUNTER *)
structure Counter : COUNTER = struct
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
	
end ;


(* Example ---------------------> *)

Counter.set 7 ;
(* val it = () : unit *)

Counter.incr () ;
(* val it = () : unit *)

Counter.get () ;
(* val it = 8 : int *)	