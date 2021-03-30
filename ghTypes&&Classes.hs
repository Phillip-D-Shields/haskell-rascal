-- types ======================================

-- input :: output / expression :: type
-- type check  > :type not False (not False :: Bool)
-- > :type 32 (32 :: Num p => p)

-- basic types: Bool, Char, String, Int, Float

-- lists : sequence of values of SAME type [brackets]

-- tuples : sequence of values of different types (parantheses)

-- functions : a mapping of values of one type to values of another type

-- curried funcs ========================================================
-- curried functions : functions with multiple args can return functions as results
add' :: Int -> (Int -> Int)
add' x y = x+y

-- functions that take their args one at a time are considered curried
mult :: Int -> (Int -> (Int -> Int))
mult x y z = x*y*z 
-- mult takes x and returns a func 'mult x', then takes y and returns 'mult x y', 
-- and finally takes z and returns x*y*z (calcs are performed at the end)

-- curried funcs are more flexible, useful funcs are often made by partially  
-- applying a curried func

-- type declarations associate to the right
-- Int -> Int -> Int -> Int 
-- Int -> (Int -> (Int -> Int))

-- functions associate to the left
-- mult x y z 
-- ((mult x) y) z

-- polymorphic funcs ================================================
-- a polymorphic func contains one or more type variables
-- length :: [a] -> Int
-- accepts a list of values of type a and returns an Int
-- > length [False , True]  // 2
-- > length [1,2,3,4] // 4
-- most standard prelude funcs are polymorphic

-- overloaded funcs ==================================================
-- a polymorphic func is overloaded if its type contains one or more
-- class constraints
-- (+) :: Num a => a -> a -> a // add two type a's and return same type
-- (==) :: Eq a => a -> a -> Bool // compare two type a's and return bool
-- (<) :: Ord a => a -> a -> Bool // compare two ordered type a's and return bool

-- type classes =======================================================
-- Num => numeric type
-- Eq => equality type
-- Ord => ordered type


-- examples ===========================================================
second :: [a] -> a
second xs = head (tail xs)

swap :: (b, a) -> (a, b)
swap (x,y) = (y,x)

pair :: a -> b -> (a, b)
pair x y = (x,y)

double :: Num a => a -> a  -- Num is declared because: X*2 
double x = x*2

palindrome :: Eq a => [a] -> Bool  -- Eq is declared because: xs == xs
palindrome xs = reverse xs == xs

twice :: (t -> t) -> t -> t
twice f x = f (f x)