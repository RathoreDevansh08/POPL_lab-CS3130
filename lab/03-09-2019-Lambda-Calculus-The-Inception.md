# Lambda Calculus: The inception

In the class we discussed lambda calculus. This exercise builds
towards a lambda calculus interpreter in standard ML.

1. Define an ML datatype `expr` that capture lambda calculus
   expressions. You may use strings to represent variables.

2. Write functions `free : expr -> string list` and `bound : expr ->
   string list` that computes free and bound variables in a given
   lambda calculus expression respectively.

3. Define a function `fresh : string list -> string` that computes
   a fresh variable name, i.e. `fresh xs` gives a string `x` which is
   different from all strings in `xs`. (Hint use diagonalisation).

4. Write a function `subst : expr -> string -> expr -> expr`, where
   `subst e₁ x e₂` substitutes in `e₁` all free occurance of `x` by
   `e₂`.

## Faster implementation (bonus, ungraded)

Here are some bonus questions that may be attempted if you are
interested.  This will require a bit of understanding of SML modules
that we have not yet covered. Hence these two exercises are ungraded.

1. Use the [`Atom` module][atom] of sml for faster variable
   comparisons.

2. In the exercise above, we have been using lists for really
   representing sets. Use the dedicated [set implementations][sets]
   (usually much faster that using lists


[atom]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/atom-sig.html>
[sets]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/ord-set-sig.html>
