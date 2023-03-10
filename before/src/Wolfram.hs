{--
-- EPITECH PROJECT, 2023
-- Wolfram
-- File description:
-- FreeKOSOVO
--}

module Wolfram (wolfram) where

import Conf (Conf(..))

makeFirstLine :: Int -> [Char]
makeFirstLine n = take n (cycle " ") ++ "*" ++ take n (cycle " ")

wolfram :: Conf -> IO ()
wolfram conf = putStrLn (makeFirstLine (window conf `div` 2 - 1))
