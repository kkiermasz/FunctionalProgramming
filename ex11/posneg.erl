-module (posneg).

-export ([posNeg/1]).

% silnia(0) -> 1;
% sinia(N) -> N*silnia (N-1).    

% binom(N,K) -> silnia(N)/(silnia(K)*silnia(N-K)).

pos([A]) -> if A>0 -> 1;
            true -> 0
            end;
pos([A|Rest]) -> if A>0 -> 1 + pos(Rest);
            true -> 0 + pos(Rest)
            end.

neg([A|Rest]) -> if A<0 -> 1;
            true -> 0
            end;
neg([A|Rest]) -> if A<0 -> 1 + neg(Rest);
            true -> 0 + neg(Rest)
            end.

posNeg(A) -> {pos(A), neg(A)}.

