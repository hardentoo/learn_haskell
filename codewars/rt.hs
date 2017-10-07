module CodeWars.Largest (largest) where
import Data.List (sort)

largest :: Ord a => Int -> [a] -> [a]
largest n xs = sort (take n (reverse(sort xs)))
