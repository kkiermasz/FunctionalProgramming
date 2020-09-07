ps :: [a] -> [[a]]
ps ls = foldl (\acc elem ->
                acc ++ [take elem ls] ) [] [1..length ls] ++
        foldl (\acc elem ->
                acc ++ [drop elem ls]) [] [1..(length ls - 1)]