module Main where

import System.IO
  ( hSetBuffering
  , stdin
  , BufferMode (NoBuffering) )
import Control.Concurrent
  ( forkIO )
import Control.Concurrent.STM
  ( newTVarIO
  , atomically
  , writeTVar
  , readTVarIO )
import Data.Maybe
  ( fromJust )
import Lib
  ( Sign
      ( Rock
      , Paper
      , Scissors )
  , promptReady
  , countdown
  , promptSign
  , aiChooseSign
  , charToSign
  , showChoices
  , evaluateChoices )

main :: IO ()
main = do
  hSetBuffering stdin NoBuffering -- Set NoBuffering so getChar does not require an enter press
  promptReady -- Prompt the player if they are ready
  _ <- getChar -- Get any char from player to proceed
  countdown -- Show a 3,2,1 countdown
  promptSign -- Prompt the player for a sign
  charSign <- getChar -- Get player sign as a char
  putStrLn "" -- Put empty line after charChar
  t <- newTVarIO Rock -- Create tVar t with default value Rock
  _ <- forkIO $ do -- Spawn new thread
    aiSign <- aiChooseSign -- Generate random sign for ai
    atomically $ writeTVar t aiSign -- Write aiSign to tVar t
  aiSign <- readTVarIO t -- Read value from tVar t and bind it to aiSign
  let eitherPlayerSign = charToSign charSign
  case eitherPlayerSign of -- Check eitherPlayerSign for either error (player entered invalid sign) or sign value
    Left errorMessage -> -- If player entered invalid sign
      putStrLn errorMessage -- Show error message for invalid sign
    Right playerSign -> do -- If player entered valid sign
      showChoices playerSign aiSign -- Show the sign choices of player and ai
      evaluateChoices playerSign aiSign -- Evaluate and show the results of player and ai sign choices
