-- Reverse a list.
reverseI :: [a] -> [a]
reverseI [] = []
reverseI (n:ns) = reverseI ns ++ [n]