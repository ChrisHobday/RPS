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

data Sign = 
    Rock
  | Paper
  | Scissors
  deriving
    ( Show
    , Eq
    , Bounded
    , Enum )
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

charToSign :: Char -> Either String Sign
charToSign char
  | char == 'r' = Right Rock
  | char == 'R' = Right Rock
  | char == 'p' = Right Paper
  | char == 'P' = Right Paper
  | char == 's' = Right Scissors
  | char == 'S' = Right Scissors
  | otherwise   = Left "You entered an invalid sign, please choose R, P or S next time."

aiChooseSign :: IO Sign
aiChooseSign = do
  n <- randomRIO (0,2)
  return $ toEnum n

showChoices :: Sign -> Sign -> IO ()
showChoices s s' = putStrLn $ "You chose " ++ show s ++ " and your opponent chose " ++ show s'

evaluateChoices :: Sign -> Sign -> IO ()
evaluateChoices s s'
  | s > s'  = putStrLn $ show s ++ " beats " ++ show s' ++ " you win!"
  | s < s'  = putStrLn $ show s' ++ " beats " ++ show s ++ " you lose!"
  | s == s' = putStrLn "It's a tie!"
