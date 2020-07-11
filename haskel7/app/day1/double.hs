module Day1 where

double :: Integer -> Integer
double x = x + x

factorial :: Integer -> Integer
factorial x
  | x > 1 = x * factorial (x - 1)
  | otherwise = 1