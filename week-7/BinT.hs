module BinT ( BinT (Empty,Node) ) where

-- Q(1)
data BinT t = Empty | Node t (BinT t) (BinT t) deriving (Show, Read, Eq)

-- Run these scripts in GHCI Mode:
-- let a = Node 3 Empty Empty
-- let b = Node 2 Empty Empty
-- let c = (Node 1) b a
--
-- In the end, we have a binary tree.
--    1
--   / \
--  2   3 

