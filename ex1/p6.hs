s :: Int -> Int -> Int
s 0 0 = 1
s n 0 = 0
s 0 k = 0
s n k  = s (n-1) (k-1) + k*(s (n-1) (k))


sumSeq :: Int -> (Int -> Int) -> Int
sumSeq 1 f = 1
sumSeq n f = f n + sumSeq (n - 1) f

bell :: Int -> Int
bell n = sumSeq n (s n)