-- Q(1)
lastI :: [a] -> Maybe a
lastI [] = Nothing
lastI ns = Just (reverse ns !! 0)

lastII :: [a] -> Maybe a
lastII [] = Nothing
lastII (n:[]) = Just n
lastII (_:ns) = lastII ns

-- Q(2)
initI :: [a] -> Maybe [a]
initI [] = Nothing
initI ns = Just (reverse (drop 1 (reverse ns)))

-- Q(3)
firstLast :: [a] -> Maybe (Maybe a, Maybe a)
firstLast [] = Nothing
firstLast (a:[]) = Nothing
firstLast ns = Just (Just (ns !! 0), lastI ns)

-- Q(4)
-- No recursion
rangeProductI :: Int -> Int -> Int
rangeProductI a b = if b < a
                    then 0
                    else 1

-- Q(5) <- Q(4) + Recursive Factorial
rangeProductII :: Int -> Int -> Int
rangeProductII a b
            | (b < a) = 0
            | (b == a) = a
            | otherwise = a * (rangeProductII (a + 1) b)

-- Q(6)
powerI :: Int -> Int -> Int
powerI x y = product (take y (repeat x))

-- Recursive approach for Q(6)
powerII :: Integer -> Integer -> Integer
powerII x 0 = 1
powerII 0 y = 0
powerII x y = x * (powerII x (y - 1))
