module Lib
  ( runCmd,
    shellEval
  )
where

import           Control.Monad.Trans.Class
import           System.Process


shellEval minput loop = case minput of
  Nothing     -> return ()
  Just "exit" -> return ()
  Just input  -> do
    lift (runCmd input)
    loop

runCmd ""    = putStr ""
runCmd input = do
  system ("bash -c \"" ++ input ++ "\"")
  putStr ""
