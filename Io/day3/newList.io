# make list by square brace
squareBrackets := method(
    list := call message arguments map(arg,
        doMessage(arg)
    )
    list
)

squareList := ["hihi", "list", "hello"]
squareList println