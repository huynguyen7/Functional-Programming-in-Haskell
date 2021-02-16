type String' = [Char]
funcA :: String'
funcA = "Hello"


--
data Answer = Yes | No | Unknown deriving (Show)
answers :: [Answer]
answers = [Yes,No,Unknown]

flip' :: Answer -> Answer
flip' Yes = No
flip' No = Yes
flip' Unknown = Unknown


--
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)
-- Run Circle (Point 1.1 1.3) 1.4

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r  
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))


--
area :: Shape -> Float
area (Circle (Point x y) r) = pi * r^2

--
-- data Person = Person String String Int Float deriving (Show)
-- firstName :: Person -> String
-- firstName (Person firstName _ _ _ ) = firstName
-- 
-- lastName :: Person -> String
-- lastName (Person _ lastName _ _) = lastName
-- 
-- age :: Person -> Int
-- age (Person _ _ age _) = age
-- 
-- height :: Person -> Float
-- height (Person _ _ _ height) = height
data Person = Person { firstName :: String,
                lastName :: String,
                age :: Int,
                height :: Float
            } deriving (Eq, Show, Read)


--
data DayOfTheWeek = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Enum, Bounded)
