int2Bin :: Int -> [Int]
int2Bin 0 = [0] 
int2Bin 1 = [1]
int2Bin x = int2Bin (x `div` 2) ++ [x `mod` 2]

bin2Int :: [Int] -> Int
bin2Int [0] = 0
bin2Int [1] = 1
bin2Int (x:xs) = (length xs) * 2 * x + bin2Int xs