module Main where

import Graphics.Gloss
import Lib
import System.IO

main :: IO ()
main = do
  line <- getLine
  print line
  view $ parse line
  main

view line = display window background drawing
  where
    width, height, offsetX, offsetY :: Int
    width = 540
    height = 380
    offsetX = 300
    offsetY = 200
    window :: Display
    window = InWindow "Functional Geometry" (width, height) (offsetX, offsetY)
    background :: Color
    background = white
    drawing :: Picture
    drawing = pictures (piclist line)

parse :: String -> String
parse line =
  if line == "1"
    then "1"
    else "2"

piclist line =
  if line == "1"
    then [circleSolid 5]
    else [circleSolid 50]
