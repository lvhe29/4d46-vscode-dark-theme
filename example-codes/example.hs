


-- 这是一段 haskell 代码
import           Data.List (sortBy)

-- 数据点类型
type DataPoint = ([Double], String)

euclideanDistance :: [Double] -> [Double] -> Double
euclideanDistance a b = sqrt $ sum [(x - y) ** 2 | (x, y) <- zip a b]

kNearestNeighbors :: Int -> DataPoint -> [DataPoint] -> [DataPoint]
kNearestNeighbors k p dataset = take k sortedDistances
    where
        distances = [(euclideanDistance (fst x) (fst p), x) | x <- dataset, x /= p]
        sortedDistances = map snd $ sortBy (\(a,_) (b,_) -> compare a b) distances

countByClass :: [DataPoint] -> [(String, Int)]
countByClass datapoints =
    [(c, length $ filter (\(_, label) -> label == c) datapoints) | c <- allClasses]
    where
        allClasses = map snd datapoints

predictKNN :: Int -> DataPoint -> [DataPoint] -> String
predictKNN k p dataset = fst $ head $ sortBy (\(_,a) (_,b) -> compare b a) classCounts
    where
        neighbors = kNearestNeighbors k p dataset
        classCounts = countByClass neighbors

-- 测试数据集
testData :: [DataPoint]
testData = [([1, 5], "a"), ([5, 1], "b"), ([4, 2], "b"), ([2, 4], "a"), ([2, 2], "a")]

predictedClass = predictKNN 3 ([3, 3], "") testData





