member :: Eq a => Int -> a -> [a] -> Bool
member _ _ [] = False
member (-1) _ _ = False
member n x (y:ys)
    | x == y = True
    | otherwise = member (n-1) x ys

removeDups :: Eq a => [a] -> [a]
removeDups [] = []
removeDups xs = helper 0 xs []
    where
        helper _ [] [] = []
        helper _ [] seen = seen
        helper n (x:xs) seen 
            | (member n x seen) = helper (n + 1) xs seen
            | otherwise = helper (n + 1) xs $ x:seen
