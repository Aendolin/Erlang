-module(boolean).
-compile(export_all).

b_and(false,false) -> false;
b_and(true,false) -> false;
b_and(false,true) -> false;
b_and(true,true) -> true;
b_and(_,_) -> error("Illegal arguments!").
    
b_not(true) -> false;    
b_not(false) -> true;
b_not(_) -> error("Illegal argument!").

b_nand(Val1,Val2) -> b_not(b_and(Val1,Val2)).    
