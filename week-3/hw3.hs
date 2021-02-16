-- Q(1)
flattenI :: [[a]] -> [a]
flattenI [] = []
flattenI (x:xs) = x ++ flattenI xs


-- Q(2)
remdups :: Eq a => [a] -> [a]
remdups [] = [] 
remdups (a:ns)
    | (a `elem` ns) = remdups ns
    | otherwise = a : remdups ns


-- Q(3)
scanSum :: Num a => [a] -> [a]
scanSum [] = []
scanSum (a:[]) = [a]
scanSum (a:b:ns) = a : scanSum ((a + b) : ns)


-- Q(4)
fromTupleNToListNObjects :: (Int, a) -> [a]
fromTupleNToListNObjects t 
    | (fst t) <= 0 = []
    | otherwise = (snd t) : fromTupleNToListNObjects (((fst t) - 1), snd t)

group :: Eq a => [a] -> [[a]]
group [] = []
group (a:ns) = helper 1 a ns
    where
        helper n x [] = [fromTupleNToListNObjects (n, x)]
        helper n x (y:ns)
            | x == y = helper (n+1) y ns
            | otherwise = fromTupleNToListNObjects (n, x) : (helper 1 y ns)


-- Q(5)
findMatchIndex :: Eq a => a -> Int -> [a] -> Int
findMatchIndex x i [] = (-1)
findMatchIndex x i (y:ys)
    | x == y = i
    | otherwise = findMatchIndex x (i+1) ys

removeAtIndex :: Int -> [a] -> [a]
removeAtIndex _ [] = []
removeAtIndex i ns
    | i == (-1) = ns
    | otherwise = (take i ns) ++ (drop (i+1) ns)

listDiff :: Eq a => [a] -> [a] -> [a]
listDiff [] ns = ns
listDiff _ [] = []
listDiff (x:xs) ys = listDiff xs (removeAtIndex index ys)
    where index = findMatchIndex x 0 ys


-- Q(6)
rleEncoder :: Eq a => [a] -> [(Int ,a)]
rleEncoder (x:xs) = helper 1 x xs
    where
        helper n x [] = [(n, x)]
        helper n x (y:ys)
            | (x == y) = helper (n+1) y ys
            | otherwise = (n, x) : helper 1 y ys