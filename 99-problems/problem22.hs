-- Create a list containing all integers within a given range.
-- Similar to python range(a, b)
range :: Int -> Int -> [Int]
range a b
    | (a > b) = []
    | otherwise = a:(range (a + 1) b)