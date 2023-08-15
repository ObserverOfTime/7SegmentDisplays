-module(erlang).
-export([main/1]).

main(_Args) ->
    {ok, File} = file:read_file("words.txt"),
    Words = binary:split(File, <<"\n">>, [global, trim_all]),
    Longest = find_longest_words(Words),
    [io:format("~s~n", [Word]) || Word <- Longest].

find_longest_words(Words) ->
    Invalid = binary:compile_pattern([<<C>>|| C <- "gkmqvwxzioGKMQVWXZIO"]),
    find_longest_words(Words, Invalid, 0, []).

find_longest_words([], _, _, Acc) ->
    lists:reverse(Acc);
find_longest_words([Word|RemainingWords], Pattern, MaxLen, Acc) ->
    case {byte_size(Word), is_pattern_in_word(Word, Pattern)} of
        {MaxLen, false} ->
            find_longest_words(RemainingWords, Pattern, MaxLen, [Word|Acc]);
        {GreaterLen, false} when GreaterLen > MaxLen ->
            find_longest_words(RemainingWords, Pattern, GreaterLen, [Word]);
        _ ->
            find_longest_words(RemainingWords, Pattern, MaxLen, Acc)
    end.

is_pattern_in_word(Word, Pattern) ->
    binary:matches(Word, Pattern) =/= [].
