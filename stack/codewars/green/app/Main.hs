module Main where

import System.Environment(getArgs)
import Green(green)

main :: IO ()
main = do
       s <- getArgs
       let out = green (read (head s) :: Int)
       print out
