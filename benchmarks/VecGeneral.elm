module VecGeneral exposing (..)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import VecADTGeneral


vecInt : VecADTGeneral.Vec Int
vecInt =
    VecADTGeneral.Vec 1 1


vecFloat : VecADTGeneral.Vec Float
vecFloat =
    VecADTGeneral.Vec 1 1


suite : Benchmark
suite =
    describe "Implementation"
        [ Benchmark.compare "Vec Int vs Vec Float"
            "Int"
            (\_ -> VecADTGeneral.add vecInt vecInt)
            "Float"
            (\_ -> VecADTGeneral.add vecFloat vecFloat)
        , Benchmark.compare "Vec Int vs Vec Float"
            "Int"
            (\_ -> VecADTGeneral.scale 3 vecInt)
            "Float"
            (\_ -> VecADTGeneral.scale 3 vecFloat)
        ]


main : BenchmarkProgram
main =
    program suite
