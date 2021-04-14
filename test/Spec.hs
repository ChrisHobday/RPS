import Lib

import Data.Maybe
import Control.Concurrent.STM

tF :: String
tF = undefined

main :: IO ()
main = do
  t <- newTVarIO Rock
  -- _ <- forkIO $ aiChooseSign >>= putMVar m
  atomically $ writeTVar t Paper
  test <- readTVarIO t
  print $ test

  return ()
