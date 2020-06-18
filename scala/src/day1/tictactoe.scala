package tictactoe.scala

object GameResult extends Enumeration {
  val WIN = Value("end")
  val DRAW = Value("draw")
  val IN_PROGRESS = Value("in progress")
}

object Main extends App {
  val sample1 = List("O", "O", "O", " ", " ", " ", " ", " ", " ")
  val sample2 = List("O", "X", "X", "O", " ", " ", "O", " ", " ")
  val sample3 = List("O", "X", "X", "X", "O", " ", " ", " ", "X")
  val sample4 = List("O", "X", "X", " ", " ", " ", "O", " ", " ")
  val sample5 = List("O", "X", "O", "X", "O", "X", "X", "O", "X")

  println(s"result1 : ${new TicTacToe(sample1).getResult()}")
  println(s"result2 : ${new TicTacToe(sample2).getResult()}")
  println(s"result3 : ${new TicTacToe(sample3).getResult()}")
  println(s"result4 : ${new TicTacToe(sample4).getResult()}")
  println(s"result5 : ${new TicTacToe(sample5).getResult()}")
}

class TicTacToe(board: List[String]) {
  def getResult(): GameResult.Value = {
    if (checkRows(0) || checkRows(3) || checkRows(6)
      || checkCols(0) || checkCols(3) || checkCols(6)
      || checkDiags()) {
      GameResult.WIN
    } else if (checkAllFilled()) {
      GameResult.DRAW
    } else {
      GameResult.IN_PROGRESS
    }
  }

  private def checkRows(start: Int): Boolean = {
    this.matches(board.drop(start).take(3).reduce((x, y) => x + y))
  }

  private def checkCols(start: Int): Boolean = {
    val col1 = (start until 9) by 3
    var result = ""
    for (i <- col1) {
      result += board(i)
    }

    this.matches(result)
  }

  private def checkDiags(): Boolean =
    matches(board(0) + board(4) + board(8)) || matches(board(2) + board(4) + board(6))

  private def matches(result: String): Boolean = result.matches("(OOO|XXX)")

  private def checkAllFilled(): Boolean = board.find(b => b == " ").isEmpty
}