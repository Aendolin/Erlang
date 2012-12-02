% Exercises 3-1 and 3-2 in O'Reilly
-module(Ex3_1).
-compile(export_all).

sum(1) -> 1;
sum(N) ->
    N + sum(N-1).

sum(N,M) when N > M ->
    exit("Bad values, dude");
sum(N,M) ->
    sum(N,M,0).
sum(N,M,Acc) when N == M-> Acc;
sum(N,M,Acc) -> sum(N+1,M,Acc+N).
    

