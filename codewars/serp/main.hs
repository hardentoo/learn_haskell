import System.IO
import Sierpinsky(sierpinsky)

main = do
    s <- readFile "in.txt"
    putStr $ sierpinsky $ read s
