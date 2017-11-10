module Main(main) where

import Data.List
import Graphics.Gloss

class View a where
      view :: a -> IO ()

data BinTree a = Empty
                 | Node a (BinTree a) (BinTree a)
                              deriving (Eq, Ord)

-- говорим что  BinTree будет экземпляром Show
instance (Show a) => Show (BinTree a) where
  -- перед корнем будет отображаться '<' 
  -- и напишем : в начале строки
  show t = "< " ++ replace '\n' "\n: " (treeshow "" t)
    where
    -- treeshow pref Tree
    --   отображает дерево и начинает каждую строку с  pref
    -- Мы не будем отображать пустое дерево
    treeshow pref Empty = ""
    -- Leaf
    treeshow pref (Node x Empty Empty) =
                  (pshow pref x)

    -- Правая ветка пустая
    treeshow pref (Node x left Empty) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " left)

    -- Левая ветка пустая
    treeshow pref (Node x Empty right) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    -- Дерево с непустыми правой и левой ветками
    treeshow pref (Node x left right) =
                  (pshow pref x) ++ "\n" ++
                  (showSon pref "|--" "|  " left) ++ "\n" ++
                  (showSon pref "`--" "   " right)

    -- отображение дерева с  красивыми префиксами
    showSon pref before next t =
                  pref ++ before ++ treeshow (pref ++ next) t

    -- pshow заменяет "\n" на "\n"++pref
    pshow pref x = replace '\n' ("\n"++pref) (show x)

    -- заменяет символ строкой
    replace c new string =
      concatMap (change c new) string
      where
          change c new x
              | x == c = new
              | otherwise = x:[] -- "x"

-- говорим что  BinTree будет экземпляром Show
instance View (BinTree a) where
  -- перед корнем будет отображаться '<' 
  -- и напишем : в начале строки
     view t = display window background drawing where

          width, height, offsetX, offsetY :: Int

          width   = 540
          height  = 380
          offsetX = 300
          offsetY = 200

          window :: Display
          window = InWindow "Tree" (width, height) (offsetX, offsetY)

          background :: Color
          background = black

          drawing :: Picture
          drawing = pictures (piclist t)

          piclist :: BinTree a -> [Picture]
          piclist t = treeview t 0 0 5

          treeview :: BinTree a -> Float -> Float -> Float -> [Picture]
          treeview Empty _ _ _= []
          treeview (Node a Empty Empty) x y r = pshow x y r blue

          treeview (Node a left Empty) x y r =
                  (pshow x y r green) ++
                  (treeview left (x-40) (y-40) r)

          treeview (Node a Empty right) x y r =
                  (pshow x y r green) ++
                  (treeview right (x+20) (y-40) r)

          treeview (Node a left right) x y r =
                  (pshow x y r red) ++
                  (treeview left (x-40) (y-40) r) ++
                  (treeview right (x+20) (y-60) r)

          pshow :: Float -> Float -> Float -> Color -> [Picture]
          pshow x y r col = [translate x y $ color col $ circleSolid r] -- ++ [translate x y $ color col $ text a]

treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                             (treeFromList (filter (>x) xs))

main :: IO()
main = do
       print $ treeFromList [7,2,4,8,1,3,6,21,12,23,28,34,45,17]
       view $ treeFromList  [7,2,4,8,1,3,6,21,12,23,28,34,45,17]
