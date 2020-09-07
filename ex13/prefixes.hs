prefixes :: [a] -> [[a]]
prefixes [] = [[]]
prefixes (l:ls) = [] : map (l :) (prefixes ls)