import Data.Char
import Data.List

-- Dummy functions, just for testing..
dummyFunction :: a -> a
dummyFunction a = a


-- Q(1)

-- head . tail [1,2] does not work because  head.tail will not apply first
-- since tail will be applied first, and then it will return a list instead of a function for (.) operator to apply on

-- (head. tail) [1,2] will works because now we applied the parentheses around 'head . tail'. so this operation will be applied first, then it will return a function to accept a list and return a value equivalent to the list type.

-- head . tail $ [1,2] will works because the dollar sign ($) works similarly to apply parentheses. This helps the left phrase 'head . tail' will run separately first and then apply to the list on the right side of the dollar sign.

-- head.tail $ [1,2] works the same with the above explanation, just because they don't have spaces when running the statement.


-- Q(2)

composeListI :: [a -> a] -> (a -> a)
composeListI (f:[]) = f
composeListI (f:fs) = (composeListI fs) . f


-- Q(3)
composeListII :: [a -> a] -> (a -> a)
composeListII fs = foldl (.) dummyFunction $ reverse fs


-- Q(4)
stringToNumI :: [Char] -> Int
stringToNumI [] = 0
stringToNumI (x:xs) = ((((ord x - 48) *) $ 10 ^ p) +) $ stringToNumI xs
                    where p = length xs

-- Q(5)
stringToNumII :: [Char] -> Int
stringToNumII [] = 0
stringToNumII (x:xs) = (((-) . ord) x 48) * ((10^) . length) xs + stringToNumII xs


-- Q(6)
getNumDigits :: Int -> Int
getNumDigits n = ((+1) . floor . logBase 10 . fromIntegral) n

getRest :: Int -> Int -> Int
getRest x 1 = 0
getRest x i 
    | rest == 0 = -1
    | otherwise = rest
    where
         rest = x `mod` (10 ^ (i-1))

getDigit :: Int -> Int -> Char
getDigit n i = (intToDigit . div n) (10 ^ (i-1))

stackZero :: Int -> [Char]
stackZero 0 = []
stackZero i = '0' : (stackZero . (i-)) 1

numToStringI :: Int -> [Char]
numToStringI 0 = ['0']
numToStringI n = helper n $ getNumDigits n
    where
        helper :: Int -> Int -> [Char]
        helper _ 0 = []
        helper 0 _ = ['0']
        helper (-1) i = stackZero i
        helper n i = getDigit n i : helper (getRest n i) (i-1)


-- Q(7)
iterI :: (a -> a) -> a -> Int -> a
iterI f x n
    | n <= 0 = x
    | otherwise = iterI f (f x) (n-1)


-- Q(8)
bin2intI :: [Char] -> Int
bin2intI xs = helper xs $ length xs - 1
    where
        helper :: [Char] -> Int -> Int
        helper _ (-1) = 0
        helper [] _ = 0
        helper (x:xs) i = (((((*) . digitToInt) x) . (2^)) i) + (helper xs (i-1))


-- Q(9)
int2binI :: Int -> [Char]
int2binI 0 = ['0']
int2binI n = (reverse . helper) n
    where
        helper :: Int -> [Char]
        helper 0 = []
        helper n = (intToDigit . (mod n)) 2 : helper (n `quot` 2)


-- Q(10)
-- curry
curryTupleThree :: ((a, b, c) -> d) -> (a -> b -> c -> d)
curryTupleThree f = \x y z -> f (x, y, z)

-- uncurry
uncurryTupleThree :: (a -> b -> c -> d) -> ((a, b, c) -> d)
uncurryTupleThree f = \(a, b, c) -> f a b c


-- Q(11)
-- Try to run iterII (\x -> 2 * x) 2 5 in ghci mode.
iterII :: (a -> a) -> a -> Int -> [a]
iterII f x n = take n $ unfoldr (\x -> Just (x, f x)) x


-- Q(12)
digitsToIntList :: [Char] -> [Int]
digitsToIntList [] = []
digitsToIntList (x:xs) = digitToInt x : digitsToIntList xs

bin2inII :: [Char] -> Int
bin2inII xs = foldl (\x y -> y + 2 * x) 0 $ digitsToIntList xs


-- Q(13)
int2binII :: Int -> [Char]
int2binII 0 = ['0']
int2binII n = reverse $ unfoldr (\n -> if n == 0 then Nothing else Just ((intToDigit . (mod n)) 2, n `quot` 2)) n


-- Q(14)
curryList :: ([a] -> b) -> (a-> [a] -> b)
curryList f = \x -> \xs -> f $ x:xs

