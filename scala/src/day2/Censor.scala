package Censor.scala

import scala.io.Source

trait Censor {
  val filterMap = Map("Shoot" -> "Pucky", "Darn" -> "Beans")

  def filter(content: String): String = {
    filterMap.foldLeft(content)((filteredContent, filter) => filteredContent.replaceAll(filter._1, filter._2))
  }
}

object Main extends App with Censor {
  val content = Source.fromFile(s"scala/src/day2/content.txt").getLines().mkString
  println(s"result: ${filter(content)}")
}