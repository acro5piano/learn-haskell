import Debug.Trace

bswap [x] = [x]
bswap (x:xs)
    | x > y = y:x:ys
    | otherwise = x:y:ys
    where
        (y:ys) = bswap xs

bsort [] = []
bsort xs = y : bsort ys
    where
        (y:ys) = bswap xs

main = do
    print $ bswap [5, 3, 1, 7, 2, 6]
    print $ bsort [5, 3, 1, 7, 2, 6]

    -- first
    -- [5, 3, 1, 7, 2, 6] 5 3
    -- [3, 5, 1, 7, 2, 6] 5 1
    -- [3, 1, 5, 7, 2, 6]
    -- [3, 1, 5, 2, 7, 6] 7 2
    -- [3, 1, 5, 2, 6, 7] 7 6

    -- second
    -- [1, 3, 5, 2, 6, 7] 3 1
    -- [1, 3, 5, 2, 6, 7]
    -- [1, 3, 2, 5, 6, 7] 5 2
    -- [1, 3, 2, 5, 6, 7]

    -- third
    -- [1, 3, 2, 5, 6, 7]
    -- [1, 2, 3, 5, 6, 7] 3 2
    -- [1, 2, 3, 5, 6, 7]
