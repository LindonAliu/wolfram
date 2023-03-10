--
-- EPITECH PROJECT, 2023
-- errorHandling
-- File description:
-- FreeKOSOVO
--

module ErrorHandling (errorHandling) where
import Data.Char (isDigit)

errorHandling :: [String] -> Bool
errorHandling [] = True
errorHandling (x:xs)  | x == "--rule" = errorHandling xs
                      | x == "--start" = errorHandling xs
                      | x == "--lines" = errorHandling xs
                      | x == "--window" = errorHandling xs
                      | x == "--move" = errorHandling xs
                      | not (all isDigit x) = False
                      | otherwise = errorHandling xs
