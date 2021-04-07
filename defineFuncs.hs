-- conditional expressions

abs :: Int -> Int
abs n = if n >= 0 then n else - n

-- guarded equation version
abs' :: Int -> Int
abs' n
  | n >= 0 = n
  | otherwise = - n

-- conditional expressions must always have an 'else' branch

-- nested conditionals
signum :: Int -> Int
signum n = if n < 0 then -1
                else if n == 0 then 0 else 1

-- guarded equation version
signum' :: Int -> Int
signum' n
  | n < 0 = -1
  | n == 0 = 0
  | otherwise = 1  -- otherwise is a catch all condition otherwise = true

-- guarded equations allow for much easier reading

-- functions can often be defined in many different ways using pattern matching
-- (&&) :: Bool -> Bool -> Bool 
-- True && True = True   -- compactly: True && True = True
-- True && False = False -- compactly: _ && _ = False
-- False && True = False -- underscore is a wildcard character
-- False && False = False 

-- a more effecient solution would be 
(&&) :: Bool -> Bool -> Bool 
True && b = b
False && _ = False

-- patterns are matched in order: left to right, top to bottom
-- patterns may not repeat variables
-- b && b = b --gives an error because of the repeating b var

-- list patterns ============================================
-- internally, every non-empty list is constructed by repeated use of
-- constructor operator ('cons' :), which adds an element to the start of a list
-- [1,2,3,4] = 1:(2:(3:(4:[])))


-- functions on lists can be defined using the x:xs pattern
head :: [a] -> a
head (x:_) = x -- x equals the first el in a list

tail :: [a] -> [a]
tail (_:xs) = xs -- xs equals the els in a list after the first el

-- x:xs patterns only match non-empty lists
-- x:xs patterns must use parantheses because function application priority over (:)
-- head x:_ = x  will return an error
-- head (x:_) = x wont return an error

-- lambda expressions ========================================
-- functions constructed without names use lambda expressions
-- (\x -> x + x) 6   here '\' represents lambda 

-- lambda expressions can give formal meaning to curried funcs
-- add :: Int -> Int -> Int
-- add x y = x + y
-- with lambda expression
-- add :: Int -> (Int -> Int)
-- add x = \y -> x + y
-- add = \x -> (\y -> x + y)

-- lamba expressions can be used to avoid repeat naming of single use funcs
odds :: (Num b, Enum b) => b -> [b]
odds n = map f [0..n-1]
            where
                f x = x*2 + 1
-- odds can be simplified to:
odds' :: (Num b, Enum b) => b -> [b]
odds' n = map (\x -> x*2 + 1) [0..n-1]

-- operator sections ================================================
-- an operator between its two args can be converted to a curried func
-- by writing it before its args and within parantheses
-- 1+2  can be written as (+) 1 2
-- (1+) 4 // 5
-- (1+) successor function
-- (1/) reciprocation function
-- (*2) doubling function
-- (/2) halving function

safetail :: [a] -> [a]
safetail xs
  | null xs = []
  | otherwise = tail xs

safetail' :: [a] -> [a]
safetail' [] = [] 
safetail' (_:xs) = xs 

-- false table
-- False || False = False
-- _ || _ = True
-- false || b = b
-- true || _ = true