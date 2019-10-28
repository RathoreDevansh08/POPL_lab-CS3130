# Unification algorithm

In the class we gave an algorithm to compute the most general unifier
for two types. The task of this assignment is to implement that
algorithm. You can use any structure that supports the
[ORD_MAP][ord_map] to store the solution of a unification, i.e. a
variable to type map. When using a map we cannot really talk about the
ordering of the substitutions (α₁,τ₁)...(αₙ,τₙ). So ensuring the
telescopic property needs to be appropriately modified.


## Bonus: Unification over general signatures (ungraded)

In general unification algorithm can be code for any signature. A
signature is a set Σ of function symbols `f₁,...,fₗ`, together with
their arities n₁,...,nₗ. The arity determine how many arguments the
function symbol takes and constants are function symbols with arity 0.

The terms over a signature Σ is defined recursively as follows.

1. A variable is a term.
2. A constant is a term (constants are functional symbols f in Σ that
   have arity 0)
3. If `t₁,...,tₙ` are terms and the function symbol `f` in Σ is of
   arity n then the `f (t₁,...,tₙ)` is a term.


Design a unification algorithm for an arbitrary signature. In the type
inference case, we use the signature that has basic types like bool as
arity zero function and -> as an arity 2 functional symbol.

[ord_map]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/ord-map-sig.html>
