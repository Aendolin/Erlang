-module(interval_map).
-compile(export_all).

%INITIAL CODE; IGNORE
%find(_,[]) -> exit("EXCEPTION");
%find(N,[{Low,High,Val}|_]) when N >= Low, N =< High -> Val;
%find(N,[_|T]) -> find(N,T). 

% Map requires a list of format: [format,{low1,high1,value1},{low2,high2,value2},etc], where format is either atom 'leftopen' or atom 'leftclosed'
   
find(_,[_|[]]) -> exit("EXCEPTION");
find(N,[leftopen,  {Low,High,Val}|_]) when N >= Low, N < High -> Val;
find(N,[leftclosed,{Low,High,Val}|_]) when N > Low, N =< High -> Val;
find(N,[F|[_|T]]) -> find(N,[F|T]).    
   