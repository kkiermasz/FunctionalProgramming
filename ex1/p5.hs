f :: (Int,Int) -> Int
f (0,0) = 1
f (n,0) = 0
f (0,k) = 0
f (n,k) = f(n-1,k-1)+k*f(n-1,k)