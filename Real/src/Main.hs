import Helpers ()
import Kata ()

--import Data.Text(replicate)
--import Prelude hiding (replicate)
main :: IO ()
--main = putStrLn (hello "Сергей")
main = print (take 2 (replicate 100 "127.0.0.1"))
