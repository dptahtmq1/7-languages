twoDimList := list(list(1, 3, 5), list(2, 4, 6))

mySum := method(values,
    result := 0
    values foreach(i, v, result = result + if (v proto == List, mySum(v), v))
    result
)

mySum(twoDimList) println

List myAverage := method(
    result := 0
    values := self
    size := values size
    if (size == 0) then(Exception raise("list is empty"))
    values foreach(i, v, if (v proto != Number) then (Exception raise("not number")); result = result + v;)
    result / size
)

list(1,3,5,9) myAverage println
#list() myAverage println
#list(1,"a",5,9) myAverage println

# Metrix
Matrix := Object clone
Matrix dim := method(x, y,
    self lists := list()
    self sizeX := x
    self sizeY := y
    for(i, 1, x, lists push(list() setSize(y)))
    )

Matrix set := method(x, y, value,
    lists at(x - 1) atPut(y - 1, value)
    )

Matrix get := method(x, y,
    lists at(x - 1) at(y - 1)
    )

Matrix transpose := method(
    newLists := list()

    newMatrix := Matrix clone
    newMatrix dim(self sizeY, self sizeX)

    for(i, 1, self sizeX,
        for(j, 1, self sizeY,
            newMatrix set(j, i, self get(i, j))
        )
    )

    newMatrix
)

readMatrix := method(filename,
    file := File open(filename)
    lists := list()
    file foreachLine(i, line,
        lists push(line split(","))
    )

    matrix := Matrix clone
    matrix lists := lists
    matrix sizeX := lists size
    matrix sizeY := lists at(0) size
    matrix
)

matrix := Matrix clone
matrix dim(3, 3)
matrix set(1, 1, 1)
matrix set(1, 3, 5)
matrix get(1, 1) println
matrix get(1, 3) println
matrix get(2, 1) println

newMatrix := matrix transpose
(matrix get(1, 3) == newMatrix get(3, 1)) println

fileMatrix := readMatrix("matrix.txt")
fileMatrix get(1, 1) println
fileMatrix get(2, 2) println