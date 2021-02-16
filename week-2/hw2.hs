import Data.Char

-- Q(1)
{-|
3 :: Num p => p
even :: Integral a => a -> Bool
even 3 :: Bool
-}


-- Q(2)
-- > runMeI getNumber will return 1.
getNumber :: Float -> Float
getNumber _ = 1.0
runMeI :: (Float -> Float) -> Float
runMeI df = df 1

sumI :: Float -> (Float -> Float)
sumI = \a -> \b -> a + b

-- > runMeII f1 will return Func f2
f1 :: Float -> Float
f1 _ = 1.0
f2 :: Float -> Float
f2 _ = 1.0
runMeII :: (Float -> Float) -> (Float -> Float)
runMeII _ = f2


-- Q(3)
ncopies :: Int -> a -> [a]
ncopies x y = take x (repeat y)

ncopiesWithRecursion :: Int -> a -> [a]
ncopiesWithRecursion x y
    | x <= 0 = []
    | otherwise = y : (ncopies (x - 1) y)


-- Q(4)
diffs :: Num a => [a] -> [a]
diffs [] = [] -- If the list is empty, just return empty list
diffs [a] = [] -- If the list has only 1 element, just return empty list
diffs (a:b:ns) = (b - a) : (diffs (b:ns))


-- Q(5)
groupByN :: Int -> [a] -> [[a]]
groupByN 0 ns = []
groupByN _ [] = []
groupByN n ns = take n ns : (groupByN n (drop n ns))


-- Q(6)
-- f(x) = mx + b -> We need 2 numbers to store m,b
data Fx = Fx { m :: Double
               ,
               b :: Double}

calcX :: Fx -> Double -> Double
calcX f y = (y - (b f)) / (m f)

testFx :: Fx
testFx = Fx 2 3 -- f(x) = 2*x + 3
-- Try to run calc X testFx 0 -> 0 = 2 * x + 3


-- Q(7)
stringToNum :: [Char] -> Int
stringToNum [] = 0
stringToNum (x:xs) = (((ord x) - 48) * (10 ^ p)) + stringToNum xs
                    where p = length xs