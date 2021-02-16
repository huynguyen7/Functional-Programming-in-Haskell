import Data.Fixed

double x = x + x
doubleII = \x -> x + x -- Unsweet version
quad x = double (double x)
quadII = \x -> double (double x) -- Unsweet version
sumTwoNum x y = x + y
sumTwoNumII = \x -> \y -> (+) x y -- Unsweet version

isLessThanOneHundred x = if x < 100
                        then True
                        else False

isEvenNumber x = if check == 0 
                 then True
                 else False
                 where check = x `mod` 2

-- Put 'let' in front when declares variables in GHCI mode.
myNums = [1,2,3,4,5,6]

-- Note: '|' Pipe symbol -> Used to piping logic.
arrayFromOneToNTimesTwo = \n -> [x*2 | x <- [1..n]]

foobarI xs = [if x < 10 then "FOO" else "BAR" | x <- xs]
-- Add predicate 'isEvenNumber x'
foobarII xs = [if x < 10 then "FOO" else "BAR" | x <- xs, isEvenNumber x]

-- Vector scalar multiplication
-- zip works similar to Python zip(list1, list2)
vmult v1s v2s = [x * y | (x, y) <- zip v1s v2s]

-- Implement length
length' xs = sum[1 | x <- xs]

-- remove lower case in string
removeLowerCase s = [c | c <- s, c `elem` ['A'..'Z']]

-- remove number from string
removeNumber s = [c | c <- s, c `notElem` ['1'..'9']]