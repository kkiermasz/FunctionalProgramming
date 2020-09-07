thueMorse :: Int -> String
thueMorse n = last $ takeWhile checkLength (iterate nextString "a")
    where
        checkLength list = (length list <= n)
nextString :: String -> String
nextString "" = "a"
nextString s = concatMap (\x -> h x) s


h :: Char -> String
h 'a' = "ab"
h 'b' = "ba"