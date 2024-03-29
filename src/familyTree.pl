% Facts about family members
male(john).
male(jim).
male(bob).
female(jane).
female(sue).
female(lisa).
parent_of(john, jim).
parent_of(john, jane).
parent_of(jim, sue).
parent_of(bob, lisa).
parent_of(jane, lisa).

% Rules for determining family relationships
father_of(Father, Child) :-
    parent_of(Father, Child), male(Father),
    format('~w is the father of ~w.~n', [Father, Child]).
mother_of(Mother, Child) :-
    parent_of(Mother, Child), female(Mother),
    format('~w is the mother of ~w.~n', [Mother, Child]).
sibling_of(Sibling1, Sibling2) :-
    parent_of(Parent, Sibling1), parent_of(Parent, Sibling2),
    Sibling1 \= Sibling2,
    format('~w is a sibling of ~w.~n', [Sibling1, Sibling2]).
