man(arjun).
man(pandu).
man(bheem).
man(yudhistir).
woman(kunti).
woman(madri).
parent(arjun, pandu).
parent(arjun, kunti).
parent(bheem, pandu).
parent(bheem, kunti).
parent(yudhistir, pandu).
parent(yudhistir, kunti).

parent(nakul, pandu).
parent(nakul, madri).
parent(sahadev, pandu).
parent(sahadev, madri).

%%% Facts end here %%%%%%%%%%%%%%%%%%%

mother(X,Y)  :- woman(Y), parent(X,Y).
father(X,Y)  :- man(Y), parent(X,Y).
sibling(X,Y) :- dif(X,Y), father(X,Z), father(Y,Z), mother(X,M), mother(Y,M).
brother(X,Y) :- man(Y), sibling(X,Y).
sister(X,Y)  :- woman(Y), sibling(X,Y).

%% Exercise ===>
%%
%% Q. What happens when the brother definition does not have dif
%% A. If there is no dif in brother relation(actually sibling relation), then same person can be a brother(actually 
%%    sibling) of itself.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%% Q. Write a half brother relation similar to brother.
%% A. Half brother: a brother with whom one has 'only' one parent in common. Therefore,
%% case 1: when mother is same, father is different.
halfbrother(X,Y) :- mother(X,M), mother(Y,M), father(X,Q), father(Y,W), dif(Q,W), man(Y).
%% case 2: when father is same, mother is different.
halfbrother(X,Y) :- mother(X,Q), mother(Y,W), father(X,F), father(Y,F), dif(Q,W), man(Y).
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



