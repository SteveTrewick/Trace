# Trace

A simple struct in swift that I use to build error handling when I have lots of low down 
and dirty stuff deep in packages, etc, that will bubble errors up to importing code.

Honestly, this is probably not the right way to do it, but eh.

Anyway...

```
class MyFancyClass {
  // ...

  public func someFancyFunction() -> Result<T, Trace> {
    //...
    return .failure( .trace(self, tag: "oh no! something went horribly wrong" )
  }
}
```

Your Trace struct will now contain something like ...
```
  Trace ( tag     : "oh no! something went horribly wrong", 
          source  : "MyFancyClass",  
          line    :  29 
          file    : "/path/to/your/file.swift", 
          function: "someFancyFunction", 
          custom  :  nil 
  )
```

Unless you also passed a custom object/struct to provide more context.


And you can throw it, if you happen to like swift's exception handling.

```
class MyFancyClass {
  // ...

  public func someFancyFunction() throws {
    //...
    throw Trace(self, tag: "oh no! something went horribly wrong" )
  }
}
```


Or use it loosely typed to just an Error, wherever that's a thing.

```
public func handler(_ result: Result<Int, Error>) {
  // ...
}

handler( .failure( Trace(self, tag: "oh no! something went horribly wrong" ) )

```

And that's about it, really, now the readme is longer than the actual code which honestly, you'd have been better off just looking at
