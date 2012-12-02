-module(ex3_2).
-compile(export_all).

create(N) when N < 1 -> error("Bad values, dude");
create(N) -> create(N,[]).
create(0,Acc) -> Acc;
create(N,Acc) -> create(N-1,[N|Acc]).
     
reverse_create(N) when N < 1 -> error("Bad values, dude");
reverse_create(N) -> lists:reverse(create(N,[])).
reverse_create(0,Acc) -> Acc;
reverse_create(N,Acc) -> create(N-1,[N|Acc]).     
