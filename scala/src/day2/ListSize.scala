package ListSize.scala

object Main extends App {
  val sampleList = List("a", "bbbb", "3223", "4", "5", "6", "7", "8", "9213")

  val sizeOfList = sampleList.foldLeft(0)((size, str) => size + str.length)

  println(s"size: $sizeOfList")
}