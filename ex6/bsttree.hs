data BST a = Empty | Node a (BST a) (BST a) deriving Show


insertElement :: (Ord a)=>a->(BST a)->(BST a)

makeTree :: (Ord a) => [a] -> BST a

