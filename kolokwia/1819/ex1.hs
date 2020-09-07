funA :: Int -> Int
funA 0 = 1
funA n = ((n - 1) * funB (n - 1)) - (3 * funA (n - 1))
funB :: Int -> Int
funB 0 = 1
funB n = (3 * funB (n - 1) + (n - 1)) * ((n - 1) * funA (n - 1)) - ((n - 1) * (n - 1))
numbers :: [Int] -> [Int]
numbers ls = [funA (length ls)] ++ ls
seqIndex :: Int -> Int
seqIndex m = length (last ( takeWhile seriesSumCheck (iterate numbers []))) - 1
            where seriesSumCheck list = (sum list) <= m