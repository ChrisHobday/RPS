module Testing.Time where

import System.CPUTime
  ( getCPUTime )
import Numeric
  ( showFFloat )

time :: IO t -> IO ()
time a = do
    start <- getCPUTime
    v <- a
    end   <- getCPUTime
    let diff = fromIntegral (end - start) / (10^12)
    putStrLn $ "Computation time: " ++ showFFloat Nothing diff "" ++ " seconds"
    return () 
