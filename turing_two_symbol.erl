%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Author:    Justin Baum                                 %%%%
%%%% Purpose:   Loadable 2 Symbol Turing Machines           %%%%
%%%% Date:      18 October 2018                             %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(turing_two_symbol).

-export([run/3]).

% Q = [{name, {conditions for 0, conditions for 1}}...]
% Conditions = {move tape, write tape, next state}
% Conditions = {r || l || h, 0 || 1, next state}

run(Q, Tape, InitialState) ->
    read_tape(Q, Tape, InitialState).

read_tape(Q, Tape, CurrentState) ->
    {value, {_, {C0, C1}}} = lists:keysearch(CurrentState, 1, Q),
    {Direction, Write, NextState} =
        case tape:read_tape(Tape) of
            0 ->
                C0;
            1 ->
                C1
            end,
    case Direction of
        h ->
            % Two different ways this can be programmed, either you can print to the tape or not before halting
            case Write of
                0 ->
                    tape:flatten_tape(tape:write_tape(Tape, 0));
                1 ->
                    tape:flatten_tape(tape:write_tape(Tape, 1));
                _ ->
                    tape:flatten_tape(Tape)
            end;
        r ->
            read_tape(Q, tape:tape_right(tape:write_tape(Tape, Write)), NextState);
        l ->
            read_tape(Q, tape:tape_left(tape:write_tape(Tape, Write)), NextState)
        end.
