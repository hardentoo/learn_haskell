module Triplets where

import Data.List

recoverSecret :: [String] -> String
recoverSecret triplets = undefined

test :: [Int] -> Int
test xs = sum xs + product xs

-- Следующая функция перемножает почленно 2 массива
xyprod xs ys = zipWith (*) xs ys

vecsum :: [Int] -> [Int] -> [Int]
vecsum = zipWith (+)
