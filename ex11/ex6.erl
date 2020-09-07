-module (ex6).

-export ([myMap/2]).

myMap(F,[A]) -> [F(A)];
myMap(F,[A|Rest]) -> [F(A)] ++ myMap(F,Rest).

squareMe(A) -> myMap(fun (X)->X*X end, A).