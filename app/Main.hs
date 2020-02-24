module Main where

import           Lib
import           System.Console.Haskeline

main :: IO ()

main = runInputT defaultSettings loop
 where
  loop :: InputT IO ()
  loop = do
    minput <- getInputLine "\x1b[35mHaskShell \x1b[32mλ \x1b[36m"
    outputStr "\x1b[m"
    shellEval minput loop
