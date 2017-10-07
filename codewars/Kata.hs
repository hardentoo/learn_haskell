module Kata where

sumArray :: Maybe [Int] -> Int
sumArray Nothing = 0
sumArray (Just []) = 0
sumArray (Just [x]) = 0
sumArray (Just xs) = sum xs - minimum xs - maximum xs
