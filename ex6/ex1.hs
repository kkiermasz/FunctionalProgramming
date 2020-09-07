remove :: (Eq a)=>a->[a]->[a]
remove e xs = filter (\x -> e /= x) xs

qsort :: (Ord a)=>[a]->[a]
qsort [] = []
qsort (x:xs) = (left $ xs) ++ [x] ++ (right $ xs)
    where 
        left l = qsort $ filter (\n -> x <= n) l
        right l = qsort $ filter (\n -> x < n) l
