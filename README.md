# elm-2d-linear-algebra-impl-perf

This repo compares the performance of different 2d-linear-algebra (2d vectors) implementations.

- [elm-2d-linear-algebra-impl-perf](#elm-2d-linear-algebra-impl-perf)
- [Result](#result)
- [Implementations](#implementations)
  - [elm-explorations/linear-algebra](#elm-explorationslinear-algebra)
  - [ADT](#adt)
  - [Record](#record)
  - [Tuple](#tuple)
- [Usage](#usage)
- [Results](#results)
  - [Apple M1](#apple-m1)


# Result

Use a `Tuple` if you want to do 2d vector math in Elm!

# Implementations

## elm-explorations/linear-algebra

This Package uses [elm-explorations/linear-algebra](https://package.elm-lang.org/packages/elm-explorations/linear-algebra/latest/).

It FFIs tme [webgl-mjs](https://code.google.com/archive/p/webgl-mjs/) library.

However, for 2D-LinA this was the slowest implementation.

## ADT

```elm
type Vec2
    = Vec2 Float Float
```

## Record 

```elm
type alias Vec2 =
    { x : Float
    , y : Float
    }
```

## Tuple

```elm
type alias Vec2 =
    ( Float, Float )
```

# Usage

1. `nix-shell -p elmPackages.elm`
2. `elm reactor`
3. Go to `http://localhost:8000/benchmarks/Suite.elm`


# Results

## Apple M1

| Browser | Implementation | Runs / second | Goodness of fit | Winner |
| ------- | -------------- | ------------- | --------------- | ------ |
| Firefox | Vec            | 3,483,184     | 99.45%          |        |
| Firefox | VecADT         | 28,548,490    | 99.35%          |        |
| Firefox | VecRecord      | 20,194,153    | 99.05%          |        |
| Firefox | VecTuple       | 40,845,616    | 98.97%          | *      |
|         |                |               |                 |        |
| Chrome  | Vec            | 3,421,129     | 99.79%          |        |
| Chrome  | VecADT         | 184,913,847   | 99.84%          | *      |
| Chrome  | VecRecord      | 17,422,017    | 99.87%          |        |
| Chrome  | VecTuple       | 185,103,925   | 99.79%          | *      |
|         |                |               |                 |        |
| Safari  | Vec            | 3,482,573     | 98.69%          |        |
| Safari  | VecADT         | 12,057,775    | 98.82%          | *      |
| Safari  | VecRecord      | 8,059,167     | 99.05%          |        |
| Safari  | VecTuple       | 12,414,330    | 99.26%          | *      |
