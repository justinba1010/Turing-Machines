%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Author:    Justin Baum                                 %%%%
%%%% Purpose:   Tape Operaations                            %%%%
%%%% Date:      18 October 2018                             %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(tape).

-export([halt_over/1, write_tape/2, read_tape/1, tape_left/1, tape_right/1, flatten_tape/1]).

% The tape is defined as such
% {[current, ...], [...]}
% {[0,-1,-2,-3,-4,...],[1,2,3,4,5,...]}
% 0 is current spot

halt_over(Tape) ->
    flatten_tape(Tape).

write_tape({[_Current | Left], Right}, New) ->
    {[New] ++ Left, Right}.

read_tape({[Current | _Left], _Right}) ->
    Current.

% Case tape is empty on left movement, add a 0 (INFINITE TAPE)
tape_left({[Current], Right}) ->
    {[0], [Current] ++ Right};
tape_left({[Current | Left], Right}) ->
    {Left, [Current] ++ Right}.

% Case tape is empty on right movement, add a 0 (INFINITE TAPE)
tape_right({Left, [Next]}) ->
    {[Next] ++ Left, [0]};
tape_right({Left, [Next | Right]}) ->
    {[Next] ++ Left, Right}.

flatten_tape({Left, Right}) ->
    io:format("... 0 0 ~p\n 0 0 ...",[lists:reverse(Left) ++ Right]).
