package constructor.scala

class Person(firstName: String) {
  println("Outer constructor")
  def this(firstName: String, lastName: String) {
    this(firstName)
    println("Inner constructor")
  }
  def talk() = println("Hi")
}

object Main extends App {
  val bob = new Person("Bob")
  val bobTate = new Person("Bob", "Tate")
}