-- bp :: Int -> [String]


wordsWithLength :: Int -> [String]
wordsWithLength n = foldl (\acc ind -> acc ++ [(replace (head acc) ind)]) [aStringWithLength n] [0..n]
                where
                    replace str 0 = "b" ++ drop 1 str
                    replace str i = take i str ++ "b" ++ drop (i + 1) str

aStringWithLength :: Int -> String
aStringWithLength x = foldl (\acc ind -> acc ++ "a") "a" [1..x]