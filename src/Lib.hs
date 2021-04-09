module Lib
  ( Sign
      ( Rock
      , Paper
      , Scissors )
  , promptReady
  , countdown
  , promptSign
  , charToSign
  , aiChooseSign
  , showChoices
  , evaluateChoices ) where

import Control.Concurrent
  ( threadDelay )
import System.Random
  ( randomRIO )

-- The different signs of a rock paper scissors game
data Sign = 
    Rock
  | Paper
  | Scissors
  deriving
    ( Show
    , Eq
    , Bounded
    , Enum )
instance Ord Sign where -- Define the ordering of the different RPS signs (what beats what)
  compare Rock Paper     = LT
  compare Rock Scissors  = GT
  compare Paper Scissors = LT
  compare Paper Rock     = GT
  compare Scissors Rock  = LT
  compare Scissors Paper = GT

-- Prompts the player if they are ready
promptReady :: IO ()
promptReady = do
  putStrLn "Ready? (Enter)"

-- Shows a 3,2,1 countdown with delay
countdown :: IO ()
countdown = do
  putStrLn "3"
  threadDelay 1000000
  putStrLn "2"
  threadDelay 1000000
  putStrLn "1"
  threadDelay 1000000
  putStrLn "Shoot!"

-- Prompts the user for a sign
promptSign :: IO ()
promptSign = do
  putStrLn "(R)ock (P)aper (S)cissors"

-- Converts a char to a sign
charToSign :: Char -> Either String Sign
charToSign char
  | char == 'r' = Right Rock
  | char == 'R' = Right Rock
  | char == 'p' = Right Paper
  | char == 'P' = Right Paper
  | char == 's' = Right Scissors
  | char == 'S' = Right Scissors
  | otherwise   = Left "You entered an invalid sign, please choose (R)ock, (P)aper or (S)cissors next time."

-- Generates a random sign
aiChooseSign :: IO Sign
aiChooseSign = do
  n <- randomRIO (0,2)
  return $ toEnum n

-- Shows the player and ai sign choices (assumed player sign is first)
showChoices :: Sign -> Sign -> IO ()
showChoices s s' = putStrLn $ "You chose " ++ show s ++ " and your opponent chose " ++ show s'

-- Evaluates and shows the results of player and ai sign choices (assumed player sign is first)
evaluateChoices :: Sign -> Sign -> IO ()
evaluateChoices s s'
  | s == s' = putStrLn "It's a tie!"
  | s > s'  = putStrLn $ show s ++ " beats " ++ show s' ++ " you win!"
  | s < s'  = putStrLn $ show s' ++ " beats " ++ show s ++ " you lose!"
