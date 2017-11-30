module Main where

import System.Environment

step :: Integer -> Integer
-- (2,5)
-- step n
--    | mod n 2 == 0 = div n 2
--    | mod n 2 == 1 = 5 * n + 1
-- (3,5)
step n
  | mod n 3 == 0 = div n 3
  | mod n 3 == 1 = 5 * n + 1
  | mod n 3 == 2 = 5 * n + 2

-- (5,7)
--step n
--  | mod n 5 == 0 = div n 5
--  | mod n 5 == 1 = 7 * n + 3
--  | mod n 5 == 2 = 7 * n + 1
--  | mod n 5 == 3 = 7 * n + 4
--  | mod n 5 == 4 = 7 * n + 2
--step n
--  | mod n 3 == 0 = div n 3
--  | mod n 3 == 1 = 7 * n + 2
--  | mod n 3 == 2 = 7 * n + 1
coll :: [Integer] -> Integer -> Integer -> [Integer]
coll l s n
  | n == s = l
  | length l > 10000 = l
  | otherwise = coll (m : l) s m
  where
    m = step n

main :: IO ()
main = do
  list <- getArgs
  let n = read (head list)
  --print $ filter (== 36) $ reverse $ coll [step n, n] n $ step n
  print $ reverse $ coll [step n, n] n $ step n
