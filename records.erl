-module(records).
-compile(export_all).
% include let you use records across multiple modules
-include("records.hrl").

% rr(records) to load record definitions from 'records'
% rr("*") too!
% rd(Name, Definition): can define records in shell 

-record(robot, {name, type=industrial, hobbies, details=[]}).

first_robot() ->
   #robot{name="Mechatron", type=handmade, details=["Moved by a small man inside"]}.

car_factory(CorpName) ->
   #robot{name=CorpName, hobbies="building cards"}.

-record(user, {id, name, group, age}).

admin_panel(#user{name=Name, group=admin}) ->
   Name ++ " is allowed!";
admin_panel(#user{name=Name}) ->
   Name ++ "is not allowed".

adult_section(U = #user{}) when U#user.age >= 18 ->
   allowed;
adult_section(_) ->
   forbidden.

repairman(Rob) ->
   Details = Rob#robot.details,
   NewRob = Rob#robot{details=["Repaired by repairman"|Details]},
   {repaired, NewRob}.


included() -> #included{some_field="Some value"}.