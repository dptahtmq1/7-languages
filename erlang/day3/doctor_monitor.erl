-module(doctor_monitor).
-export([loop/0, doctor_monitor/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      register(revolver, spawn_link(fun roulette:loop/0)),
      loop();

    {'EXIT', From, Reason} ->
      io:format("The shooter ~p died with reason ~p.", [From, Reason]),
      io:format("Restarting. ~n"),
      self() ! new,
      loop();

    kill ->
      exit({roulette, die, at, erlang:time()})
  end.

doctor_monitor() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating doctor-monitor process.~n"),
      register(doctor, spawn_link(fun loop/0)),
      doctor ! new,
      doctor_monitor();

    {'EXIT', From, Reason} ->
      io:format("The doctor ~p died with reason ~p.", [From, Reason]),
      io:format("Restarting. ~n"),
      self() ! new,
      doctor_monitor()
  end.

% c(doctor_monitor).
% Doc = spawn(fun doctor_monitor:doctor_monitor/0).
% Doc ! new.
% revolver ! 2.
% revolver ! 3.
% doctor ! kill.
% revolver ! 3.