-module(zadanie3).
-compile(export_all).

number_for_index(X, I) -> if (I rem 2) == 1 ->
                                X - 1;
                            true ->
                                X * 2
                        end.

process(Index) -> receive
                {X, [NextPID|ProcessesList]} -> io:format("(~p,~p), ",[Index, X]), 
                    NextPID ! {(number_for_index(X, Index)), (ProcessesList ++ [NextPID])},
                    process(Index)
            end.

create_processes(InitN, 0, [A|Rest], K) -> A ! {K, (Rest ++ [A])};
create_processes(InitN, N, A, K) -> create_processes(InitN, N-1, (A ++ [spawn(zadanie3, process, [InitN - N + 1])]), K).

start(N, X) -> create_processes(N, N, [], X).

