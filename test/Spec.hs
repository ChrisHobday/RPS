import Lib

import Data.IORef
import Control.Concurrent

main :: IO ()
main = do
  ioR <- newIORef "initTest"
  _ <- forkIO $ writeIORef ioR "writeTest"
  -- writeIORef ioR "writeTest"
  test <- readIORef ioR
  print test

  return ()
