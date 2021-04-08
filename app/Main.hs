module Main where

import System.IO
  ( hSetBuffering
  , stdin
  , BufferMode (NoBuffering) )

import Lib

main :: IO ()
main = do
  hSetBuffering stdin NoBuffering -- get Char without requiring enter
  promptReady
  _ <- getChar
  countdown
  promptSign
  sign <- getChar
  putChar sign