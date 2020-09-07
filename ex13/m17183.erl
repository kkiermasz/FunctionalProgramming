-module(m17183).
-compile(export_all).

sum([A]) -> A;
sum([A|Rest]) -> A + sum(Rest).

create_list([A]) -> [A] ++ [A];
create_list([A,B]) -> [A+B] ++ [A] ++ [B];
create_list([A|Rest]) -> [sum([A] ++ Rest)] ++ [A] ++ Rest.

process() -> receive
                {List, [NextPID|ProcessesList]} -> io:format("~p ~n",[List]), 
                    NextPID ! {create_list(List), (ProcessesList ++ [NextPID])},
                    process()
            end.

create_processes(0, [A|Rest], K) -> A ! {K, (Rest ++ [A])};
create_processes(N, A, K) -> create_processes(N-1, (A ++ [spawn(m17183, process, [])]), K).

start(N, K) -> create_processes(N, [], [K]).

