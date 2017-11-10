module Codewars.Kata.Combos where

import Data.List

combos :: Int -> [[Int]]
combos 1 = [[1]]
combos 2 = [[1, 1], [2]]
combos n =
  removeDuplicates
    (map
       sort
       ([n] : concat [map (++ [i]) (combos (n - i)) | i <- [1 .. (n - 1)]]))

removeDuplicates :: Eq a => [[a]] -> [[a]]
removeDuplicates [] = []
removeDuplicates (x:xs) = x : removeDuplicates (filter (\y -> x /= y) xs)

ps = [] : map parts [1 ..]
  where
    parts n = [n] : [x : p | x <- [1 .. n], p <- ps !! (n - x), x <= head p]
