#!/usr/bin/runhaskell

import Data.List
import Control.Applicative
import System.Console.ANSI
import System.Environment
import System.Directory
 
colorStrLn :: ColorIntensity -> Color -> ColorIntensity -> Color -> String -> IO ()
colorStrLn fgi fg bgi bg str = do
  setSGR [SetColor Foreground fgi fg, SetColor Background bgi bg]
  putStr str
  setSGR []
--  putStrLn ""

isRegularFileOrDirectory :: FilePath -> Bool
isRegularFileOrDirectory file = file /= "." && file /= ".."

main = do
  [f] <- getArgs
  s <- readFile f
  colorStrLn Vivid Green Dull Black s
  fileNames <- filter isRegularFileOrDirectory <$> getDirectoryContents "/var/db/pkg"
  putStrLn $ show $ fileNames
