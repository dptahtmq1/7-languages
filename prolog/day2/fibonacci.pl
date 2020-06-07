fib(0, 0).
fib(1, 1).
fib(N,Result):-fibonacci(N,0,1,Result).

fibonacci(0,N,_,N).
fibonacci(N, Prev1,Prev2,Result):-
   N>0,
   New_Prev2 is Prev1+Prev2,
   N1 is N-1,
   fibonacci(N1,Prev2,New_Prev2,Result).