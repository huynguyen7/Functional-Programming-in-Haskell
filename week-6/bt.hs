data BinT t = Empty | Node t (BinT t) (BinT t) deriving (Show, Read, Eq)
