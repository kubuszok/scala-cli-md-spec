# Basic snippets

## Pseudocode ignored

Snippets without `//> using` are considered pseudocode and ignored.

```scala
// no using directive, this is pseudocode
val x = 42
println(x)
```

## sbt ignored

Snippets containing `libraryDependencies` are treated as sbt examples and ignored.

```scala
//> using scala 3.3.6
libraryDependencies += "org.example" %% "lib" % "1.0.0"
```

## Success without output

A snippet that should compile and run successfully.

```scala
//> using scala 3.3.6
val x: Int = 42
println(x)
```

## Success with expected output

A snippet that should produce specific output.

```scala
//> using scala 3.3.6
println("hello world")
// expected output:
// hello world
```

## Success with multiple expected outputs

A snippet with multiple lines of expected output.

```scala
//> using scala 3.3.6
println("first")
println("second")
// expected output:
// first
// second
```

## Runtime error

A snippet expected to fail at runtime.

```scala
//> using scala 3.3.6
throw new Exception("runtime boom")
// expected error:
// runtime boom
```

## Compile error

A snippet expected to fail at compilation.

```scala
//> using scala 3.3.6
summon[String]
// expected compile error:
// No given instance of type String was found
```

## Compile only

A snippet that should only be compiled, not run.

```scala
//> using scala 3.3.6
// compile-only
val x: Int = 42
```
