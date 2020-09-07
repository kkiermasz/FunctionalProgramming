import Data.Set as Set
divisors :: Int -> [Int]
divisors n = setNub $ divisorsLessOrEqualThanRoot n ++ (Prelude.map (\x -> if n `div` x /= x then n `div` x else x) (divisorsLessOrEqualThanRoot n))
    where 
        root n =  ceiling $ sqrt $ fromIntegral n
        divisorsLessOrEqualThanRoot n = [x | x<-[1..(root n)], n `mod` x == 0]
        setNub xs = Set.toList $ Set.fromList xs 