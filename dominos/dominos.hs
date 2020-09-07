import System.IO;
import System.Environment;

-- READING INPUT

readLines :: Handle -> IO ()
readLines handle = do
    contents <- hGetContents handle
    let singlewords = words contents
        graph = convertList (f singlewords)
        rows = findRows graph
    print rows

f :: [String] -> [Integer]
f = map read

convertList :: [Integer] -> [(Integer, Integer)]
convertList [] = []
convertList (k:v:t) = (k, v) : convertList t

-- FINDING ROWS

findRows :: [(Integer, Integer)] -> [[(Integer, Integer)]]
findRows g = findRows' g [1..6] []
 
findRows' :: [(Integer, Integer)] -> [Integer] -> [[(Integer, Integer)]] -> [[(Integer, Integer)]]
findRows' _ [] ls = ls
findRows' g (n:ns) previous = findRows' g ns newRows 
    where newRows = findRowsForNode g n ++ previous

findRowsForNode :: [(Integer, Integer)] -> Integer -> [[(Integer, Integer)]]
findRowsForNode g node = findRowsForNode' [([], node, g)] []
 
findRowsForNode' :: [([(Integer, Integer)], Integer, [(Integer, Integer)])] -> [[(Integer, Integer)]] -> [[(Integer, Integer)]]
findRowsForNode' [] ls = ls
findRowsForNode' ((path, _, []):xs) current = findRowsForNode' xs (path:current)
findRowsForNode' ((path, node, edges):xs) previous
    | length newEdges == 0 = findRowsForNode' xs previous 
    | otherwise = findRowsForNode' (xs' ++ xs) previous
    where xs' = nextPaths (path, node, edges) newEdges []
          newEdges = filter (\ (a, b) -> node == a || node == b ) edges

nextPaths :: ([(Integer, Integer)], Integer, [(Integer, Integer)]) -> [(Integer, Integer)] -> [([(Integer, Integer)], Integer, [(Integer, Integer)])] -> [([(Integer, Integer)], Integer, [(Integer, Integer)])]
nextPaths _ [] ls = ls
nextPaths (path, node, edges) (x:xs) previousPaths = nextPaths (path, node, edges) xs newPaths
    where newPaths  = (path', node', remove x edges) : previousPaths
          path' = addToPath path x
          node' = nextNode node x

nextNode :: Integer -> (Integer, Integer) -> Integer
nextNode n (a,b) = if n == a then b else a

addToPath :: [(Integer, Integer)] -> (Integer, Integer) -> [(Integer, Integer)]
addToPath [] x = [x]
addToPath [(a,b)] (c,d)
    | a == c = [(b,a), (c,d)]
    | b == c = [(a,b), (c,d)]
    | a == d = [(b,a), (d,c)]
    | otherwise = [(a,b), (d,c)]
addToPath ls x = init ls ++ pathTail (last ls) x

pathTail :: (Integer, Integer) -> (Integer, Integer) -> [(Integer, Integer)]
pathTail (a,b) (c,d)
    | b == c = [(a,b), (c,d)]
    | otherwise = [(a,b), (d,c)]

main = do
    (firstArg:_) <-getArgs
    fileHandle <-openFile firstArg ReadMode
    readLines fileHandle
    hClose fileHandle




-- FROM DATA.LIST

deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a]
deleteBy _  _ [] = []
deleteBy eq x (y:ys) = if x `eq` y then ys else y : deleteBy eq x ys

remove :: (Eq a) => a -> [a] -> [a]
remove = deleteBy (==)

