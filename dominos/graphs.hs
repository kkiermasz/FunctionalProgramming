-- import Data.List
 
type Node      = Int
type Edge      = (Char, (Int, Int))
type Graph     = [Edge]
type Path      = String
type Candidate = (Path, Node, [Edge])
 
graph :: Graph
graph = [('a', (1,2)),
         ('b', (2,3)),
         ('c', (1,3)),
         ('d', (3,4)),
         ('e', (3,4)),
         ('f', (1,4))]
 
nodes :: [Node]
nodes = [1..4]
 
findPaths :: Graph -> [Node] -> [Path]
findPaths g ns = findPaths' g ns []
 
findPaths' :: Graph -> [Node] -> [Path] -> [Path]
findPaths' _ []     acc = acc
findPaths' g (n:ns) acc = findPaths' g ns acc' 
    where acc' = findPath g n ++ acc
   
findPath :: Graph -> Node -> [Path]
findPath g node = findPath' [("", node, g)] []
 
findPath' :: [Candidate] -> [Path] -> [Path]
findPath' []                    acc = acc
findPath' ((path, _, []):xs)    acc = findPath' xs (path:acc)
findPath' ((path, node, es):xs) acc
    | null nextEdges = findPath' xs acc  
    | otherwise      = findPath' (xs' ++ xs) acc
    where nextEdges  = filter (\(_,(a, b)) -> a == node || b == node) es
          xs'        = nextPaths (path, node, es) nextEdges []
 
nextPaths :: Candidate -> [Edge] -> [Candidate] -> [Candidate]
nextPaths _                []     acc = acc
nextPaths (path, node, es) (x:xs) acc = nextPaths (path, node, es) xs acc'
    where acc'  = (path', node', delete x es ) : acc
          path' = path ++ [label]
          node' = if node == a then b else a
          (label, (a, b)) = x

-- TO REMOVE. FROM DATA.LIST

deleteBy                :: (a -> a -> Bool) -> a -> [a] -> [a]
deleteBy _  _ []        = []
deleteBy eq x (y:ys)    = if x `eq` y then ys else y : deleteBy eq x ys

delete                  :: (Eq a) => a -> [a] -> [a]
delete                  =  deleteBy (==)

