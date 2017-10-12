import System.IO

main = do
    contents <- readFile "in.txt"
    putStr contents
