{--
-- EPITECH PROJECT, 2023
-- Conf
-- File description:
-- FreeKOSOVO
--}

module Conf (Conf(..), defaultConf, getOpts) where

data Conf = Conf    {
                        rule :: Int,
                        start :: Int,
                        line :: Int,
                        window :: Int,
                        move :: Int
                    } deriving (Show)

defaultConf :: Conf
defaultConf = Conf  {
                        rule = -1,
                        start = 0,
                        line = -1,
                        window = 80,
                        move = 0
                    }

getOpts :: Conf -> [String] -> Maybe Conf
getOpts conf []                 = Just conf
getOpts conf ("--rule":xs)      = getOpts (conf {
                                    rule = (read (head xs) :: Int) }) (tail xs)
getOpts conf ("--start":xs)     = getOpts (conf {
                                    start = read (head xs) :: Int }) (tail xs)
getOpts conf ("--lines":xs)     = getOpts (conf {
                                    line = (read (head xs) :: Int) }) (tail xs)
getOpts conf ("--window":xs)    = getOpts (conf {
                                    window = read (head xs) :: Int }) (tail xs)
getOpts conf ("--move":xs)      = getOpts (conf {
                                    move = (read (head xs) :: Int) }) (tail xs)
getOpts _ _                     = Nothing
