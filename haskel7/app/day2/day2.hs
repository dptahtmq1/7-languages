module Day2 where
import Data.List

mySort list = sort list

mySort2 ordering list = sortBy ordering list
--mySort2 (\a b -> if (a<b) then LT else GT) [1,5,6,3,2]

toDouble :: [Char] -> Double
toDouble (h:t) = read t :: Double
--toDouble "$2345678.99"

rangeThird start = start:(rangeThird (start + 3))

rangeFifth start = start:(rangeFifth (start + 5))

rangeEighth x y = zipWith (+) (rangeThird x) (rangeFifth y)
--take 5 (rangeEighth 3 3)

divide2 x = x / 2

appendNewLine str = str ++ "\n"
