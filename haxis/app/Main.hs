module Main where

import Haxis

main :: IO ()
main = drawPoints (getFunc(Quad 1 0 0)) [1..4]
