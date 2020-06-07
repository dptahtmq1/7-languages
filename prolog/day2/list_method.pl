min(A, [A]).
min(Min, [Head|Tail]) :-
    min(TailMin, Tail),
    TailMin >= Head,
    Min is Head.
min(Min, [Head|Tail]) :-
    min(TailMin, Tail),
    TailMin < Head,
    Min is TailMin.

smallest([X],X).
smallest([H|T],H) :- smallest(T,X), X > H.
smallest([H|T],X) :- smallest(T,X), X =< H.

rev([A], [A]).
rev([A,B], [B,A]).
rev(R, [Head|Tail]) :- rev(TailR, Tail), append(TailR, [Head], R).

merge(X, [], [X]).
merge(X, [Y|T], [X,Y|T]) :- X =< Y, !.
merge(X, [Y|T2], [Y|T1]) :- merge(X, T2, T1).

msort2([A], [A]).
msort2(R, [H|T]) :-
    msort2(SR, T),
    merge(H, SR, R).
