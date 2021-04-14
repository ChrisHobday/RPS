import Lib

import Control.Concurrent.STM

main :: IO ()
main = do
  t <- newTVarIO "tVarTest"
  test <- readTVarIO t
  print test

  return ()
