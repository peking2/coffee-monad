Learn You Monad in Coffeescript
============
Monad implementations in Coffeescript for learning and practice.
The goal is to make it as a guide for Coffeescript programmers to learn Monads.

## What is Monad?
* In general, Monad is a design pattern
* Specifically, Monad is a data structure which implements **unit** (or *return* in Haskell)
and **bind** (or >>= in Haskell, *flatMap* in Scala)
and they satisfy [Monad laws](https://www.haskell.org/haskellwiki/Monad_laws)
* Monads were introduced in Haskell, but any language which supports higher order functions can implement Monads,
such as **Javascript**/**Coffeescript**

## Monad type class
Type class is a concept in Haskell. You can treat it as a interface in Java. Monad type class defines two functions,
unit and return.
* unit is to wrap a value into a monad
* bind is to take the value out of monad and apply it to a function which takes regular value as input and outputs a monad

In Haskell, bind function is infix operator >>=, so when you bind, it looks like
```
m >>= \ a -> m
```
Javascript doesn't support operator overloading, so it would look like
```coffeescript
bind m (a)-> m
```
It's not as convenient as Haskell, so we leverage Javascript's OO nature and make bind as a method of monad. Thus it looks like
```coffeescript
m.bind (a)-> m
```

## Installation

```bash
$ npm install coffee-monad
```

## Unit Test

```bash
$ jasmine-node --coffee --verbose spec/
```
## Change Log
* update README (Dec. 1, 2014)
* State monad (Nov. 30, 2014)
* Writer, Reader monad (Nov. 29, 2014)
* IO monad (Nov. 29, 2014)
* Maybe, List monad (Nov. 28, 2014)