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