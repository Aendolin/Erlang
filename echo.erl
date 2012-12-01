-module(echo).
-compile(export_all).

start() ->
    register(pidA,spawn(?MODULE,loop,[])).

print(Term) ->
    print(print,Term).
print(print,Term) ->
    pidA ! {print,Term}.

stop() ->
    pidA ! stop.

loop() ->
    receive 
	{print, Term} ->
	    io:format("~p~n",[Term]),
	    loop();
	stop -> 
	    true
    end.

		
