{--
-- EPITECH PROJECT, 2023
-- Main
-- File description:
-- FreeKOSOVO
--}

module Main (main) where --def of main

-- import other modules
import System.Environment (getArgs)
import System.Exit (exitWith, ExitCode (ExitFailure))

-- import local modules
import Conf (defaultConf, getOpts)
import ErrorHandling (errorHandling)
import Wolfram (wolfram)

main :: IO ()
main = getArgs >>= arguments
  where arguments x       | null x = exitWith (ExitFailure 84)
        arguments (x:xs)  | not (errorHandling (x:xs)) =
                              exitWith (ExitFailure 84)
        arguments (x:xs)  = case getOpts defaultConf (x:xs) of
                              Just conf -> wolfram conf
                              Nothing -> exitWith (ExitFailure 84)
        arguments _       = exitWith (ExitFailure 84)
