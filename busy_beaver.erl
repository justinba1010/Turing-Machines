%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Author:    Justin Baum                                 %%%%
%%%% Purpose:   Busy Beaver Turing Machine                  %%%%
%%%% Date:      18 October 2018                             %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(busy_beaver).

-export([run/0,run/1]).

run() ->
    a({[0],[0]}).

run(Tape) ->
    a(Tape).

a(Tape) ->
    case tape:read_tape(Tape) of
        0 ->
            b(tape:tape_right(tape:write_tape(Tape, 1)));
        1 ->
            b(tape:tape_left(tape:write_tape(Tape, 1)))
        end.

b(Tape) ->
    case tape:read_tape(Tape) of
        0 ->
            a(tape:tape_left(tape:write_tape(Tape, 1)));
        1 ->
            tape:halt_over(tape:tape_right(tape:write_tape(Tape,1)))
        end.
