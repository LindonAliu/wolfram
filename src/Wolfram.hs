{--
-- EPITECH PROJECT, 2023
-- Wolfram
-- File description:
-- FreeKOSOVO
--}

module Wolfram (wolfram) where

import Lib
import Conf (Conf(..))

numberingSystem :: Int -> Char -> Char -> Char -> Char
numberingSystem r '*' '*' '*' | ((r `div` 128) `mod` 2) == 1 = '*'
numberingSystem r '*' '*' ' ' | ((r `div` 64) `mod` 2) == 1 = '*'
numberingSystem r '*' ' ' '*' | ((r `div` 32) `mod` 2) == 1 = '*'
numberingSystem r '*' ' ' ' ' | ((r `div` 16) `mod` 2) == 1 = '*'
numberingSystem r ' ' '*' '*' | ((r `div` 8) `mod` 2) == 1 = '*'
numberingSystem r ' ' '*' ' ' | ((r `div` 4) `mod` 2) == 1 = '*'
numberingSystem r ' ' ' ' '*' | ((r `div` 2) `mod` 2) == 1 = '*'
numberingSystem r ' ' ' ' ' ' | ((r `div` 1) `mod` 2) == 1 = '*'
numberingSystem _ _ _ _ = ' '

applicateRule :: String -> Int -> String
applicateRule (x:y:z:xs) r = numberingSystem r x y z : applicateRule (y:z:xs) r
applicateRule (x:y:[]) r = numberingSystem r x y ' ' : applicateRule [y] r
applicateRule (x:[]) r = numberingSystem r x ' ' ' ' : applicateRule [] r
applicateRule [] _ = []

wolfram :: Conf -> Int -> String -> IO ()
wolfram (Conf _ _ 0 _ _) _ _ = return ()
wolfram (Conf r 0 l w m) i str = printLine str i >>
                                 wolfram (Conf r 0 (l - 1) w m) (i + 1)
                                    (init (applicateRule ("  " ++ str ++ " ") r))
wolfram (Conf r s l w m) i str = wolfram (Conf r (s - 1) l w m) (i + 1)
                                    (init (applicateRule ("  " ++ str ++ " ") r))
