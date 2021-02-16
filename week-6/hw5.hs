import Data.Maybe

-- Q(1)
data BinT t = Empty | Node t (BinT t) (BinT t) deriving (Show, Read, Eq)

-- Run these scripts in GHCI Mode:
-- let a = Node 3 Empty Empty
-- let b = Node 2 Empty Empty
-- let c = (Node 1) b a
--
-- In the end, we have a binary tree.
--    1
--   / \
--  2   3 

-- (a)
mapT :: (t -> t) -> BinT t -> BinT t
mapT _ Empty = Empty
mapT f (Node val Empty Empty) = Node (f val) Empty Empty
mapT f (Node val left Empty) = Node (f val) (mapT f left) Empty
mapT f (Node val Empty right) = Node (f val) Empty (mapT f right)
mapT f (Node val left right) = Node (f val) (mapT f left) (mapT f right)
-- Run these scripts in GHCI Mode:
-- mapT (+1) (Node 1.0 (Node 2.0 Empty Empty) (Node 3.0 Empty Empty))
-- mapT (*2) (Node 1.0 (Node 2.0 Empty Empty) Empty)

-- (b)
foldrT :: (Num t) => (t -> j -> j) -> j -> BinT t -> j
foldrT f x Empty = x
foldrT f x (Node val Empty Empty) = f val (foldrT f x Empty)
foldrT f x (Node val left Empty) = f val (foldrT f x left)
foldrT f x (Node val Empty right) = f val (foldrT f x right)
foldrT f x (Node val left right) = f val (foldrT f (foldrT f x left) right)
-- Run these scripts in GHCI Mode:
-- foldrT (+) 0 (Node 1.0 (Node 2.0 Empty Empty) (Node 3.0 Empty Empty))


-- Q(2)
data ExprT
    = Leaf Double
    | Add ExprT ExprT
    | Sub ExprT ExprT
    | Mul ExprT ExprT
    | Div ExprT ExprT deriving (Show, Read, Eq)


-- Q(3) + Q(4)
evaluateExprT :: ExprT -> Maybe Double
evaluateExprT (Leaf x) = Just x
evaluateExprT (Add x y) = Just $ (+) (fromJust (evaluateExprT x)) (fromJust (evaluateExprT y))
evaluateExprT (Sub x y) = Just $ (-) (fromJust (evaluateExprT x)) (fromJust (evaluateExprT y))
evaluateExprT (Mul x y) = Just $ (*) (fromJust (evaluateExprT x)) (fromJust (evaluateExprT y))
evaluateExprT (Div x y)
    | (isJust evaluatedY && ((fromJust evaluatedY) /= 0)) = Just $ (/) (fromJust evaluatedX) (fromJust evaluatedY)
    | otherwise = Nothing
    where
        evaluatedX = evaluateExprT x
        evaluatedY = evaluateExprT y
-- Run these scripts in GHCI Mode:
-- evaluateExprT (Add (Leaf 1.0) (Leaf 2.0))
-- evaluateExprT (Div (Leaf 1.0) (Leaf 2.0))
-- evaluateExprT (Div (Leaf 1.0) (Leaf 0.0))


-- Q(5)
wrapper :: (ExprT -> Maybe Double) -> ExprT -> [Char]
wrapper f x
    | (isNothing evaluation) = "Divide-by-zero occured. [ERROR]"
    | otherwise = "Evaluation = " ++ show (fromJust evaluation)
    where
        evaluation = f x
-- Run these scripts in GHCI Mode:
-- wrapper evaluateExprT (Add (Leaf 1.0) (Leaf 2.0))
-- wrapper evaluateExprT (Div (Leaf 1.0) (Leaf 2.0))
-- wrapper evaluateExprT (Div (Leaf 1.0) (Leaf 0.0))


