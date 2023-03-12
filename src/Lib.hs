{--
-- EPITECH PROJECT, 2023
-- Lib
-- File description:
-- FreeKOSOVO
--}

module Lib (makeFirstLine, printLine) where
import Conf (Conf(..))

makeFirstLine :: Conf -> [Char]
makeFirstLine (Conf _ _ _ win mov)  | 
    (win `mod` 2) == 0 =    replicate (win `div` 2 + mov) ' ' ++ ['*'] ++
                            replicate (win `div` 2 - (1 - mov)) ' '
                                    |
    otherwise =             replicate (win `div` 2 + mov) ' ' ++ ['*'] ++
                            replicate (win `div` 2 - mov) ' '

deleteIFirstChar :: String -> Int -> String
deleteIFirstChar str i = drop i str

deleteILastChar :: String -> Int -> String
deleteILastChar str i = take (length str - i) str

deleteILastAndFirstChar :: String -> Int -> String
deleteILastAndFirstChar str i = deleteIFirstChar (deleteILastChar str i) i

printLine :: String -> Int -> IO ()
printLine str i = putStrLn (deleteILastAndFirstChar str i)
