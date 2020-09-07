rd :: Int -> [Int]
rd n = [k | k <- [1..(n^2)], sum (dzielniki k) == (n + k)]

dzielniki :: Integral a => a -> [a]
dzielniki k = [x | x <- [1..k], mod k x == 0]