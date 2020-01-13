Control.Print.printDepth := 100;


(* Exception : unification not possible *)
exception Unification_Error ;

(* Monotype declaration*)
datatype monotype = TypVar of string
    			| Basic of string
    			| FunTyp of monotype * monotype ;



(* The key of the map of signature ORD_KEY *)
structure StringKey : ORD_KEY = struct

    type ord_key = string
    fun compare (s1, s2) = String.compare (s1, s2)

end 

(* Map structure from RedBlackMapFn functor *)
structure Map = RedBlackMapFn (StringKey)



(* Function to check if a monotype contains alpha as a free variable or not , with return type bool *)
(* val checkforFreeVar = fn : string -> monotype -> bool *)
fun checkforFreeVar a (TypVar b) 	     = ( if(a = b) then true else false )
  | checkforFreeVar a (Basic u)   	     = false
  | checkforFreeVar a (FunTyp (e1, e2))  = (checkforFreeVar a e1) orelse (checkforFreeVar a e2)
  
  

(* Function to substitute the telescope into the monotype passed as input argument *)
(* val substituteEach = fn : monotype Map.map -> monotype -> monotype *)
fun substituteEach telescope (TypVar alpha) 	  = let 
										val ispresent = Map.find (telescope, alpha)     (* ispresent : 'a option *)
								    in
								    		case ispresent of
								    			NONE => TypVar alpha
								    		      | SOME(value) => value	
								    end
  | substituteEach telescope (Basic u) 	   	  = Basic u
  | substituteEach telescope (FunTyp (e1, e2)) = (
								let 
									val e11 = substituteEach telescope e1
									val e12 = substituteEach telescope e2
								in
									FunTyp (e11, e12)
								end
							  )

(* Function to substitute free variables in ( monotype, monotype ) using the telescope *)
(* val substitute = fn : monotype Map.map -> monotype * monotype -> monotype * monotype *)
fun substitute telescope (monotype1, monotype2) = (substituteEach telescope monotype1, substituteEach telescope monotype2)



(* Function to apply unification algorithm on a (monotype * monotype) list *)
(* val unifyList = fn : (monotype * monotype) list -> monotype Map.map *)
fun unifyList [] = Map.empty                                        
  | unifyList ((monotype1, monotype2) :: mlist) = (
        let 
        	(* To Unify the current two monotypes *)
            val telescope1 = unify (monotype1, monotype2) 
            
            (* To Substitute this monotype on rest of the monotype pairs *)                       
            val mlist2 = List.map (substitute telescope1) mlist          
            
            (* To Unify the monotype pairs in the rest of the input list*)     
            val telescope2 = unifyList mlist2                            
        in
            Map.unionWith (fn (u, v) => if(u <> v) then raise Unification_Error else u) (telescope1, telescope2) 
            (* If both the telescopes give different values to the same variable, then Unification_Error *)
        end
    )

(* Function to unify two monotypes and return the telescope *)
(* val unify = fn : monotype * monotype -> monotype Map.map *)									  
and   unify (TypVar alpha, TypVar beta) = ( if(alpha = beta) then Map.empty else Map.singleton (alpha, TypVar beta) )
(* NOTE: We have used and keyword as unify calls unifylist and unifylist calls unify recursively *)
									
    | unify (TypVar alpha, Basic u) = Map.singleton (alpha, Basic u)  
    
    | unify (TypVar alpha, FunTyp (e1, e2)) = (                        
        if (((checkforFreeVar alpha e1) orelse (checkforFreeVar alpha e2)) = true) then raise Unification_Error
            else Map.singleton (alpha, FunTyp (e1, e2))
    )
    
    | unify (Basic u, TypVar alpha) = unify (TypVar alpha, Basic u)  
      
    | unify (Basic u, Basic v) = (                                  
						if (u <> v) then raise Unification_Error
							else Map.empty
					   )
								 
    | unify (Basic u, FunTyp (e1, e2)) = raise Unification_Error         

    | unify (FunTyp (e1, e2), TypVar alpha) = unify (TypVar alpha, FunTyp (e1, e2))
    
    | unify (FunTyp (e1, e2), Basic u) = unify (Basic u, FunTyp (e1, e2))        
    
    | unify (FunTyp (e1, e2), FunTyp (e11, e12)) = unifyList [(e1, e11), (e2, e12)]   



(* Example -----> *)
(* val telescope = - : monotype Map.map *)
 (* val telescope = unifyList [(FunTyp(TypVar "t1", TypVar "t2"), FunTyp ( FunTyp (TypVar "t3", TypVar "t4"), FunTyp (TypVar "t5", TypVar "t6") ))] ; *)

val telescope = unifyList [( (FunTyp(TypVar "alpha", Basic "b1")), (FunTyp(TypVar "t1", TypVar "t1")) )] 

(* val telescope_list =
  [("t1",FunTyp (TypVar "t3",TypVar "t4")),
   ("t2",FunTyp (TypVar "t5",TypVar "t6"))]
  : (StringKey.ord_key * monotype) list
 *)
val telescope_list = Map.listItemsi telescope










