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
    case tape_operations:read_tape(Tape) of
        0 ->
            b(tape_operations:tape_right(tape_operations:write_tape(Tape, 1)));
        1 ->
            b(tape_operations:tape_left(tape_operations:write_tape(Tape, 1)))
        end.

b(Tape) ->
    case tape_operations:read_tape(Tape) of
        0 ->
            a(tape_operations:tape_left(tape_operations:write_tape(Tape, 1)));
        1 ->
            tape_operations:halt_over(tape_operations:tape_right(tape_operations:write_tape(Tape,1)))
        end.
