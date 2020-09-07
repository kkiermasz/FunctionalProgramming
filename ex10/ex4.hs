-- displayList :: [Integer] -> IO () 
-- displayList [] = return ()
-- displayList (x:xs) = do 
--                         putStrLn (show(x * x))
--                         displayList (xs)


-- main = do 
--     putStrLn "Podaj liczbe: "
--     str<-getLine
--     displayList [1..(read(str))]
   

readAndDisplay :: String -> IO()
readAndDisplay s = do
    if s == "." then putStrLn s
                 else 
                    do 
                        line <- getLine
                        readAndDisplay line
                        return ()



main = do
    str <- getLine
    readAndDisplay str 
