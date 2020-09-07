sumList :: (Num a)=> [a] -> a
sumList (x:xs) = foldl (+) x xs
sumList [] = 0

maxElement :: [Int] -> Int
maxElement (x:xs) = foldl (max) x xs
maxElement [] = 0