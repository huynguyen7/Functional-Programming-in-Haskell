-- Map implementation
addOne :: Int -> Int
addOne x = x + 1

mapI :: (a -> b) -> [a] -> [b]
mapI _ [] = []
mapI f (x:xs) = f x : mapI f xs


-- Filter implementation
isEven :: Int -> Bool
isEven a = (a `mod` 2) == 0

filterI :: (a -> Bool) -> [a] -> [a]
filterI _ [] = []
filterI f (x:xs) = 
    if f x then x : filterI f xs
    else filterI f xs

filterII :: (a -> Bool) -> [a] -> [a]
filterII _ [] = []
filterII f (x:xs) = [x | f x] ++ filterII f xs


-- Fold right implementation
foldrI :: (a -> b -> b) -> b -> [a] -> b
foldrI f z [] = z
foldrI f z (x:xs) = f x (foldrI f z xs)


-- Fold left implementation 
foldlI :: (b -> a -> b) -> b -> [a] -> b
foldlI f z [] = z
foldlI f z (x:xs) = foldlI f (f z x) xs
