-- Naive implementation ~ O(2^n) time complexity.
fibI :: Integer -> Integer -- Accept an integer as argument then return an Integer.
fibI 0 = 0 -- Base case f(0) = 0
fibI 1 = 1 -- Base case f(1) = 1
fibI n = fibI(n - 1) + fibI(n - 2)