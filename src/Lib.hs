module Lib
    ( someFunc
    , countdown
    ) where

import Control.Concurrent

someFunc :: IO ()
someFunc = putStrLn "someFunc"

countdown :: IO ()
countdown = do
    putStrLn "3"
    threadDelay 1000000
    putStrLn "2"
    threadDelay 1000000
    putStrLn "1"
    threadDelay 1000000
    putStrLn "Shoot!"


-- promptReady :: IO ()
-- promptReady = do
--     putStrLn "Ready?"
--     _ <- getChar
