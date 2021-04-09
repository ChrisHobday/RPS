module Main where

import System.IO
  ( hSetBuffering
  , stdin
  , BufferMode (NoBuffering) )

import Lib
  ( promptReady
  , countdown
  , promptSign
  , aiChooseSign
  , charToSign
  , showChoices
  , evaluateChoices )

main :: IO ()
main = do
  hSetBuffering stdin NoBuffering -- Get Char without requiring enter
  promptReady
  _ <- getChar
  countdown
  promptSign
  charSign <- getChar
  putStrLn "" -- Put empty line after charChar
  aiSign <- aiChooseSign
  let eitherPlayerSign = charToSign charSign
  case eitherPlayerSign of -- Check eitherPlayerSign for either Error (player entered invalid sign) or Sign value
    Left errorMessage ->
      putStrLn errorMessage
    Right playerSign -> do
      showChoices playerSign aiSign
      evaluateChoices playerSign aiSign
