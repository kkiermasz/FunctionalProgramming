-module(ex2).
-compile(export_all).

client(X) -> server_process ! X,
                client().
client() -> 
            receive
                X -> server_process ! X+1,
                io:format("~p ~n",[X])
            end,
            client().

recvMsg() -> receive
                X -> client_process ! X+1,
                io:format("~p ~n",[X])
            end,
            recvMsg().

server() ->
        recvMsg().           

start() -> register(server_process,spawn(ex2,server,[])),
           register(client_process,spawn(ex2,client,[1])).