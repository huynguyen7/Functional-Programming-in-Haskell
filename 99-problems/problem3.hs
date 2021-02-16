-- Return k'th element in a list.
elementAtK :: [a] -> Int -> Maybe a
elementAtK [] _ = Nothing
elementAtK (n:_) 1 = Just n
elementAtK (n:ns) k
    | (k <= 0) = Nothing
    | otherwise = elementAtK ns (k - 1)
element _ _ = error "Index out of bounds."