import Lib

import Data.Maybe
import Control.Concurrent
import Control.Concurrent.STM
import System.Random

main :: IO ()
main = do
  t <- newTVarIO Rock
  -- _ <- forkIO $ aiChooseSign >>= putMVar m

  _ <- forkIO $ do
    aiSign <- aiChooseSign
    putStrLn $ "Generated sign " ++ show aiSign
    atomically $ writeTVar t aiSign
    test <- readTVarIO t
    print test

  putStrLn "outside"

  test <- readTVarIO t
  print test

  test <- readTVarIO t
  print test

  test <- readTVarIO t
  print test

  test <- readTVarIO t
  print test

  test <- readTVarIO t
  print test

  return ()
