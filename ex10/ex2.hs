displayList :: [Integer] -> IO () 
displayList [] = return ()
displayList (x:xs) = do 
                        putStrLn (show(x * x))
                        displayList (xs)

main = do 
    putStrLn "Podaj liczbe: "
    str<-getLine
    displayList [1..(read(str))]
   
