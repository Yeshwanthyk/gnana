{-- The Breadcrumb tutorial you can get to at
    http://acm3.wustl.edu/functional/hs-breads.php
--}

main = do
    putStrLn "Hello world"

-- List comprehensions

naturals        = [x | x <- [1..]]
perfect_squares = [x*x | x <- naturals]
multiples_of_3  = [x | x <- naturals, x `mod` 3 == 0]
all_pairs       = [(x,y) | x <- [1..10], y <- [1..10]]

-- Currying
add a b = a + b
add3 = add 3

multiples_of n = [n, n*2..]
multiples_of_43 = multiples_of 43

-- Lists
lst = 1 : 2 : 3 : 4 : 5
lst' = [1,2,3,4]
lst'' = 1 : [2,3,4]

foo = [1,2] ++ [3,4]
foo' = [1,2,3] ++ [4]

inf_ones = 1: inf_ones
inf_ones' = [1,1..]
inf_ones'' = 1 ++ [inf_ones]

first lst = head lst
rest lst = tail lst

nth_index n lst = lst !! n
last lst = lst !! (length lst)

10_elems lst = take 10 lst
11_and_beyond lst = drop 10 lst

-- Composition

import Data.List (sort)

min_n n = (take n) . sort

descending_sort lst = (reverse . sort) lst

-- Function Application Operator
-- To use add and divide as a regular function
add = (+)
divide = (/)

foo = add 2 (divide 3 4)
foo = add 2 $ divide 3 4 -- $ is used to save space instead
                         -- of using paranthesis


-- Pattern Matching
-- Pattern is matched in the order they are listed in

fact 0 = 1
fact n = n * fact(n-1)

len [] = 0
len lst = 1 + len(tail lst)

len' [] = 0
len' [x:xs] = 1 + len' xs -- [x:xs] is a common idiom

foo "hello" = "asdf"
foo "world" = "Baloons"
foo _ = "CHUNKY BACON" -- _ here means match everything.

-- At Patterns

foo allxs@(x:xs) = "All xs are:" ++ (show allxs) ++ "\n"
                   ++ "The first x is:" ++ (show x) ++ "\n"
                   ++ "rest xs are:" ++ (show xs)

-- Guards
-- Very similar to pattern Matching
foo n | n < 0 = "negative"
      | n == 0 = "zero"
      | otherwise "positive"

-- Case
foo n = case signum n of
        (-1) -> "negative"
        0 -> "zero"
        1 -> "positive"

-- Where
max_list lst = head rslst where
    rslst = reverse slst
    slst = sort lst

-- Tuples
min_max_list lst = (head slst, head rslist) where
    rslst = reverse slst
    slst = sort lst

magnitude (x,y) = sqrt(x^2 + y^2)

pythagorean_triples = [(a,b,c) | c <- [1..]
                                 b <- [1..c]
                                 a <- [1..b]
                                 a ^ 2 + b ^ 2 = c ^ 2]