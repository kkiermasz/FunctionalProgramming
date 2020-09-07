data Rd a = Rodo a [Rd a]
            | RodoEmpty a

el :: Eq a => Rd a -> a -> Bool
el (RodoEmpty a) x = a == x 
el (Rodo n ls) x = x == n || not (all (==False) (map (\rd -> el rd x) ls))

subst :: Eq a => a -> a -> Rd a -> Rd a
subst e1 e2 (RodoEmpty a) = if a == e1 then RodoEmpty e2 else RodoEmpty a
subst e1 e2 (Rodo a rds) = if a == e1 then Rodo e2 (mappedRds rds) else Rodo a (mappedRds rds)
                            where mappedRds rdsToMap = map (\x -> subst e1 e2 x) rdsToMap

