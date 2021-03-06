-module(linkmon).
-compile(export_all).

myproc() ->
   timer:sleep(5000),
   exit(reason).

chain(0) ->
   receive
      _ -> ok
   after 2000 ->
      exit("chain dies here")
   end;
chain(N) ->
   Pid = spawn(fun() -> chain(N-1) end),
   link(Pid),
   receive
      _ -> ok
   end.

start_critic() ->
   spawn(?MODULE, critic, []).

judge(Pid, Band, Album) ->
   Pid ! {self(), {Band, Album}},
   receive
      {Pid, Criticism} -> Criticism
   after 2000 ->
      timeout
   end.

critic() ->
   receive
      {From, {"Rage Against the Turing Machine", "Unit Testify"}} ->
         From ! {self(), "They are great!"};
      {From, {"System of a Downtime", "Memoize"}} ->
         From ! {self(), "They're no Johnny Crash but they're good."};
      {From, {"Johnny Crash", "The Token Ring of Fire"}} ->
         From ! {self(), "Simply Incredible."};
      {From, {_Band, _Album}} ->
         From ! {self(), "They are terrible!"}
   end,
critic().
% When you recursively call a function, is it the same process with the same process id?

start_critic2() ->
   spawn(?MODULE, restarter, []).

restarter() -> 
   process_flag(trap_exit, true),
   Pid = spawn_link(?MODULE, critic, []),
   register(critic, Pid),
   receive
      {'EXIT', Pid, normal} -> %  not a crash
         ok;
      {'EXIT', Pid, shutdown} -> % manual termination, not a crash
         ok;
      {'EXIT', Pid, _} ->
        restart()
   end.

judge2(Band, Album) ->
   critic ! {self(), {Band, Album}},
   Pid = whereis(critic),
   receive
      {Pid, Criticism} -> Criticism
   after 2000 ->
      timeout
   end.