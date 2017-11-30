module LastDigit where

lastDigit :: Integer -> Integer -> Integer
lastDigit _ 0 = 1
lastDigit a b = mod ((mod a 10) ^ (4 + (mod b 4))) 10
