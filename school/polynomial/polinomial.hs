import Numeric.Polynomial
import Data.Vector

polynomial = fromList [1, 2, 3]

main = do
    print polynomial
    print $ evaluatePolynomial 10 polynomial
    print $ evaluateOddPolynomial 10 polynomial
    print $ evaluateEvenPolynomial 10 polynomial
