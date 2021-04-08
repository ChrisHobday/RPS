module Lib
  ( Sign
      ( Rock
      , Paper
      , Scissors
      )
  , promptReady
  , countdown
  , promptSign
  , charToSign
  ) where

import Control.Concurrent

data Sign = 
    Rock
  | Paper
  | Scissors
  deriving
    ( Show
    , Eq
    )
instance Ord Sign where
  compare Rock Paper     = LT
  compare Rock Scissors  = GT
  compare Paper Scissors = LT
  compare Paper Rock     = GT
  compare Scissors Rock  = LT
  compare Scissors Paper = GT

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

charToSign :: Char -> Sign
charToSign char
  | char == 'r' = Rock
  | char == 'R' = Rock
  | char == 'p' = Paper
  | char == 'P' = Paper
  | char == 's' = Scissors
  | char == 'S' = Scissors
