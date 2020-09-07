wiekszeod :: [Int] -> Int -> [Int]
-- wiekszeod l a = [x <- l | x > a]
wiekszeod l a = filter (\x -> x > a) l
wiekszeod1 l a = flip g l a
    where g y = filter (\x -> x > y)
wiekszeod2 l a = flip g l a
    where g = filter.(flip(>))