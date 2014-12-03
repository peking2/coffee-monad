Learn You Monad in Coffeescript
============
Monad implementations in Coffeescript for learning and practice.
The goal is to make it as a guide for Coffeescript programmers to learn Monads.

## What is Monad?
* In general, Monad is a design pattern
* Specifically, Monad is a data structure which implements [Monad type class](#monad-type-class) and
satisfies [Monad laws](#monad-laws)

Monad was introduced in Haskell, but any language which supports higher order functions can implement Monads,
such as **Javascript**/**Coffeescript**

## Monad type class
Type class is a concept in Haskell. You can treat it as an interface in Java. Monad type class defines two functions,
unit and return.
* unit is to wrap a value into a monad. In Haskell it's named **return**.
* bind is to unwrap the value and apply it to a function which takes the value as input and outputs a monad.
In Haskell, it's **>>=** and in Scala it's **flatMap**.

We use Monad's name as unit function for conveniences, so you can write Maybe(5) instead of Maybe.unit(5).

In Haskell, bind function is infix operator >>=, so when you bind, it looks like
```haskell
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

## Monad laws
* **Left identity:** ```unit(a).bind f == f a```
* **Right identity:** ```m.bind unit == m```
* **Associativity:** ```(m.bind f).bind g == m.bind (x)-> f(x).bind g```

## How to use monad
### Haskell

```haskell
do
  a <- m(a)
  b <- m(b)
  c <- m(c)
  return (a+b+c)

    ||
    \/

m(a) >>= \a -> m(b) >>= \b -> m(c) >>= \c m(a+b+c)
```
### Coffeescript
```coffeescript
m(a).bind (a)->
  m(b).bind (b)->
    m(c).bind (c)->
      m(a+b+c)
```
Haskell has do-notation, but it's actually syntax sugar for bind(>>=).
Coffeescript doesn't support do-notation, but it looks like similar to Haskell binding combinations.

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