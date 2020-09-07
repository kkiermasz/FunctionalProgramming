divisors :: Int -> [Int]
divisors n = [x | x<-[1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = filter isPerfect (divisors n)    
    where isPerfect x = (2 * x == sum (divisors x))
