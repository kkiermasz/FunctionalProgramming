-module(ex2).
-compile(export_all).

procA(PID_B) -> io:format("~s ~p ~n",["Proces A started with",self()]),
                io:format("~s ~n",["Proces A sends atom czesc to B."]),
                PID_B ! czesc.

procB() -> io:format("~s ~p ~n",["Proces B started with",self()]),
            receive 
                  czesc -> io:format("~s ~n",["Proces B received atom czesc."])
            end .

start() -> PID_B=spawn(ex2,procB,[]),
            spawn(ex2, procA,[PID_B]).