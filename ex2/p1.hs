f :: [Int] -> Int
f xs = g xs (xs !! 1)

g :: [Int] -> Int -> Int
g (x : xs) max = if max > x then g xs max else g xs x