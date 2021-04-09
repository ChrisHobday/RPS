-- import Lib

data Sign = 
    Rock
  | Paper
  | Scissors
  deriving
    ( Show
    , Eq
    , Bounded
    , Enum )
instance Ord Sign where
  compare Rock Paper     = LT
  compare Rock Scissors  = GT
  compare Paper Scissors = LT
  compare Paper Rock     = GT
  compare Scissors Rock  = LT
  compare Scissors Paper = GT

evaluateChoices :: Sign -> Sign -> IO ()
evaluateChoices s s'
  | s == s' = putStrLn "It's a tie!"
  | s > s'  = putStrLn $ show s ++ " beats " ++ show s' ++ " you win!"
  | s < s'  = putStrLn $ show s' ++ " beats " ++ show s ++ " you lose!"

testEval :: Int -> Int -> IO ()
testEval a b
  | a > b  = putStrLn $ show a ++ " is greater than " ++ show b
  | a < b  = putStrLn $ show b ++ " is greater than " ++ show a
  | a == b = putStrLn $ show a ++ " and " ++ show b ++ " are equal"

main :: IO ()
main = do
  testEval 1 1
