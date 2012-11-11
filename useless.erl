-module(useless).
-export([add/2, hello/0, greet_and_add_two/1]).
-define(sub(X,Y),X-Y).
-author("Aendolin").
% -compile([debug_info, export_all]).
% ?sub(23,47).
% compiled w erlc flags file.erl
% compile: file(FileName)
% c()

add(A,B) ->
	 A + B.

% Show greetings.
% io: format/1 is the standard function used to output text.
hello() ->
	io:format("Hello, world!~n").

greet_and_add_two(X) ->
	hello(),
	add(X,2).

greet(male, Name) ->
	io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
	io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
 	io:format("Hello, ~s!", [Name]).
% function clauses separated by ";".  
