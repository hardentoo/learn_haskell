module Main where

import Mark
import System.Environment

main :: IO ()
main = do
   args <- getArgs
   content <- readFile (head args)
   let output = last args
   let linesOfFiles = lines content
   writeFile output $ concat $ map ((++"\n").mark) linesOfFiles

