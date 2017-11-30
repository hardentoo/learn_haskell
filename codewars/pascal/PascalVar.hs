module PascalVar where

pascalsTriangle :: Int -> [Int]
pascalsTriangle n = concat $ map pascalsLine [0 .. (n - 1)]

step xs = zipWith (+) ([0] ++ xs) (xs ++ [0])

rep n f = foldr (.) id (replicate n f)

pascalsLine n = (rep n step) [1]
