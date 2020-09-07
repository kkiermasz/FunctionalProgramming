data Sdb a = Node a
        | Node1 a (Sdb a)
        | Node2 a (Sdb a) (Sdb a)

el :: (Eq a) => Sdb a -> a -> Bool
el (Node x) y = x == y
el (Node1 x subNode) y = x == y || el subNode y
el (Node2 x subNode1 subNode2) y = x == y || el subNode1 y || el subNode2 y

eq :: (Eq a) => Sdb a -> Sdb a -> Bool
eq (Node x) (Node y) = x == y
eq (Node1 x1 subNode1) (Node1 x2 subNode2) = x1 == x2 && eq subNode1 subNode2
eq (Node2 x1 subNode11 subNode12) (Node2 x2 subNode21 subNode22) = x1 == x2 && (eq subNode11 subNode21 || eq subNode12 subNode22 || eq subNode11 subNode22)
eq _ _ = False

