# divide 0
originalDivision := Number getSlot("/")
Number / := method(target, if (target == 0, 0, originalDivision(target)))
(4/2) println
(4/0) println