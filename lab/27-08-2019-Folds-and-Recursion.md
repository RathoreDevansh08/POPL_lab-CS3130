# Folds and Recursion.

Instead of using explicit recursion, define the following library
function in terms of either `foldr` or `foldl` which ever is
convenient. For the documentation of these library function, read the
documentation of the [`List`
structure](http://sml-family.org/Basis/list.html)


1. `partition : ('a -> bool) -> 'a list -> 'a list * 'a list`

2. `map : ('a -> 'b) -> 'a list -> 'b list`.

3. `reverse : 'a list -> 'a list`

4. `nth : 'a list * int -> 'a option`.

## Hints.


1. Be careful with `reverse` as the obvious version of reverse will
   have running time O(n²). Instead get an O(n) version (Hint: For
   this case `foldl` might be more convenient).

2. For the `nth` function, the curried version would be easier
   `nthCurried : 'a list -> int -> 'a option`
