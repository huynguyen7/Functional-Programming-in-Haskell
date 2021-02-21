import Data.List (nub, sort)
import Geometry.Sphere
import Geometry.Cube
import BinT
--import SetUL as Set (Set,null,member,empty,fromList,toList,insert,delete)
import SetOL as Set (Set,null,member,empty,fromList,toList,insert,delete)



numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub  -- nub removes all the dups in the list, then apply to function composition with length function.
-- In GHCI Mode:
-- Try to run:
-- numUniques [4,2,1,2,2,1,3]
