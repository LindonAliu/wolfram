{--
-- EPITECH PROJECT, 2023
-- test
-- File description:
-- FreeKOSOVO
--}

module Main (main) where --def of main

-- import other modules
import System.Environment (getArgs)
import System.Exit (exitWith, ExitCode (ExitFailure))

-- import local modules
import Conf (Conf(..), defaultConf, getOpts)
import ErrorHandling (errorHandling)
import Rules (rule30, rule90, rule110)
import Wolfram (wolfram)

main :: IO ()
main = getArgs >>= arguments
  where arguments x       | null x = exitWith (ExitFailure 84)
        arguments (x:xs)  | not (errorHandling (x:xs)) =
                              exitWith (ExitFailure 84)
        arguments (x:xs)  = case getOpts defaultConf (x:xs) of
                              Just conf -> wolfram conf
                              Nothing -> exitWith (ExitFailure 84)
