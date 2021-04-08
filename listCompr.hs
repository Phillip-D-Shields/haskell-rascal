-- list comprehensions ================================
-- mathematics comprehension notation is used to construct
-- new sets from old sets

-- {x**2 | X E {1...5}}
-- X represents each element in the set {1...5}
-- X**2 would create a new set {1,4,9,16,25}
-- in haskell the above can be done with list comprehensions
exampleLC :: [Integer]
exampleLC = [x^2 | x <- [1..5]] 
--returns [1,4,9,16,25]
-- x <- [1..5] is called a generator, it states how to generate values for x
-- generators can have multiple generators, separated by commas
exMultiGeneratorLC :: [(Integer, Integer)]
exMultiGeneratorLC = [(x,y) | x <- [1,2,3], y <- [4,5]]
-- returns [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]
exMultiGeneratorLCReverse :: [(Integer, Integer)]
exMultiGeneratorLCReverse = [(x,y) | y <- [4,5], x <- [1,2,3]]
-- returns [(1,4),(2,4),(3,4),(1,5),(2,5),(3,5)]
exMultiGeneratorLC' :: [(Integer, Integer)]
exMultiGeneratorLC' = [(x,y) | x <- [1,2,3], y <- [4,5,6]]
-- returns [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)]

-- multi generators are like nested loops
-- later generators as more deeply nested loops with values change more frequently

-- dependant generators ==================================================
-- later generators can depend on on variables introduced by earlier generators
exDepGenerator :: [(Integer, Integer)]
exDepGenerator = [(x,y) | x <- [1..3], y <- [x..3]]
-- returns [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]

-- use a dependant generator to define a function that concatenates a list of lists
exConcat :: [[a]] -> [a]
exConcat xss = [x | xs <- xss, x <- xs]


-- guards ================================================
-- guards can restrict values produced within earlier generators
exGuardLC :: [Integer]
exGuardLC = [x | x <- [1..10], even x] 
-- even x restricts odd values generated via x <- [1..10]
-- returns [2,4,6,8,10]

-- define a function that maps positive int to list its factors
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]
--  > factors 15 returns [1,3,5,15]

-- pos int is prime if its only factors are 1 and itself
prime :: Int -> Bool 
prime n = factors n == [1,n]

-- using a guard we can define a func that returns all primes up to n
primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]
-- > primes 40 returns [2,3,5,7,11,13,17,19,23,29,31,37]

-- faster version of primes
allPrimes :: [Int]
allPrimes = sieve [2..]

sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

-- takeWhile (<= 1500) allPrimes returns the same as primes 1500, but faster

-- zip function ========================================================
-- zip maps two lists to a list of pairs of corresponding elements
-- zip :: [a] -> [b] -> [(a,b)]
-- zip ['a','b','c'] [1,2,3,4] returns [('a',1),('b',2),('c',3)]

-- use zip to return a list of adjecent elements as pairs in a list
pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)
-- > pairs [1,2,3,4,5] returns [(1,2),(2,3),(3,4),(4,5)]

-- using pairs we can define a function that decides if the elems in a list are sorted
sorted :: Ord a => [a] -> Bool 
sorted xs = and [x <= y | (x,y) <- pairs xs]
-- > sorted [1,2,3,4,5] returns true
-- > sorted [1,2,5,3,4] returns false

-- use zip to define a func that returns the list of all idx of a value in a list
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x',i) <- zip xs [0..], x == x']
-- > positions 0 [1,0,0,1,0,1,1,0] returns [1,2,4,7]

-- string comprehensions ================================================
-- haskell views strings internally as a list of [Char]
-- any polymorphic funcs that operates on lists
-- can be applied to strings
count :: Eq a => a -> [a] -> Int
count x xs = length [x' | x' <- xs, x == x']
-- > count 's' "mississippi" returns 4  (length ["s",s",s",s"])
