module Permutations
  ( permutations'
  ) where

import Data.Char ()

permutations' :: [String] -> [Int]
permutations' list = perm [] list len
  where
    len = length $ head list

perm :: [Int] -> [String] -> Int -> [Int]
perm res _ 0 = res
perm res xs len = perm (res ++ [b - a]) xstail (len - 1)
  where
    a = read $ minimum $ map (map head) [[x] | x <- xs] :: Int
    b = read $ maximum $ map (map head) [[x] | x <- xs] :: Int
    xstail = map tail xs
