module Main where

import Lib
import System.Process
import Control.Monad.Trans.Class
import System.Console.Haskeline

main :: IO ()

main = runInputT defaultSettings loop
   where
       loop :: InputT IO ()
       loop = do
           minput <- getInputLine "\x1b[35mHaskTerm \x1b[32mλ \x1b[36m"
           case minput of
               Nothing -> return ()
               Just "quit" -> return ()
               Just input -> do 
                                outputStr "\x1b[m"
                                lift (callCommand input)
                                loop
