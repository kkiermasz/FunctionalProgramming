data Complex = Complex Integer Integer

instance Show Complex
    where show (Complex a b) = (show a) ++ "+" ++ (show b) ++ "*i"

instance Num Complex where
    Complex a1 b1 + Complex a2 b2 = Complex (a1 + a2) (b1 + b2)
    Complex a1 b1 - Complex a2 b2 = Complex (a1 - a2) (b1 - b2)
    Complex a1 b1 * Complex a2 b2 = Complex (a1 * a2 - b1 * b2) (a1 * b2 - b1 * a2)
    fromInteger a = Complex a 1
    signum (Complex a b) = Complex 0 0
    abs (Complex a b) = Complex (abs a) (abs b)
