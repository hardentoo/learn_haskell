module Main where

import Data.List
--import Lib

data BinTree a = Empty
                 | Node a (BinTree a) (BinTree a)
                              deriving (Show)

treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                             (treeFromList (filter (>x) xs))

main :: IO ()
main = do print $ treeFromList [7,2,4,8]
