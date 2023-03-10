{--
-- EPITECH PROJECT, 2023
-- Rules
-- File description:
-- FreeKOSOVO
--}

module Rules (rule30, rule90, rule110) where

rule30 :: Int -> Int -> Int -> Int
rule30 1 1 1 = 0
rule30 1 1 0 = 0
rule30 1 0 1 = 0
rule30 1 0 0 = 1
rule30 0 1 1 = 1
rule30 0 1 0 = 1
rule30 0 0 1 = 1
rule30 0 0 0 = 0

rule90 :: Int -> Int -> Int -> Int
rule90 1 1 1 = 0
rule90 1 1 0 = 1
rule90 1 0 1 = 1
rule90 1 0 0 = 0
rule90 0 1 1 = 1
rule90 0 1 0 = 0
rule90 0 0 1 = 0
rule90 0 0 0 = 0

rule110 :: Int -> Int -> Int -> Int
rule110 1 1 1 = 0
rule110 1 1 0 = 1
rule110 1 0 1 = 1
rule110 1 0 0 = 1
rule110 0 1 1 = 1
rule110 0 1 0 = 1
rule110 0 0 1 = 1
rule110 0 0 0 = 0
