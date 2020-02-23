module Main where

import           Lib
import           System.Process
import           System.Exit
import           Control.Monad.Trans.Class
import           System.Console.Haskeline

main :: IO ()

main = runInputT defaultSettings loop
 where
  loop :: InputT IO ()
  loop = do
    minput <- getInputLine "\x1b[35mHaskTerm \x1b[32mλ \x1b[36m"
    outputStr "\x1b[m"
    case minput of
      Nothing     -> return ()
      Just "exit" -> return ()
      Just input  -> do
        lift (runCmd input)
        loop

runCmd ""    = putStr ""
runCmd input = do
  system ("bash -c \"" ++ input ++ "\"")
  putStr ""
