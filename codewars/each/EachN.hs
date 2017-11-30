module Each where

import Data.List (drop, product, sum)

each :: Int -> [Int] -> [Int]
each _ [] = []
each 0 _ = []
each n list
  | n > length list = []
  | otherwise = head tale : each n (tail tale)
  where
    tale = drop (n - 1) list
