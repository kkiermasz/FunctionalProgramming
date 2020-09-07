data Mb a = List [a] [a]

dnp :: Mb a -> a -> Mb a
dnp (List l r) el = List (el : l) r

dnk :: Mb a -> a -> Mb a
dnk (List l r) el = List l (r ++ [el])

mb2list :: Mb a -> [a]
mb2list (List l r) = l ++ r

ull :: Mb a -> Mb a
ull (List l r) = List [] r

upl :: Mb a -> Mb a
upl (List l r) = List l []