%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Author:    Justin Baum                                 %%%%
%%%% Purpose:   Configurable Turing Machines                %%%%
%%%% Date:      18 October 2018                             %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(turing_multi_symbol).

-export([run/3, run/4]).

% Q = [{state, [conditions]}].
% Conditions = {current_symbol, write, direction}

% Symbols = [0,1,2,blank,...]
% then conditions are done in order of the symbols
run(Q, Tape, InitialState, _) ->
    read_tape(Q, Tape, InitialState, true).

run(Q, Tape, InitialState) ->
    read_tape(Q, Tape, InitialState, false).

read_tape(Q, Tape, CurrentState, Debug) ->
    {value, {_, AllConditions}} = lists:keysearch(CurrentState, 1, Q),
    {value, Condition} = lists:keysearch(tape:read_tape(Tape), 1, AllConditions),
    case Debug of
        true ->
            tape:flatten_tape(Tape),
            io:format("Current Tape Rule: ~p\n", [Condition]);
        _ -> ok
    end,
    {_, Direction, Write, NextState} = Condition,
    case Direction of
        h ->
            % Two different ways this can be programmed, either you can print to the tape or not before halting
            case Write of
                x ->
                    tape:flatten_tape(Tape);
                _ ->
                    tape:flatten_tape(tape:write_tape(Tape, Write))
            end;
        r ->
            read_tape(Q, tape:tape_right(tape:write_tape(Tape, Write)), NextState, Debug);
        l ->
            read_tape(Q, tape:tape_left(tape:write_tape(Tape, Write)), NextState, Debug)
        end.
