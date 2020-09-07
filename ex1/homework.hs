divisorsSum :: Int -> Int
divisorsSum 0 = 0
divisorsSum n = divisorsSum1 n n


divisorsSum1 :: Int -> Int -> Int 
divisorsSum1 0 x = 0
divisorsSum1 x 0 = 0
divisorsSum1 n m = (if isDivisor n m then m else 0) + divisorsSum1 n (m - 1)
        where isDivisor n m = (n `mod` m == 0)