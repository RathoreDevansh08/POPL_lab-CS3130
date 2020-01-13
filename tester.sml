(* Control.Print.printDepth := 1024; *)
datatype monotype = Var of string
                  | Bool
                  | App of monotype * monotype;

datatype scheme = Polytype of (string list * monotype);
datatype result = Pair of (string * monotype);

(*---------------------------------_some_required_functions_-----------------------------------*)
(*
val sub         = fn : result -> monotype -> monotype
val subst       = fn : result list -> monotype -> monotype
val mentions    = fn : string -> monotype -> bool
val composition = fn : result list -> result list -> result list
*)


fun subst [] t     = t
  | subst (e::E) t =
  let
    fun sub (Pair(x, y)) (Var z) = if (x = z) then y else (Var z)
      | sub e (App (m1, m2))     = App (sub e m1, sub e m2)
      | sub e Bool               = Bool
  in
    subst E (sub e t)
  end;

fun mentions x (Var y)        = (x = y)
  | mentions x (App (e1, e2)) = mentions x e1 orelse mentions x e2
  | mentions x Bool           = false;

fun composition [] tau                  = tau
  | composition ((Pair(v, t))::pho) tau = (Pair(v, subst tau t))::(composition pho tau);

  (*---------------------------------__Most_general_unifier__------------------------------------*)

(*
val mgu = fn : (monotype * monotype) list -> result list
*)

exception Unify;

fun mgu []            = []
  | mgu ((t1, t2)::L) =
  let
    val pho        = mgu L
    val (t1', t2') = (subst pho t1, subst pho t2)
    val tau        =
      case (t1', t2') of
           (Var x, Var z)             => if (x = z) then [] else [ Pair (x, Var z) ]
         | (Var x, b)                 => if (mentions x b) then raise Unify else [ Pair (x, b) ]
         | (a, Var y)                 => if (mentions y a) then raise Unify else [ Pair (y, a) ]
         | (Bool, Bool)               => []
         | (App(a1, a2), App(b1, b2)) => mgu [(a1, b1), (a2, b2)]
         | (_, _)                     => raise Unify
  in
    composition pho tau
  end;

  (* ------------------everything below is just to test in a pretty format-------------------------*)
  (* -----------------------------------_____Test_Cases____----------------------------------------*)
val (green, yellow, normal, pink) = ("\027[1;32m", "\027[1;33m", "\027[1;0m", "\027[1;35m");

val tests = [[(App(Var "hello", Var "world"), Var "test")],

            [((App(Bool, Bool)), App(Var "x", Var "y"))],

            [((App(Var "z", Var "w")), App(Var "x", Var "y"))],

            [(App(Var "Alpha", Bool), App(Var "Gamma", Var "Gamma")), (Var
            "Beta", Var "Gamma")],

            [(App(Var "Alpha", Var "Beta"), App(Var "Gamma", Var "Gamma"))],

            (* Uncommenting the test below will result in exception because there is no solution for this case*)
            (* [(App(App(Var "Alpha", Var "Beta"), Var "Beta"), App(Var "Gamma", Var "Gamma"))], *)

            [(App(App(Var "Alpha", Var "Beta"), App(Var "Alpha", Var "Beta")), App(Var "Gamma", Var "Gamma"))],

            [(App(App(Var "Alpha", Var "Beta"), App(Var "Alpha", Var "Beta")),
            App(App(Var "Gamma", Var "Gamma"), App(Var "Gamma", Var "Gamma")))]
            ];

fun run_tests []             = green ^ "Testing finished...\n" ^ normal
  | run_tests (test::t_list) =
let
  fun pretty (Var x)        = x
    | pretty (App(a1, a2))  = yellow ^ " ( " ^ normal ^ (pretty a1) ^ yellow ^ " -> " ^
    normal ^ (pretty a2) ^ yellow ^ " ) " ^ normal
    | pretty Bool           = "bool";

  fun showSubt (Pair(x, z)) = " [ " ^ pink ^ x ^ normal ^ " : " ^ (pretty z) ^ " ] ";

  fun showResult []         = "\n"
    | showResult (a::L)     = (showSubt a) ^ "\n" ^ (showResult(L));

  fun showTest []           = "\n"
    | showTest ((x, y)::L)  = " [ " ^ pretty(x) ^ ", " ^ pretty(y) ^ " ]\n" ^ (showTest L);
  val strTest               = showTest test;
  val res                   = mgu test;
  val strResult             = showResult res;
in
  green ^ "Test Case # \n" ^ normal ^ strTest ^ "\n" ^ yellow ^
  " Resulting substitutions : \n" ^ normal ^ strResult
  ^ "-----------------------------------------------\n" ^ run_tests t_list
end;

print(run_tests tests);
