-- single line comments

{-
multi line comments
-} 

import Data.List
import System.IO

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- Types

-- int  ( -2^63 - 2^63 )
maxInt = maxBound :: Int  -- 9223372036854775807

minInt = minBound :: Int  -- -9223372036854775808
 
-- Integer
-- Float
-- Double  ( decimal up to eleven places 0.xxxxxxxxxxx )
-- Bool
-- Char ( single quotes ' ' )
-- Tuple
-- List  [1,2,3] 

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- arithmetic operands

addEx :: Num a => a -> a -> a
addEx x y = x + y

subEx :: Num a => a -> a -> a
subEx x y = x - y

multEx :: Num a => a -> a -> a
multEx x y = x * y

divEx :: Fractional a => a -> a -> a
divEx x y = x / y

modEx :: Integral a => a -> a -> a
modEx = mod  -- modEx = mod x y

modEx2 :: Integral a => a -> a -> a
modEx2 x y = x `mod` y  -- `mod` here is an 'in-fix' operator

negNumEx :: Num a => a -> a -> a
negNumEx x y = x + (-y)  -- negative numbers require paranthesese to prevent confusion

-- built in math functions
piVal = pi 
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.99
roundVal = round 9.99
ceilingVal = ceiling 9.999
floorVal = floor 9.999

{-
sin, cos, tan, asin, atan, acos, sinh,
tanh, cosh, asinh, atanh, acosh
-}

