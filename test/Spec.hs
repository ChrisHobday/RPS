import Lib

import Control.Concurrent

main :: IO ()
main = do
  m <- newEmptyMVar -- Create empty mVar m
  forkIO $ aiChooseSign >>= putMVar m -- Generate random sign for ai concurrently and place it in mVar m
  test <- takeMVar m -- Take value from mVar m and bind it to test
  print test

  putStrLn "end"
