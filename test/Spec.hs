import Lib

import Data.Maybe
import Control.Concurrent
import Control.Concurrent.STM
import System.Random

main :: IO ()
main = do
  t <- newTVarIO Rock

  _ <- forkIO $ do
    aiSign <- aiChooseSign
    atomically $ writeTVar t aiSign

  test <- readTVarIO t
  print test

  return ()
