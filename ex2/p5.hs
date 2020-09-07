merge :: [Int] -> [Int] -> [Int]
merge x [] = x
merge [] y = y
merge (x:xs) (y:yt) = if x < y then [x] ++ merge xs ([y] ++ yt) else [y] ++ merge ([x] ++ xs) yt

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort [y] = [y]
mergeSort [x, y] = if x < y then [x, y] else [y, x]
mergeSort x y = 