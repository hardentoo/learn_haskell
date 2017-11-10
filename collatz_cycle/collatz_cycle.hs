module Main where

import System.Environment


step :: Integer -> Integer
step n 
  | mod n 3 == 0 = div n 3
  | mod n 3 == 1 = 5 * n + 1
  | mod n 3 == 2 = 5 * n + 2

coll :: [Integer] -> Integer -> Integer -> [Integer]
coll l s n
  | n == s = l
  | length l > 10000 = l
  | otherwise = coll (m:l) s m where m = step n

main = do
  list <- getArgs
  let n = read (head list)
  print $ filter (==36) $ reverse $ coll [step n, n] n $ step n
