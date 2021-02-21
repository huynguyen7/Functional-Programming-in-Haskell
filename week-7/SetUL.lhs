> module SetUL (Set, null, member, empty, fromList, toList, insert, delete) where

> import Prelude hiding (null)


> newtype Set a = Set [a] deriving (Show, Eq)

Set functions

> null :: Set a -> Bool
> null (Set []) = True
> null (Set (x:[])) = False
> null (Set (x:xs)) = False

> member :: Eq a => a -> Set a -> Bool
> member x (Set []) = False
> member x (Set (y:ys))
>   | x == y = True
>   | otherwise = member x $ Set ys

> empty :: Set a
> empty = Set []

> ele :: Eq a => Int -> a -> [a] -> Bool
> ele _ _ [] = False
> ele (-1) _ _ = False
> ele n x (y:ys)
>   | x == y = True
>   | otherwise = ele (n-1) x ys
 
> removeDups :: Eq a => [a] -> [a]
> removeDups [] = []
> removeDups xs = helper 0 xs []
>     where
>         helper _ [] [] = []
>         helper _ [] seen = seen
>         helper n (x:xs) seen 
>             | (ele n x seen) = helper (n + 1) xs seen
>             | otherwise = helper (n + 1) xs $ x:seen

> fromList :: Eq a => [a] -> Set a
> fromList [] = empty
> fromList xs = Set $ removeDups xs

> toList :: Eq a => Set a -> [a]
> toList (Set xs) = xs

> insert :: Eq a => a -> Set a -> Set a
> insert x (Set ys)
>   | (member x (Set ys)) = Set ys
>   | otherwise = Set $ x:ys

> findMatchIndex :: Eq a => a -> Int -> [a] -> Int
> findMatchIndex x i [] = (-1)
> findMatchIndex x i (y:ys)
>   | x == y = i
>   | otherwise = findMatchIndex x (i+1) ys
> 
> removeAtIndex :: Eq a => Int -> [a] -> [a]
> removeAtIndex _ [] = []
> removeAtIndex i ns
>   | i == (-1) = ns
>   | otherwise = (take i ns) ++ (drop (i+1) ns)

> delete :: Eq a => a -> Set a -> Set a
> delete _ (Set []) = empty
> delete x (Set ys) = Set $ removeAtIndex (findMatchIndex x 0 ys) ys

FILL IN Instance Declarations for Eq and Show

instance Ord a => Eq (Set a) where
  (Set as) == (Set bs) =  **** write equality test ****

instance (Show a, Ord a) => Show (Set a) where
  show (Set as) =  "fromList " ++ show (remDupSort as)
