--
-- EPITECH PROJECT, 2023
-- Conf
-- File description:
-- FreeKOSOVO
--

module Conf (Conf(..), defaultConf, getOpts) where

data Conf = Conf { rule :: Maybe Int,
                   start :: Int,
                   line :: Maybe Int,
                   window :: Int,
                   move :: Maybe Int
                 } deriving (Show)

defaultConf :: Conf
defaultConf = Conf { rule = Nothing,
                     start = 0,
                     line = Nothing,
                     window = 80,
                     move = Nothing }

getOpts :: Conf -> [String] -> Maybe Conf
getOpts conf [] = Just conf
getOpts conf (x:xs) | x == "--rule" = getOpts (conf { rule = Just (read (head xs) :: Int) }) (tail xs)
                    | x == "--start" = getOpts (conf { start = read (head xs) :: Int }) (tail xs)
                    | x == "--lines" = getOpts (conf { line = Just (read (head xs) :: Int) }) (tail xs)
                    | x == "--window" = getOpts (conf { window = read (head xs) :: Int }) (tail xs)
                    | x == "--move" = getOpts (conf { move = Just (read (head xs) :: Int) }) (tail xs)
                    | otherwise = Nothing