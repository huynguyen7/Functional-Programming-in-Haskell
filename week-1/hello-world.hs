main = do
    putStrLn "Hello World!!"
    putStr "INPUT NAME: "
    name <- getLine -- read line string
    putStrLn("Hey " ++ name)