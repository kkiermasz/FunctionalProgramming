perm :: Int -> [[Int]]
perm 1 = [[1]]
perm n = applyForEach (perm $ n - 1) (length (perm $ n - 1) - 1)
permutationsWithAdditionOfLenghtAt :: [[Int]] -> Int -> [[Int]]
permutationsWithAdditionOfLenghtAt list 0 = (((length $ head list) + 1) : head list) : tail list
permutationsWithAdditionOfLenghtAt list position = [insertElementAt ((length $ head list) + 1) position (head list) ] ++ permutationsWithAdditionOfLenghtAt list (position - 1)
insertElementAt :: a -> Int -> [a] -> [a]
insertElementAt newElement 0 as = newElement:as
insertElementAt newElement i (a:as) = a : insertElementAt newElement (i - 1) as
applyForEach :: [[Int]] -> Int -> [[Int]]
applyForEach l 0 = permutationsWithAdditionOfLenghtAt [(head l)] (length (head l))
applyForEach l n = permutationsWithAdditionOfLenghtAt [(l !! n)] (length (l !! n)) ++ applyForEach l (n-1)