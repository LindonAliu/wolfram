--
-- EPITECH PROJECT, 2023
-- Rules
-- File description:
-- FreeKOSOVO
--

module Rules (rule30, rule90, rule110) where

rule30 :: Int -> Int -> Int -> Int
rule30 a b c | a == 1 && b == 1 && c == 1 = 0
             | a == 1 && b == 1 && c == 0 = 0
             | a == 1 && b == 0 && c == 1 = 0
             | a == 1 && b == 0 && c == 0 = 1
             | a == 0 && b == 1 && c == 1 = 1
             | a == 0 && b == 1 && c == 0 = 1
             | a == 0 && b == 0 && c == 1 = 1
             | a == 0 && b == 0 && c == 0 = 0

rule90 :: Int -> Int -> Int -> Int
rule90 a b c | a == 1 && b == 1 && c == 1 = 0
             | a == 1 && b == 1 && c == 0 = 1
             | a == 1 && b == 0 && c == 1 = 1
             | a == 1 && b == 0 && c == 0 = 0
             | a == 0 && b == 1 && c == 1 = 1
             | a == 0 && b == 1 && c == 0 = 0
             | a == 0 && b == 0 && c == 1 = 0
             | a == 0 && b == 0 && c == 0 = 0

rule110 :: Int -> Int -> Int -> Int
rule110 a b c | a == 1 && b == 1 && c == 1 = 0
              | a == 1 && b == 1 && c == 0 = 1
              | a == 1 && b == 0 && c == 1 = 0
              | a == 1 && b == 0 && c == 0 = 1
              | a == 0 && b == 1 && c == 1 = 1
              | a == 0 && b == 1 && c == 0 = 1
              | a == 0 && b == 0 && c == 1 = 1
              | a == 0 && b == 0 && c == 0 = 0
