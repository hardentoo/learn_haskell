module Green where

green :: Int -> Integer
green 1 = 1
green 2 = 5
green 3 = 6
green n = read (_green "5" "6" (n-2))::Integer

_green :: String -> String -> Int -> String
_green s1 s2 0 = s1
_green s1 s2 1 = s2

_green s1 s2 n | head g1 == '0' && head g2 == '0' =  _green g1 g2 (n-2)
               | head g1 == '0'                   =  _green g1 g2 (n-1)
               | head g2 == '0'                   =  _green g2 g1 (n-1)
               | otherwise                        =  _green (minimum [g1, g2]) (maximum [g1, g2]) (n-2)

    where g1 = _gen s1; g2 = _gen s2


_gen :: String -> String
_gen s | _test d (read ("1" ++ s)) = "1" ++ s
       | _test d (read ("2" ++ s)) = "2" ++ s
       | _test d (read ("3" ++ s)) = "3" ++ s
       | _test d (read ("4" ++ s)) = "4" ++ s
       | _test d (read ("5" ++ s)) = "5" ++ s
       | _test d (read ("6" ++ s)) = "6" ++ s
       | _test d (read ("7" ++ s)) = "7" ++ s
       | _test d (read ("8" ++ s)) = "8" ++ s
       | _test d (read ("9" ++ s)) = "9" ++ s
       | otherwise = "0" ++ s where d = 10^(length(s)+1)

_test d n = mod (n^2 - n) d == 0
