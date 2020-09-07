data Calkowite = Zero | Poprzednik Calkowite | Nastepnik Calkowite deriving Show

toInt :: Calkowite -> Int
toInt Zero = 0
toInt (Poprzednik n) = (toInt n) - 1
toInt (Nastepnik n) = (toInt n) + 1

intToCalkowite :: Int -> Calkowite
intToCalkowite 0 = Zero
intToCalkowite x 
                | x<0 = Poprzednik ( intToCalkowite (x+1) )
                | x>0 = Nastepnik ( intToCalkowite (x-1) )