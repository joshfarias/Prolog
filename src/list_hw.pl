%%COMCS230 Assignment #5
%%Prof. Rivera
%% Prolog List Examples (List Problem Solutions)


forth(X,Y) :- nth0(3,X,Y).
%forth([_,_,_,X]|Y],X).

firstPair(X) :- nth0(0,X,Y1), nth0(1,X,Y2),  Y1=Y2.
%firstPair([X,X|_]).

del3(X,Y) :-  nth0(2,X,Y1),  select(Y1,Z,Y), X=Z.
%del([X, Y, Z|T], [X,Y|T]).


