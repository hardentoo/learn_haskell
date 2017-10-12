module Sierpinsky where

sierpinsky :: Integral a => a -> String

sierpinsky 0 = "L"
sierpinsky n = concat (map ( (++"\n") . clean) (_sierpinsky n))

_sierpinsky :: Integral a => a -> [String]
_sierpinsky 1 = ["L ", "L L "]
_sierpinsky n = list ++ map (concat . (replicate 2)) list where
         list = [x ++ concat (replicate (2^(n) - length x) " ") | x <- _sierpinsky (n-1)]

clean s = if last s == ' ' then clean (init s) else s
