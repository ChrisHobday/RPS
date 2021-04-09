module Main where

import System.IO
  ( hSetBuffering
  , stdin
  , BufferMode (NoBuffering) )
import Data.Either
  ( isLeft )

import Lib

main :: IO ()
main = do
  hSetBuffering stdin NoBuffering -- Get Char without requiring enter
  promptReady
  _ <- getChar
  countdown
  promptSign
  charSign <- getChar
  aiSign <- aiChooseSign
  let playerSign = charToSign charSign
  if isLeft playerSign -- Check if player entered invalid sign (using Either)
    then do
      print playerSign
  else
    do
      print playerSign
      -- showChoices $ (charToSign charSign) aiSign