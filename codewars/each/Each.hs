module Each where

import Data.List (drop, reverse)

each :: Int -> [Int] -> [Int]
each n [] = []
each 0 _ = []
each n list =
  if n > 0
    then if n > length list
           then []
           else let tale = drop (n - 1) list
                in head tale : each n (tail tale)
    else each (-n) (reverse list)
