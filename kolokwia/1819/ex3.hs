cykl :: [a] -> [[a]]
cykl [] = []
cykl xs = foldl (\acc element 
                    -> if ( length(acc) < 1) then 
                        acc ++ [xs] 
                    else acc ++ 
                        ( [drop element (head acc) 
                            ++ take element (head acc)])) [] [0..(length(xs) - 1)]
            