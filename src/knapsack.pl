
/*weight(L,N) takes a list L of food terms, each
of the form food(Name,Weight,Calories).  We
unify N with the sum of all the Weights.*/

weight([],0).
weight([food(_,W,_) | Rest], X) :-  weight(Rest,RestW),
X is W + RestW.

/*   calories(L,N) takes a list L of food terms, each
of the form food(Name,Weight,Calories).  We
unify N with the sum of all the Calories.*/
calories([],0).
calories([food(_,_,C) | Rest], X) :-  calories(Rest,RestC),
X is C + RestC.


/*subseq(X,Y) succeeds when list X is the same as
  list Y, but with zero or more elements omitted.
  This can be used with any pattern of instantiations.*/

subseq([],[]).
subseq([Item | RestX], [Item | RestY]) :-  subseq(RestX,RestY).
subseq(X, [_ | RestY]) :-  subseq(X,RestY).


/*knapsackDecision(Pantry,Capacity,Goal,Knapsack) takes
 a list Pantry of food terms, a positive number
Capacity, and a positive number Goal.  We unify
Knapsack with a subsequence of Pantry representing
a knapsack with total calories >= goal, subject to
the constraint that the total weight is =< Capacity.*/
knapsackDecision(Pantry,Capacity,Goal,Knapsack) :-  subseq(Knapsack,Pantry),
weight(Knapsack,Weight),
Weight =< Capacity,
calories(Knapsack,Calories),
Calories >= Goal.


/*legalKnapsack(Pantry,Capacity,Knapsack) takes a list
 Pantry of food terms and a positive number Capacity.
We unify Knapsack with a subsequence of Pantry whose
 total weight is =< Capacity.*/
 legalKnapsack(Pantry,Capacity,Knapsack):- subseq(Knapsack,Pantry),
 weight(Knapsack,W),
 W =< Capacity.

 /*maxCalories(List,Result) takes a List of lists of  food terms.  We unify Result with an element from the
  list that maximizes the total calories.  We use a helper predicate maxC that takes four paramters: the
  remaining list of lists of food terms, the best list
  of food terms seen so far, its total calories, and
  the final result.*/
  maxC([],Sofar,_,Sofar).

  maxC([First | Rest],_,MC,Result) :-  calories(First,FirstC),
  MC =< FirstC,
  maxC(Rest,First,FirstC,Result).

  maxC([First | Rest],Sofar,MC,Result) :- calories(First,FirstC),
  MC > FirstC,
  maxC(Rest,Sofar,MC,Result).

  maxCalories([First | Rest],Result) :-  calories(First,FirstC),
  maxC(Rest,First,FirstC,Result).



  /*knapsackOptimization(Pantry,Capacity,Knapsack) takes
   a list Pantry of food items and a positive integer
  Capacity.  We unify Knapsack with a subsequence of
   Pantry representing a knapsack of maximum total
   alories, subject to the constraint that the total
  weight is =< Capacity.*/
  knapsackOptimization(Pantry,Capacity,Knapsack) :- findall(K,legalKnapsack(Pantry,Capacity,K),L),
  maxCalories(L,Knapsack).
