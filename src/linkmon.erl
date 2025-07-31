

-module(linkmon).
-compile(export_all).

myproc() ->
    timer:sleep(5000),
    exit(reason).

% link relations are transitive! If one die all dies.
chain(0) ->
    receive
        _ -> ok
    after 2000 ->
        exit("chain dies here")
    end;
chain(N) ->
    % spawn and link are two seperate operations so 
    % it is possible for the process to die before linking causing
    % unexpected behavior. use spawn_link/1-3 if you want it to be atomic 
    Pid = spawn(fun() -> chain(N-1) end),
    link(Pid),
    receive
     _ -> ok
    end.