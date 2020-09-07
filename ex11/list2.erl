-module (list2).

-export ([srednia/1]).

len([A]) -> 1;
len([_|Rest]) -> 1+len(Rest).



sum([A]) -> A;
sum([A|Rest]) -> A+sum(Rest).

srednia(A) -> sum(A)/len(A).