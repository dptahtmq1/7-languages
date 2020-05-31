i := 1
while(i <= 11, i println; i = i + 1); "This one goes up to 11" println

OperatorTable addOperator("xor", 11)
true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))
(true xor true) println
(true xor false) println
(false xor true) println
(false xor false) println
