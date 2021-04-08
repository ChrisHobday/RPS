module Lib
  ( promptReady
  , countdown
  , promptSign
  ) where

import Control.Concurrent

data Sign = 
    Rock
  | Paper
  | Scissors
  deriving
    ( Eq 
    , Enum
    , Bounded )
-- instance Show Suit where
--   show Hearts   = "H"
--   show Diamonds = "D"
--   show Clubs    = "C"
--   show Spades   = "S"

promptReady :: IO ()
promptReady = do
  putStrLn "Ready? (Enter)"

-- getReady :: IO String
-- getReady = _ <- getChar

countdown :: IO ()
countdown = do
  putStrLn "3"
  threadDelay 1000000
  putStrLn "2"
  threadDelay 1000000
  putStrLn "1"
  threadDelay 1000000
  putStrLn "Shoot!"

promptSign :: IO ()
promptSign = do
  putStrLn "(R)ock (P)aper (S)cissors"

-- getSign :: IO Sign
-- getSign = sign <- getChar
