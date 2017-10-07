#!/usr/bin/runhaskell

import Control.Applicative
import System.Directory
import System.Console.ANSI

colorStrLn :: ColorIntensity -> Color -> ColorIntensity -> Color -> String -> IO ()
colorStrLn fgi fg bgi bg str = do
  setSGR [SetColor Foreground fgi fg, SetColor Background bgi bg]
  putStr str
  setSGR []
  putStrLn ""

isRegularFileOrDirectory :: FilePath -> Bool
isRegularFileOrDirectory f = f /= "." && f /= ".."

info = colorStrLn Vivid Green Dull Black

main :: IO ()
main = do
  info "Рабочая диреткория /var/db/pkg"
  fileNames <- filter isRegularFileOrDirectory <$> getDirectoryContents "/var/db/pkg"
  info $ show $ fileNames 
