{--
-- EPITECH PROJECT, 2023
-- Wolfram
-- File description:
-- FreeKOSOVO
--}

module Wolfram (wolfram) where

import Lib
import Conf (Conf(..))
import System.Exit (exitWith, ExitCode (ExitFailure))

-- Cette fonction trouve le caractère à afficher en fonction de la règle et des
--    trois caractères du haut (en haut à gauche, en haut et en haut à droite).
-- Elle prend en paramètre la règle, les trois caractères.
-- Elle prend en charge toutes les règles possibles grâce au bit à 1
--    que l'on récupère en divisant la règle par 2^i (i allant de 0 à 7)
--    et en regardant si le reste est égal à 1.
-- Si le bit est à 1, on affiche un *, sinon on affiche un espace.
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

-- Cette fonction applique la fonction numberingSystem sur chaque triplet de
--    caractères de la chaîne de caractères passée en paramètre et renvoie
--    une nouvelle chaîne de caractères avec les resultats
-- Elle prend en paramètre la chaîne de caractères et la règle.
applicateRule :: String -> Int -> String
applicateRule (x:y:z:xs) r = numberingSystem r x y z : applicateRule (y:z:xs) r
applicateRule (x:y:[]) r = numberingSystem r x y ' ' : applicateRule [y] r
applicateRule (x:[]) r = numberingSystem r x ' ' ' ' : applicateRule [] r
applicateRule [] _ = []

-- Cette fonction affiche le wolfram en fonction de la configuration.
-- Elle prend en paramètre la configuration, l'indice de la ligne et la chaîne
--    de caractères à afficher.
wolfram :: Conf -> Int -> String -> IO ()
wolfram (Conf r _ _ _ _) _ _ | r < 0 || r > 255 = exitWith (ExitFailure 84)
wolfram (Conf _ _ 0 _ _) _ _ = return ()
wolfram (Conf r 0 l w m) i str = printLine str i >>
   wolfram (Conf r 0 (l - 1) w m) (i + 1)
      (init (applicateRule ("  " ++ str ++ " ") r))
wolfram (Conf r s l w m) i str =
   wolfram (Conf r (s - 1) l w m) (i + 1)
      (init (applicateRule ("  " ++ str ++ " ") r))
