horner :: [Double] -> Double -> Double
horner f x0 = foldl (\x y -> x0*x + y) 0 f