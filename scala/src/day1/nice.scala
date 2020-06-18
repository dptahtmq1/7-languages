package nice.scala

class Person(val name: String)

trait Nice {
  def greet() = println("Howdily doodily.")
}

class Character2(override val name: String) extends Person(name) with Nice

object Main extends App {
  val flanders = new Character2("Ned")
  flanders.greet()
}