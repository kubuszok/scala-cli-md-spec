# Multi-file snippets

## Simple multi-file

Multiple files grouped into one snippet.

```scala
// file: model.scala - part of simple multi-file
case class Person(name: String, age: Int)
```

```scala
// file: main.sc - part of simple multi-file
println(Person("Alice", 30))
// expected output:
// Person(Alice,30)
```

## Multi-file with test scope

Using `.test.scala` to trigger `scala-cli test`.

```scala
// file: lib.scala - part of test scope example
//> using scala 3.3.6

object Adder:
  def add(a: Int, b: Int): Int = a + b
```

```scala
// file: lib.test.scala - part of test scope example
//> using test.dep org.scalameta::munit::1.2.0

class AdderSpec extends munit.FunSuite:
  test("add two numbers"):
    assertEquals(Adder.add(1, 2), 3)
```

## Java interop

Java files in a multi-file snippet.

```java
// file: Direction.java - part of java interop
enum Direction {
  NORTH, SOUTH, EAST, WEST;
}
```

```scala
// file: main.sc - part of java interop
println(Direction.NORTH)
// expected output:
// NORTH
```
