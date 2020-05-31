number := Random value(1, 100) floor
input := File standardInput

"start quiz" println
number println

answer := 0
previousAnswer := 0

10 repeat(
    "insert : " print
    answer = input readLine asNumber

    if (number == answer,
        "correct answer" println; return,
        "wrong answer" println
        if ((number - answer) abs < (number - previousAnswer) abs,
            "closer" println,
            "wrong.." println
        )
        previousAnswer = answer
    )
)

"end..." println