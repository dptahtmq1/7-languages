package sizer2.scala

import akka.actor.{Actor, ActorSystem, Props}
import akka.pattern.ask

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._
import scala.concurrent.{Await, Future}
import scala.io.Source
import scala.language.postfixOps

class PageLoaderActor extends Actor {
  override def receive: Receive = {
    case url: String => {
      val size = PageLoader.getPageSize(url)
      println("Size for " + url + ": " + size)
      sender() ! size
    }
  }
}

class AnchorCounterActor extends Actor {
  override def receive: Receive = {
    case url: String => {
      val size = PageLoader.getAnchorSize(url)
      println("Anchor count for " + url + ": " + size)
      sender() ! size
    }
  }
}

object PageLoader {
  val urls = List("http://www.amazon.com/",
    "http://www.twitter.com/",
    "http://www.google.com",
    "http://www.cnn.cm/")

  def getAnchorSize(url: String) = Source.fromURL(url).mkString.split("href=").size

  def timeMethod(method: () => Unit) = {
    val start = System.nanoTime()
    method()
    val end = System.nanoTime()
    println("Method took " + (end - start) / 1000000000.0 + " seconds.")
  }

  def getPageSizeSequentially() = {
    for (url <- urls) {
      println("Size for " + url + ": " + PageLoader.getPageSize(url))
    }
  }

  def getPageSize(url: String) = Source.fromURL(url).mkString.length

  def getPageSizeConcurrently() = {
    val system = ActorSystem("ActorSystem")

    val futures = urls.map(url => {
      val actor = system.actorOf(Props[PageLoaderActor])
      actor.ask(url)(5 seconds)
    })

    Await.ready(Future.sequence(futures), 20.seconds)
  }

  def getAnchorCountConcurrently() = {
    val system = ActorSystem("ActorSystem")

    val futures = urls.map(url => {
      val actor = system.actorOf(Props[AnchorCounterActor])
      actor.ask(url)(5 seconds)
    })

    Await.ready(Future.sequence(futures), 20.seconds)
  }
}

object Main extends App {
  println("Size Sequential run:")
  PageLoader.timeMethod {
    PageLoader.getPageSizeSequentially
  }

  println("Size Concurrent run:")
  PageLoader.timeMethod {
    PageLoader.getPageSizeConcurrently
  }

  println("Anchor Concurrent run:")
  PageLoader.timeMethod {
    PageLoader.getAnchorCountConcurrently
  }
}