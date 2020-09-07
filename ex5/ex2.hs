solve :: Int -> [(Int, Int, Int)]
solve n = [(x,y,z) | x<-[1,3..n],y<-[1,3..n],z<-[1,3..n], x * x + 2 * y * y == z * z * z]