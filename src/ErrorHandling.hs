{--
-- EPITECH PROJECT, 2023
-- errorHandling
-- File description:
-- FreeKOSOVO
--}

module ErrorHandling (errorHandling) where
import Data.Char (isDigit)

errorHandling :: [String] -> Bool
errorHandling [] = True
errorHandling ("--rule":x:xs)   | not (all isDigit x) = False
                                | otherwise = errorHandling xs
errorHandling ("--start":x:xs)  | not (all isDigit x) = False
                                | otherwise = errorHandling xs
errorHandling ("--lines":x:xs)  | not (all isDigit x) = False
                                | otherwise = errorHandling xs
errorHandling ("--window":x:xs) | not (all isDigit x) = False
                                | otherwise = errorHandling xs
errorHandling ("--move":x:xs)   | not (all isDigit x) = False
                                | otherwise = errorHandling xs
errorHandling _ = False
