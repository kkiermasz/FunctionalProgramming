- module (wsp1).
- export ([start/0,hello/1]).

hello (Msg) ->
    io:format("~p~n",[Msg]),
    io:format("~p~n",[Msg]),
    io:format("~p~n",[Msg]).

start() ->
    spawn(wsp1,hello,["startuje"]),
    spawn(wsp1,hello,["koncze"]).