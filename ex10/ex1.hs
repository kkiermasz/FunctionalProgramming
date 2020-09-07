number :: Int -> Int
number 1 = 1
number n = (n * n) + (number (n - 1))

main = do 
         putStrLn "Podaj liczbe: "
         str<-getLine
         putStrLn (show( number (read(str)::Int) ))
	
