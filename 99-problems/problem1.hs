-- Get last element of the list [a]
lastI :: [a] -> Maybe a
lastI [] = Nothing
lastI (x:[]) = Just x
lastI (x:xs) = lastI xs