data BT a=Empty | Node a (BT a) (BT a) 

isEmpty :: (BT a) -> Bool

size :: (BT a)->Integer

height :: (BT a)->Integer
