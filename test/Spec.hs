import Lib
import Testing.Time

import Control.Concurrent

main :: IO ()
main = do
  tid1 <- myThreadId
  print tid1
  tid2 <- forkIO (putStrLn "")
  print tid2
  tid3 <- forkIO (putStrLn "")
  print tid3
  tid4 <- forkIO (putStrLn "")
  print tid4
  tid5 <- forkIO (putStrLn "")
  print tid5
  tid6 <- forkIO (putStrLn "")
  print tid6
  tid7 <- forkIO (putStrLn "")
  print tid7
  tid8 <- forkIO (putStrLn "")
  print tid8
  tid9 <- forkIO (putStrLn "")
  print tid9
  tid10 <- forkIO (putStrLn "")
  print tid10
  tid11 <- forkIO (putStrLn "")
  print tid11
  tid12 <- forkIO (putStrLn "")
  print tid12
  tid13 <- forkIO (putStrLn "")
  print tid13
  tid14 <- forkIO (putStrLn "")
  print tid14
  tid15 <- forkIO (putStrLn "")
  print tid15
  tid16 <- forkIO (putStrLn "")
  print tid16
  tid17 <- forkIO (putStrLn "")
  print tid17
  tid18 <- forkIO (putStrLn "")
  print tid18
  tid19 <- forkIO (putStrLn "")
  print tid19
  tid20 <- forkIO (putStrLn "")
  print tid20
