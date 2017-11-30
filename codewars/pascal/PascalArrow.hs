module PascalArrow where

import Control.Arrow

{-
pascalsTriangle :: Int -> [Int]
pascalsTriangle n = (=<<) id (_pascalsTriangle [[1]] n)

_pascalsTriangle :: [[Int]] -> Int -> [[Int]]
_pascalsTriangle xs 1 = xs
_pascalsTriangle xs n = _pascalsTriangle (((step . head) xs) : xs) (n - 1)


f :: Arrow [Int] -> [Int]
f = ([0] ++)

g :: Arrow [Int] -> [Int]
g = (++ [0])

af = arr f
ag = arr g
-}

prepend x = arr (x ++)
append x = arr (++ x)

--step = liftA2 (++) (prepend 0) (append 0)
