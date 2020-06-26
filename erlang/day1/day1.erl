-module(day1).
-export([another_sum/1, another_judge/1, word_count/2]).

another_sum(0) -> 0;
another_sum(N) -> 1 + another_sum(N - 1).

another_judge({error, Message}) -> io:format("error: ~p~n", [Message]);
another_judge(success) -> erlang:display("success").

word_count([[]], _) -> 0;
word_count(Content, Word) ->
  [_ | T] = string:split(Content, Word),
  word_count(T, Word) + 1.
