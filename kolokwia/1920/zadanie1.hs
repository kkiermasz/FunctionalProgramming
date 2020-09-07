isNumberSevenable :: Int -> Bool
isNumberSevenable num = if (num >= 10) then
                        ((sumOfDigits num) == 7) || (isNumberSevenable (sumOfDigits num))
                    else 
                        (num == 7)
                    where
                        sumOfDigits x = sum (digits x)
                        digits 0 = []
                        digits y = [mod y 10] ++ digits (div y 10) 

sevens :: Int -> [Int]
sevens n = numbers [] 1
        where
            numbers ls x = if ((length ls) < n) then 
                                if (isNumberSevenable x) then
                                    numbers (ls ++ [x]) (x + 1)
                                else
                                    numbers ls (x + 1)
                            else
                                ls