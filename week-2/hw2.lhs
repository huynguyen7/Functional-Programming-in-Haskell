3 :: Num p => p
even :: Integral a => a -> Bool
even 3 :: Bool

\begin{code}

import Data.Char



getNumber :: Float -> Float
getNumber _ = 1.0
runMeI :: (Float -> Float) -> Float
runMeI df = df 1

sumI :: Float -> (Float -> Float)
sumI = \a -> \b -> a + b

f1 :: Float -> Float
f1 _ = 1.0
f2 :: Float -> Float
f2 _ = 1.0
runMeII :: (Float -> Float) -> (Float -> Float)
runMeII _ = f2


ncopies :: Int -> a -> [a]
ncopies x y = take x (repeat y)

ncopiesWithRecursion :: Int -> a -> [a]
ncopiesWithRecursion x y
    | x <= 0 = []
    | otherwise = y : (ncopies (x - 1) y)


diffs :: Num a => [a] -> [a]
diffs [] = []
diffs [a] = [] 
diffs (a:b:ns) = (b - a) : (diffs (b:ns))


groupByN :: Int -> [a] -> [[a]]
groupByN 0 ns = []
groupByN _ [] = []
groupByN n ns = take n ns : (groupByN n (drop n ns))


data Fx = Fx { m :: Double
               ,
               b :: Double}

calcX :: Fx -> Double -> Double
calcX f y = (y - (b f)) / (m f)

testFx :: Fx
testFx = Fx 2 3 


stringToNum :: [Char] -> Int
stringToNum [] = 0
stringToNum (x:xs) = (((ord x) - 48) * (10 ^ p)) + stringToNum xs
                    where p = length xs

\end{code}