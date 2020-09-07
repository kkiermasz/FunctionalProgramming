dlugosc :: String -> Int
dlugosc s = fst(until (all (=='a') snd) ( foldl (\acc elem -> ((fst acc) + 1), snd acc) (0, s) [1..length s] ))

transform :: String -> String
transform "ab" = "a"
transform "ba" = "b"
transform "bb" = "a"
transform "aa" = "aaa"
transform _ = ""