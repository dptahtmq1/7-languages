Builder := Object clone
Builder indent := ""
Builder forward := method(
    write(indent, "<", call message name)
    if (call message arguments size > 0,
        if (call message arguments first name != "curlyBrackets", writeln(">"))
    )

    indent = indent with ("  ")

    call message arguments foreach(arg,
        content := self doMessage(arg)

        if (content type == "Sequence", writeln(indent, content))
        if (content type == "Map", content foreach(k, v,
                write(" ", k, "=\"", v, "\"")
            )
            writeln(">")
        )
    )

    indent = indent asMutable removeSuffix("  ")
    writeln(indent, "</", call message name, ">")
)

OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)

Builder doString("""
    ul(
        li("Io"),
        li("Lua"),
        li("Javascript"),
        book({"author": "Tate"}, "7Languages")
    )
""")