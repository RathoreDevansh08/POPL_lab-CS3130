# List functions in SML

This assignment explores the list data type and the related functions.
As before, I suggest that you use the successive refinement strategy
to arrive at the function.

Since this is your first assignment, you will have to create a
repository for all your lab submissions as outlined in the
[README](./README.md) file.

Write ML functions for the following

1. Write the function `isEmpty : 'a list -> bool` which checks whether
   a list is empty or not.

2. The `map` function is defined in English as follows: `map` takes a function
   `f` and a list `l` and applies to all arguments of the list. Write the following

       - In the comments write the type of `map`
       - Define the function `map`

3. Define the `foldr` and `foldl` which loosely does the following.

        val foldr : ('a -> 'b -> 'b) -> 'a list -> 'b      -> 'b
        val foldl : ('b -> 'a -> 'b) -> 'b      -> 'a list -> 'b
        foldr f     [a₀,....,aₙ] b₀ = f  a₀ (f a₁.... (f aₙ b₀))
        foldl f  b₀ [a₀,....,aₙ]    = f (.... (f (f b₀ a₀) a₁)) aₙ

        (* If you thing of `f` as an operator ⊙ then the folds can be seen as

           foldr ⊙    [a₀,....,aₙ]  b₀ = a₀ ⊙ (a₁ ⊙ (.... (aₙ ⊙ b₀)))

           foldl ⊙ b₀ [a₀,....,aₙ]     = (((b₀ ⊙ a₀) ⊙ a₁) ... ⊙ aₙ₋₁) ⊙ aₙ

         *)

4. Write the function `range n m` which gives the list
   `[n,n+1,...,m]`.  Define factorial function using `range` and one
   of the `fold` functions. Instead of using your version of `fold`,
   use the one provided by the `List library` (note the types of the
   `foldl` and `foldr` function is different from the one we have
   defined. Also you can use `op +` to convert the operator `+` to its
   corresponding function.

        open List (* Get the functions in the List structure *)

