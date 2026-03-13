# Cross-compilation

## Multiple Scala versions

A snippet that compiles and runs under multiple Scala versions.

```scala
//> using scala 3.3.6 3.6.4
println("cross-compiled")
// expected output:
// cross-compiled
```

## Compile error across versions

A snippet expected to fail compilation under multiple Scala versions.

```scala
//> using scala 3.3.6 3.6.4
val x: String = 42
// expected compile error:
// Found:    (42 : Int)
```
