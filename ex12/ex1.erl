-module (ex1).
-export([procCode/1,start/1]).

procCode(1) -> io:format("~s ~n",["Hello from Erlang!"]);
procCode(N) -> io:format("~s ~n",["Hello from Erlang!"]),
               procCode(N-1).

start(N) -> spawn(ex1,procCode,[N]).