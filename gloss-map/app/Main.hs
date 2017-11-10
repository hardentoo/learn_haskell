module Main(main) where

import Data.List
import Graphics.Gloss

width, height, offsetX, offsetY :: Int

width   = 540
height  = 380
offsetX = 300
offsetY = 200

window :: Display
window = InWindow "Map" (width, height) (offsetX, offsetY)

background :: Color
background = black

drawing :: Picture
drawing = pictures (piclist 0 0 100 100 3)

--primitive x y = rectangleWire x y
primitive x y = circle (sqrt(x**2+y**2))

piclist a b x y 0 = [translate a b $ color rose $ primitive x y]
piclist a b x y n = [translate a b $ color rose $ primitive x y]
                    ++ piclist a (b+y/2) (x/2) (y/2) (n-1)
                    ++ piclist a (b-y/2) (x/2) (y/2) (n-1)
                    ++ piclist (a+x/2) b (x/2) (y/2) (n-1)
                    ++ piclist (a-x/2) b (x/2) (y/2) (n-1)

main :: IO()
main = display window background drawing
