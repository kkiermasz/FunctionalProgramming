repl :: Eq a => [a] -> [(a,a)] -> [a]
repl ls prs = foldl (\acc elem -> (map (\x -> (if (x == fst elem) then snd elem else x) ) acc)) ls prs