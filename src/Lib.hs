module Lib
  ( promptReady
  , countdown
  ) where

import Control.Concurrent


promptReady :: IO ()
promptReady = do
  putStrLn "Ready? (Enter)"

getReady :: IO String
getReady = _ <- getChar

countdown :: IO ()
countdown = do
  putStrLn "3"
  threadDelay 1000000
  putStrLn "2"
  threadDelay 1000000
  putStrLn "1"
  threadDelay 1000000
  putStrLn "Shoot!"

