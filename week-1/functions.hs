mySum :: Int -> Int -> Int
mySum a b = a + b
--mySum = \a -> \b -> a+b -- Unsweet

divisionI :: Int -> Int -> Float
divisionI = \a -> \b -> (fromIntegral a) / (fromIntegral b)

divisionII :: Floating a => a -> a -> a
divisionII = \x -> \y -> x / y

-- Factorial recursive approach
factorial :: Int -> Int
factorial 1 = 1 -- Base case
factorial x = x * factorial (x - 1)

{-|
*Intuitive thought:
    add'
    add' x
    add' x y
    x + y 
-}
addI :: Int -> Int -> Int
addI = \x -> \y -> x + y

{-|
*Intuitive thought:
    add accepts one argument :: Tuple
    then use two values from tuple to do computation.
-}
addII :: (Int, Int) -> Int
addII (x, y) = x + y

{-|
*For any numeric type 'a', say 'Num',
we accepts a value with type 'a', then return (addIII x) function,
then accepts a value with type 'a', then return (addIII x y) function,
then do the computation.
-}
addIII :: Num a => a -> a -> a
addIII = \x -> \y -> x + y

-- Implementation of length with GENERIC Type.
-- NOTES: Type variables must begin with a lower-case letter
length' :: [a] -> Int -- '[a]' is an array with generic type 'a'
length' xs = sum[1 | x <- xs]

-- Array sum
{-|
*
-}
sumI [] = 0 -- base case
sumI (n:ns) = n + sumI ns

-- Zip implemetation
zipI :: [Int] -> [Int] -> [(Int, Int)]
zipI [] [] = []
zipI as [] = []
zipI [] bs = []
zipI (a:as) (b:bs) = (a, b) : zipI as bs