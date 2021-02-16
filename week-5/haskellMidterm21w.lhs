------------------------------------------------------------------------------
Haskell Midterm . Closed book and notes, no computers for 2hrs.
------------------------------------------------------------------------------

1. (10)
  (a) The following whatFun1 function is equivalent to what Prelude function?

> map f as = [f a | a <- as]


  (b) The following whatFun2 function is equivalent to what Prelude function?

> filter p as = [ a | a <- as, p a]


2. (15)
  (a) What is the type of the following lp function? Give the most general
      type and include any required class constraints.

> lp xs = \ys -> [(x,y) | x <- xs, y <- ys, x < y ]
    lp :: Ord b => [b] -> [b] -> [(b, b)]

    This function returns a list of tuples correspond to (b, b) as input x,y type b.

  (b) Give a simple description of what the lp function in part (a) does.
      Describe what it does, not how it works.
    
    This function returns a list of tuples with all elements of x and y with a predicate x < y as condition.

  (c) Give a non-trivial test case of the function lp and show the expected
      results.

    For example:
    lp [1,2] [3,4] -> [(1,3),(1,4),(2,3),(2,4)]

3. (15)
  (a) What is the type of the following djl function? Give the most general
      type and include any required class constraints.

> djl ys = not . any (`elem` ys)

    djl (Eq a) => [a] -> [a] -> Bool
    `elem` function in this phrase using ys (a list) as input, so it should returns a function that accept a value x that have same type of values in ys. After that, `any` function is a higher-order function, it accepts `elem` functions that I just explained above, then returns a function that accepts a Foldable type which have same type as ys, then apply this to not function with composition functions.
    Thus, This function returns a Boolean type.

  (b) Give a simple description of what the djl function in part (a) does.
      Describe what it does, not how it works.

    This functions accepts two Foldable types. In short, I can say there are two lists as inputs. It will check whether two list does not have any same element.

  (c) Give a non-trivial test case of the djl function applied to two
      arguments and show the expected results.

    djl [1,2] [4,5] should returns True.
    djl [1,2] [2,3] should returns False.

4. (15)
  (a) What is the type of the following whatFun3 function? Give the most general
      type and include any required class constraints.

> whatFun3 p = foldr (\x xs -> if p x then x:xs else xs) []

    djl :: (Foldable f, Eq a) => t a -> t a -> Bool
    This function works similar to `filter` function.

  (b) Give a simple description of what the whatFun3 function in part (a) does.
      Describe what it does, not how it works.

    This function accepts a predicate and a list with same type input with the predicate. Then, apply the predicate on each element of the list, if it False, remove it from the list.

  (c) Give a non-trivial test case of the function whatFun3 and show the
      expected results.

    whatFun3 even [1,2,3,4,5] -> [2,4]

5. (15)
  (a) What is the type of the following mps function? Give the most general
      type and include any required class constraints. The ($) is the
      low-precedence application operator. 

> mps m n = take m (map ($n) . map (*) $ [1..])
> mps' m n = take m (map (\f -> f n) . map (*) $ [1..])
    
    mps :: (Num a, Double b) => a -> b -> [a]
    This function accepts two Number as inputs. 

(The 2 definitions above are identical. Use the second if you are uncomfortable
with $n).
Note:
*Main> ($5)(*)2 <-- prefix notation
10
*Main> (*)2$5   <-- infix notation
10
*Main> (\f -> f 5) (*2)  <-- prefix notation
10
*Main>


  (b) Give a description of what the mps function in part (a) does.
      Describe what it does, not how it works.

    This list will contains m elements. and the elements will be the multiplication results to the nth list [1..]

  (c) Give a non-trivial test case for the mps function in part (a) and show
      the expected results.

    For example:
    mps 4 2 -> [2,4,6,8]


6. (15)
  (a) What is the type of the following isl function? Give the most general
      type and include any required class constraints.

> isl xs = all (\(x,y) -> (x<=y)) (zip xs (tail xs))

    isl :: Ord a => [a] -> Bool
    This function will accepts a list of Ord values then return a Bool value.

  (b) Give a description of what the isl function in part (a) does.
      Describe what it does, not how it works.

    This function will check if the list is sorted in non-decreasing order.

  (c) Give a non-trivial test case for the isl function in part (a) and show
      the expected results.
    
    For example:
        isl [1,2,3] -> True
        isl [3,2,3] -> False
        isl [3,3,3] -> True

7. (15)
  (a) What is the type of the following whatFun4 function? Give the most general
      type and include any required class constraints. The function length
      returns type Int.

> whatFun4 [] = []
> whatFun4 (x:xs) = (length $ x : takeWhile (==x) xs, x)
>                  : whatFun4 (dropWhile (==x) xs)

    whatFun4 :: [a] -> [(Int,a)]

  (b) Give a description of what the whatFun4 function in part (a) does.
      Describe what it does, not how it works.

    This function will returns a list of tuples.
    Each tuple has value (Int n, x). With x is the value of the list. n is the number of
    occurences that x appears sequently.

  (c) Give a non-trivial test case for the whatFun4 function in part (a) and
      show the expected results.
    
    For example:
        whatFun4 "Hellolo" -> [(1,'H'),(1,'e'),(2,'l'),(1,'o'),(1,'l'),(1,'o')]
