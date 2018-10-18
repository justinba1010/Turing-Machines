%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Author:    Justin Baum                                 %%%%
%%%% Purpose:   Busy Beaver Turing Machine                  %%%%
%%%% Date:      18 October 2018                             %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(busy_beaver).

% The tape is defined as such
% {[current, ...], [...]}
% {[0,-1,-2,-3,-4,...],[1,2,3,4,5,...]}
% 0 is current spot

-export([run/0,run/1]).

run() ->
    a({[0],[0]}).

run(Tape) ->
    a(Tape).

a(Tape) ->
    case read_tape(Tape) of
        0 ->
            b(tape_right(write_tape(Tape, 1)));
        1 ->
            b(tape_left(write_tape(Tape, 1)))
        end.

b(Tape) ->
    case read_tape(Tape) of
        0 ->
            a(tape_left(write_tape(Tape, 1)));
        1 ->
            halt_over(tape_right(write_tape(Tape,1)))
        end.

halt_over(Tape) ->
    flatten_tape(Tape).

write_tape({[_Current|Left],Right},New) ->
    {[New]++Left, Right}.

read_tape({[Current|_Left],_Right}) ->
    Current.

% Case tape is empty on left movement, add a 0 (INFINITE TAPE)
tape_left({[Current],Right}) ->
    {[0],[Current]++Right};
tape_left({[Current|Left],Right}) ->
    {Left,[Current]++Right}.

% Case tape is empty on right movement, add a 0 (INFINITE TAPE)
tape_right({Left, [Next]}) ->
    {[Next]++Left, [0]};
tape_right({Left, [Next|Right]}) ->
    {[Next]++Left, Right}.

flatten_tape({Left, Right}) ->
    io:format("~p",[lists:reverse(Left)++Right]).
