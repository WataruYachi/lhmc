
parseInt :: Char -> Int
parseInt x
    | isInt x = read [x]
    | otherwise = 0

isInt x = x `elem` "1234567890"

parseADD :: Char -> (Int -> Int -> Int)
parseADD x
    | x == '+' = (+)
    | otherwise = \_ _-> 0

parseExpr (a:b:c:xs) = parseADD b (parseInt a) (parseInt c)
