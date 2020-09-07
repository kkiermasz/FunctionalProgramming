-module(cs2).
-import(i, [ip/0]).
-compile(export_all).

client ([],_) -> ok;
client ([A|Rest],ServerPID) -> ServerPID ! {A,self()},
                                receive
                                    X -> io:format("~p ~n",[X])
                                end,
                                client(Rest,ServerPID).

recvMsg() -> receive
                {X, ClientPID} -> ClientPID ! X*X,
                recvMsg()
            after 3000 ->
                io:format("~s ~n",["Server is going down..."])
            end .

server() ->
        io:format("~s ~p ~n", ["Server started with PID=",self()]),
        recvMsg().           

start() -> S=spawn(cs2,server,[]),
           spawn(cs2,client,[[1,2,3,4],S]).