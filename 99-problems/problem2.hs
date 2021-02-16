myButLast :: [a] -> (Maybe a)
myButLast [] = Nothing
myButLast (a:[]) = Just a
myButLast as = Just (reverse as !! 1)