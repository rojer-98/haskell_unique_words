{-# LANGUAGE ImportQualifiedPost #-}

module Lib (
    wordCount,
)
where

import Data.Char
import Data.List (group, sort)
import Data.Text qualified as T
import Data.Text.IO qualified as TIO

wordCount :: String -> IO (String, Int)
wordCount arg = do
    t <- TIO.readFile arg
    let ws =
            map head
                $ group
                $ sort
                $ map T.toCaseFold
                $ filter (not . T.null)
                $ map
                    ( T.dropAround $
                        not . isLetter
                    )
                $ T.words t
    return (T.unpack $ T.unwords ws, length ws)
