module Main where

import System.Environment

coll :: Integer -> Integer
coll n
  | n < 5 = 1
  | mod n 3 == 0 = coll (div n 3)
  | mod n 3 == 1 = coll (5 * n + 1)
  | mod n 3 == 2 = coll (5 * n + 2) -- при этих параметрах возникают циклы

main = do
  list <- getArgs
  let n = read (head list)
  print $ map coll [1 .. n]
