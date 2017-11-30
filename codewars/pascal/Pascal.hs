module Pascal where

import Data.Char ()

pascalsTriangle :: Int -> [Int]
pascalsTriangle n = reverse $ (=<<) id (_pascalsTriangle [[1]] n)

_pascalsTriangle :: [[Int]] -> Int -> [[Int]]
_pascalsTriangle xs 1 = xs
_pascalsTriangle xs n = _pascalsTriangle ((step . head) xs : xs) (n - 1)

step :: [Int] -> [Int]
step xs = zipWith (+) (0 : xs) (xs ++ [0])
