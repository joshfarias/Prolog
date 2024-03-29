%Josh Farias
%Professor Morales
%COMSC230
%Assignment 5
%Prolog Assign 2

% fourth predicate prints 4th element in list

fourth([_, _, _, X|_], X).

% firstPair predicate returns true if match

firstPair([X, X|_]).

%del3 predicate deletes 3rd element in list

del3([A, B, C|T], [A, B|T]).

