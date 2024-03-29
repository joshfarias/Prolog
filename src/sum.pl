sum([],0).
sum([Head|Tail],X) :- sum(Tail,TailSum),
    X is Head + TailSum,
    write(Head), write(' '), write(Tail), write(' '), write(TailSum), write('\n').

