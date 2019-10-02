# Basic functions in SML

In this assignment we will do basic functions in standard ML. Even if
the solution is easy, I suggest that you write down the steps of
successive refinement (in the comments) so that you can manage more
complicated functions in the future.

Since this is your first assignment, you will have to create a
repository for all your lab submissions as outlined in the
[README](./README.md) file.

Write ML functions for the following

1. Tri-variate version of the `curry` and `uncurry` functions

2. `fst : 'a * 'b * 'c -> 'a` , `snd : 'a * 'b * 'c -> 'b`, and
   `thd : 'a * 'b * 'c -> 'c`.

3. The `plus`, `mul`, and `pow` functions for the `Nat` type defined
   in the class. Also write the helper function `toInt : Nat -> int`
   which will aid in debugging the above function

4. The `iterate` function that takes as argument an `n : Nat`, a
   function `f`, and a starting value `x0` and computes `f (f ... (f
   x0))` (`f` applied on `x0`, `n`-times). Rework `plus`, `mul`, and
   `pow` using `iterate`.
