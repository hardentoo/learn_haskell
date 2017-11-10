module Mark
    (
      mark
    ) where

mark :: String -> String
mark s = if length s > 0 then "1. [" ++ s ++ "](" ++ s ++ ")" else ""
