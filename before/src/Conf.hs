{--
-- EPITECH PROJECT, 2023
-- Conf
-- File description:
-- FreeKOSOVO
--}

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
getOpts conf ("--rule":xs) = getOpts (conf {
                             rule = Just (read (head xs) :: Int) }) (tail xs)
getOpts conf ("--start":xs) = getOpts (conf {
                              start = read (head xs) :: Int }) (tail xs)
getOpts conf ("--lines":xs) = getOpts (conf {
                              line = Just (read (head xs) :: Int) }) (tail xs)
getOpts conf ("--window":xs) = getOpts (conf {
                               window = read (head xs) :: Int }) (tail xs)
getOpts conf ("--move":xs) = getOpts (conf {
                             move = Just (read (head xs) :: Int) }) (tail xs)
getOpts _ _ = Nothing
