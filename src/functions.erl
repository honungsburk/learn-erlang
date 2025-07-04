-module(functions).

-export([head/1, second/1, old_enough/1, insert/2, fac/1, len/1, tail_fac/1]).

%% head
head([H | _]) ->
    H.

second([_, X | _]) ->
    X.

old_enough(X) when X >= 16, X =< 104 ->
    true;
old_enough(_) ->
    false.

insert(X, []) ->
    [X];
insert(X, Set) ->
    case lists:member(X, Set) of
        true ->
            Set;
        false ->
            [X | Set]
    end.

fac(0) ->
    1;
fac(N) ->
    N * fac(N - 1).

len([]) ->
    0;
len([_ | T]) ->
    1 + len(T).

tail_fac(N) ->
    tail_fac(N, 1).

tail_fac(0, Acc) ->
    Acc;
tail_fac(N, Acc) when N > 0 ->
    tail_fac(N - 1, N * Acc).
