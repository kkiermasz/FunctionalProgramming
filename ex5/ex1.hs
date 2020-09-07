allSeq :: Int -> [[Int]]
allSeq 0 = [[]]
allSeq n = addZero ++ addOne 
           where
                addZero = map (\x -> 0:x) prevSequences
                addOne  = map (\x -> 1:x) prevSequences
                prevSequences = allSeq (n-1)