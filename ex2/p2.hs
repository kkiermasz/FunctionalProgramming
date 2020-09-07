countPosNeg :: [Int] -> (Int, Int)
countPosNeg [x] = if x < 0 then (x, 0) else if x > 0 then (0, x) else (0,0)
countPosNeg (x : xs) = if x < 0 then (fst (countPosNeg xs) + x, snd(countPosNeg xs)) else if x > 0 then (fst (countPosNeg xs), snd(countPosNeg xs) + x) else countPosNeg xs