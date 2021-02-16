-- Chap 2 Test codes.

double x = x + x
factorial n = product[1..n]
average ns = sum ns `div` length ns
sumTwoNum a b = a + b
division a b = a `div` b

absolute x
    | x < 0     = -x
    | otherwise = x

a = 10
b = 20

x = y + z
    where
        y = 1
        z = 2

d = x * 2

-- Q(2)
n = a `div` length xs where
    a = 10
    xs = [1,2,3,4,5]

-- Q(3) Get last element of list ns
lastElement ns = ns !! (length ns - 1)

-- Q(4) Another approach for Q(3)
lastElementII ns = (reverse ns) !! 0

-- Q(5) Two alternatives for Prelude.init
initI ns = take (length ns - 1)
initII ns = reverse (drop 1 (reverse ns))