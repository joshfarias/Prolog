%Josh Farias
%Professor Morales
%COMSC230
%Assignment 5
%Prolog Family Tree

% defines females and males
female(ava).
female(bella).
female(chloe).
female(emma).

male(adam).
male(bret).
male(corey).
male(frank).

% defines relationships
parent(ava, bella).
parent(ava, bret).
parent(bella, frank).
parent(emma, chloe).

parent(adam, bella).
parent(adam, bret).
parent(corey, frank).
parent(bret, chloe).

% mother predicate X is mother of Y
mother(X,Y) :-
    female(X),
    parent(X, Y).

% father predicate X is father of Y
father(X, Y) :-
    male(X),
    parent(X, Y).

% sister predicate
sister(X, Y) :-
    female(X),
    parent(Z, Y),
    parent(Z, X),
    not(X = Y).

% grandson predicate X is grandson of Y
grandson(X, Y) :-
    male(X),
    parent(Z, X),
    parent(Y, Z).

% firstCousing predicate X is the firstCousin of Y
% firstCousins are frank and chloe

firstCousin(X, Y) :-
    X \= Y,
    parent(P1, X),
    parent(P2, Y),
    P1 \= P2,
    parent(Z, P1),
    parent(Z, P2).

% descendant predicate X is descendant of Y
descendant(X, Y) :-
    parent(Y, X).
descendant(X, Y) :-
    parent(Z, X),
    descendant(Z, Y).
