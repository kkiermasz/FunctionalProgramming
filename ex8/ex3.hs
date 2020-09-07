f x list = map (\y->y*x) list
f1 x = map (\y->y*x) 
f2 x = map (\y->(*) y x)
f3 = map.(*)