(1+1) println
# (1+"one") println

(true and 0) println
(true and nil) println
(true and "") println

# slotNames of proto
Car := Object clone
(Car proto slotNames) println

# =, :=, ::=
#   operator	action
#   ::=	Creates slot, creates setter, assigns value
#   :=	Creates slot, assigns value
#   =	Assigns value to slot if it exists, otherwise raises exception
# reference : https://stackoverflow.com/questions/5972327/whats-the-difference-between-newslot-and-setslot-in-the-io-language
Animal := Object clone do (
    legs ::= nil    // creates leg slot  & setLegs() setter
    tail ::= nil    // creates tail slot & setTail() setter
)

Cat := Animal clone setLegs(4) setTail(1)
Cat println

# execute slot by name
slotName := "execute"
Item := Object clone
Item execute := method("executed" println)
Item execute
Item getSlot(slotName) call