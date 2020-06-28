-module(translate_doctor).
-export([doctor_loop/0, translate/1]).

loop() ->
  receive
    {From, "casa"} ->
      From ! "house",
      loop();

    {From, "blanca"} ->
      From ! "white",
      loop();

    {From, kill} ->
      From ! "died",
      exit({service, die, at, erlang:time()});

    {From, _} ->
      From ! "I don't understand.",
      loop()
  end.

translate(Word) ->
  service ! {self(), Word},
  receive
    Translation -> Translation
  end.

doctor_loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      register(service, spawn_link(fun loop/0)),
      doctor_loop();

    {'EXIT', From, Reason} ->
      io:format("The service ~p died with reason ~p.", [From, Reason]),
      io:format("Restarting. ~n"),
      self() ! new,
      doctor_loop()
  end.

% command
% c(translate_doctor).
% Doc = spawn(fun translate_doctor:doctor_loop/0).
% Doc ! new
% translate_doctor:translate("casa").
% translate_doctor:translate(kill).