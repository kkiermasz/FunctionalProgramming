pownum :: Integer -> [Integer]
pownum n = [x | x <- [1..], isPowOfDigits x]
        where
            isPowOfDigits num = (sum (poweredDigits num)) == num
            poweredDigits num = map (\x -> x ^ n) (digits num)
            digits 0 = []
            digits num = [mod num 10] ++ digits (div num 10)