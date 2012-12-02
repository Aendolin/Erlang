% O'Reilly
-module(ex3_3).
-compile(export_all).

print(N) when N < 1 ->
    error("Bad value, dude");
print(N) -> print(N,[]).
print(0,Acc) -> io:format("Numbers are: ~p~n",[Acc]);
print(N,Acc) -> print(N-1,[N|Acc]).

even_print(N) when N < 1 ->    
    error("Bad value, dude");
even_print(N) -> even_print(N,[]).
even_print(0,Acc) -> io:format("Even numbers are: ~p~n",[Acc]);
even_print(N,Acc) when N rem 2 == 0 -> even_print(N-1,[N|Acc]);
even_print(N,Acc) -> even_print(N-1,Acc).
    
    
