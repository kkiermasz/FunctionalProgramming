-module(types).
-compile(export_all).


client(N) -> server_process ! N.

recvMsg() -> receive
                X -> 
                    if 
                        is_atom(X) -> 
                            io:format("~s ~n",["Server received atom"]);
                        is_integer(X) ->
                            io:format("~s ~n",["Server received number"]);
                        true ->
                            io:format("~s ~n",["Server received sth"])
                    end,
                recvMsg()
            after 3000 ->
                io:format("~s ~n",["Server is going down..."])
            end.

server() ->
        io:format("~s ~p ~n", ["Server started with PID=",self()]),
        recvMsg(). 

start(N) -> register(server_process,spawn(types,server,[])),
            spawn(types,client,[N]).