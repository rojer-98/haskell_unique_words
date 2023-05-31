module Main (main) where

import Lib (wordCount)
import System.Environment

main :: IO ()
main = do
    [arg] <- getArgs
    (ws, count) <- wordCount arg
    putStrLn $
        "Unique words: "
            ++ ws
            ++ "\n"
            ++ "Words count: "
            ++ show count
