insertElement :: (Ord a)=>a->[a]->[a]
insertElement element [] = [element]
insertElement element list = (takeWhile (<=element) list)++[element]++(dropWhile (<=element) list)

insertElement' element [] =[element]
insertElement' element (x:rest) = if (x<=element) then x:(insertElement element rest) else element:x:rest

inSort :: (Ord a)=>[a] -> [a]
inSort list = foldr (\acc x -> insertElement' acc x) [] list