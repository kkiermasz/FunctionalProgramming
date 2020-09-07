commonPrefix :: String -> String -> String
commonPrefix x y = d (c x y)


c :: String -> String -> (String, String)
c x y = if length x < length y then (x, y) else (y, x)


d :: String -> String -> String
d (x:xs) (y:yt) = if x==y then ([x] ++ commonPrefix xs yt) else []
d x [] = []