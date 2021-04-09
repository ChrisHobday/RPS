module Main where

import System.IO
  ( hSetBuffering
  , stdin
  , BufferMode (NoBuffering) )

import Lib

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
  case eitherPlayerSign of
    Left errorMessage ->
      putStrLn errorMessage
    Right playerSign ->
      showChoices playerSign aiSign
