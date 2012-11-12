-module(recursive).
-compile(export_all).
-author("Aendolin").

fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1).

tail_fac(N) -> tail_fac(N,1).
tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) -> tail_fac(N-1,N*Acc).

% How many elements a list contains

len([]) -> 0;
len([_|T]) -> 1 + len(T).

tail_len(List) -> tail_len(List,0).
tail_len([],Acc) -> Acc;
tail_len([_|T],Acc) -> tail_len(T,Acc+1).
% Additional parameter is called accumulator

duplicate(0,_) -> [];
duplicate(N,Term) when N > 0 -> [Term|duplicate(N-1,Term)].

tail_duplicate(N,Term) -> tail_duplicate(N,Term,[]).
tail_duplicate(0,_,List) -> List;
tail_duplicate(N,Term,List) when N > 0 -> tail_duplicate(N-1,Term,[Term|List]).
% [List|Term] doesnt work!

reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].
% So THATS how you add lists together!

tail_reverse(L) -> tail_reverse(L, []).
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).

sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> H ++ sublist(T,N-1).

tail_sublist(L,N) -> lists:reverse(tail_sublist(L,N,[])).
tail_sublist([],_,Sublist) -> Sublist;
tail_sublist(_,0,Sublist) -> Sublist;
tail_sublist([H|T],N,Sublist) when N > 0 -> tail_sublist(T,N-1,[H|Sublist]).
%Backwards!!

zip([],[]) -> [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

tail_zip(Xs,Ys) -> lists:reverse(tail_zip(Xs,Ys,[])).
tail_zip([],[],Acc) -> Acc;
tail_zip([X|Xs],[Y|Ys],Acc) -> tail_zip(Xs,Ys,[{X,Y}|Acc]).

% tail(parameters) = tail(parameters, empty accumulator)
% tail(base case, accumulator) = accumulator
% tail(parameters, accumulator) = tail(new parameters, modified accumulator)

% TCO and LCO

% Quick Sort

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
   {Smaller, Larger} = partition(Pivot,Rest,[],[]),
   quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[],Smaller,Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
   if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
      H  > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
   end.

lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
   lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
   ++ [Pivot] ++
   lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).

