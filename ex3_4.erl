% O'Reilly, first database
-module(ex3_4).
-compile(export_all).

new() -> [].

write(Key,Element,[]) ->
    [{Key,Element}];

write(Key,Element,Db) ->
    [{Key,Element} | delete(Key,Db)].

delete(_,[]) -> [];
delete(Key,[{Dkey,_}|Tail]) when Key == Dkey ->
    Tail;
delete(Key,[Head|Tail]) ->
    [Head] ++ delete(Key,Tail). 

read(_,[]) -> {error,instance};
read(Key,[{HKey,Element}|_]) when Key == HKey -> {ok,Element}; 
read(Key,[_|Tail]) -> read(Key,Tail).

match(_,[]) -> [];
match(Element,[{Dkey,Delement}|Tail]) when Element == Delement -> 
    [Dkey|match(Element,Tail)];
match(Element,[{_,_}|Tail]) ->
    match(Element,Tail).



    
	
    
