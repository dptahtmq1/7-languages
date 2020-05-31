# sequential
result := 1
prev1 := 0
prev2 := 1
fib := method(n,
    for(i, 2, n, 1, prev2 = result; result = prev1 + prev2; prev1 = prev2)
    result
    )
fib(8) println

# recursive
fib_rec := method(n,
    if (n <= 2, 1, fib_rec(n-1) + fib_rec(n-2))
    )
fib_rec(8) println