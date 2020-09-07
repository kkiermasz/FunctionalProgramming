import System.IO;

indexOf' :: (Char, Int) -> Int -> [(Char, Int)] -> Int
indexOf' x 0 ls = -1
indexOf' x n [] = -1
indexOf' x n ls = if fst(x) == fst((last ls)) then n - 1 else indexOf' x (n - 1) (init ls)

indexOf :: (Char, Int) -> [(Char, Int)] -> Int
indexOf x ls = indexOf' x (length ls) ls

removeAt :: Int -> [a] -> [a]
removeAt i ls = take (i) ls ++ drop (i+1) ls

dodaj_do_rozkladu :: Char -> [(Char, Int)] -> [(Char, Int)]
dodaj_do_rozkladu c ls = if indexOf (c,0) ls == -1
                            then
                                ls ++ [(c,1)]
                            else
                                [(c, (snd(ls !! indexOf (c,0) ls) + 1))] ++ ls
                                

-- Zaczalem pisac powyzej funkcje tworzaca rozklad. Niestety braklo czasu. Programik wyswietli poki co tylko wczytane linie

readAndDisplay :: String -> IO()
readAndDisplay str =
    if str == "."
        then
            return ()
        else
            do
                putStrLn (show(str))
                newLine <- getLine
                readAndDisplay newLine

main = do
    str <- getLine
    readAndDisplay str
