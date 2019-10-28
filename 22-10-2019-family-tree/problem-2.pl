%% More facts so that we can query for ancestor relation ===>
man(shiv).
man(sanjay).
man(vijay).
man(vinny).
woman(urmila).
woman(kusum).
woman(tanu).
parent(sanjay, shiv).
parent(vijay, shiv).
parent(sanjay, urmila).
parent(vijay, shiv).
parent(vinny, vijay).
parent(tanu, vijay).
parent(vinny, kusum).
parent(tanu, kusum).

%%% Facts end here %%%%%%%%%%%%%%%%%%%

mother(X,Y)  :- woman(Y), parent(X,Y).
father(X,Y)  :- man(Y), parent(X,Y).
sibling(X,Y) :- dif(X,Y), father(X,Z), father(Y,Z), mother(X,M), mother(Y,M).
brother(X,Y) :- man(Y), sibling(X,Y).
sister(X,Y)  :- woman(Y), sibling(X,Y).

%% Ancestor relation ===>
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

/* Examples ===>

?- ancestor(vinny, sanjay).
false.

?- ancestor(vinny, shiv).
true .

?- ancestor(vinny, tanu).
false.

*/
