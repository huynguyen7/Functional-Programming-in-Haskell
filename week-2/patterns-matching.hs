-- Naive implementation of first
firstI :: (a, b, c) -> a
firstI = \(x, y, z) -> x

-- Use '_' means we don't really care what that part is..
firstII :: (a, b, c) -> a
firstII = \(x, _, _) -> x