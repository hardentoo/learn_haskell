module LastDigit where

lastDigit :: Integer -> Integer -> Integer
lastDigit a b = mod ((_lastDigit a) ^ (_lastDigit b)) 10

_lastDigit a = mod a 10
