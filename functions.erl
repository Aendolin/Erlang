-module(functions).
-compile(export_all).
-author("Aendolin").

head([H|_]) -> H.
second([_,X|_]) -> X.

% Find the Nth element in List
re([H|List],0) -> H;
re([H|List],N) -> re(List,N-1).

% Compare the equality of two variables.
same(X,X) ->
true;
same(_,_) ->
false.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
   io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n", [Date,Y,M,D]),
   io:format("The time tuple (~p) says today is: ~p:~p:~p,~n", [Time,H,Min,S]);
valid_time(_) ->
   io:format("Stop feeding me wrong data!~n").

old_enough(X) when X >= 16 -> true;
old_enough(_) -> false.

right_age(X) when X >= 16, X =< 104 -> true;
right_age(_) -> false.

right_age2(X) ->
    if X >= 16, X =< 104 -> true;
    true -> false
    end. 

heh_fine() ->
   if 1 =:= 1 ->
     works
   end,
   if 1 =:= 2; 1 =:= 1 ->
     works
   end,
   if 1 =:= 2; 1 =:= 1 ->
      fails
   end.

oh_god(N) ->
   if N =:= 2 -> might_succeed;
      true -> always_does % Erlang's 'else'!
   end.

help_me(Animal) -> 
   Talk = if Animal == cat -> "meow";
             Animal == dog -> "bark";
          true -> "WTF"
   end,
   {Animal, "says " ++ Talk ++ "!"}.

% How to fix this pattern matching ???
%help_me2(cat) -> Animal = cat, Talk = "meow";
%help_me2(dog) -> Animal = dog, Talk = "bark";
%help_me2(X) -> Animal = X, Talk = "WTF",
%{Animal, "says " ++ Talk ++ "!"}.

insert(X,[]) ->
   [X];
insert(X,Set) ->
   case lists:member(X,Set) of
       true -> Set;
       false -> [X|Set]
   end.

%Why doesnt this work?

%insert2(X,[]) -> [X];
%insert2(X,Set) when lists:members(X,Set) -> Set.
%insert2(X,Set) when lists:member(X,Set) =:= false -> [X|Set].

%insert2(X,[]) -> [X].
%insert3(X,Set) ->
%   if lists:members(X,Set) -> Set;
%   true -> [X|Set]
%   end.

%beach(Temperature)

guard1(cat) -> "cat";
% the cat clause has to go before the others, or else it will be read as a number and evaluated 
% by the others!
guard1(X) when X >= 0, X =< 10 -> "small";
guard1(X) when X >= 10 -> "large";
guard1(_)  -> "nope".
% guard1(X) will also work for the last line, but X will be unused...thats what '_' is for!

