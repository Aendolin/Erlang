% O'Reilly 
-module(ex3_5).
-compile(export_all).

filter(List,N) -> lists:reverse(filter(List,N,[])).
filter([],_,Acc) -> Acc;
filter([Head|Tail],N,Acc) when Head =< N ->
    filter(Tail,N,[Head|Acc]);
filter([_|Tail],N,Acc) ->
    filter(Tail,N,Acc).

reverse([]) -> [];
reverse([Head|Tail]) -> 
    reverse(Tail) ++ [Head].

concatenate([]) -> [];
concatenate([Head|Tail]) ->    
    pry(Head) ++ concatenate(Tail).

pry([]) -> [];
pry([Head|Tail]) -> [Head] ++ pry(Tail).
    
%% Don't feel like doing flatten :P


    
     
    
