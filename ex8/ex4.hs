f list x = flip map x list
        where g x list = map (\y->y/x) list
f1 = flip g
        where g x = map (\y->y/x)  
f2 = flip g
        where g x = map (\y->(/) y x)
f3 = flip g
        where g = map.(flip(/))

