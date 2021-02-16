-- Find the number of elements in a list.
lengthI :: [a] -> Int
lengthI [] = 0
lengthI (n:ns) = 1 + lengthI ns