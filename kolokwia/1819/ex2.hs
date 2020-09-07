data Expr a = Value a
                | Add (Expr a) (Expr a)
                | Mul (Expr a) (Expr a)
                | Sub (Expr a) (Expr a) 
                | P

eq :: (Eq a)=> Expr a -> Expr a -> Bool
eq _ P = True
eq P _ = True
eq x y = x == y