package Calculators;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Calculator class providing basic arithmetic operations
 */
public class Calculator {
    private static final Logger logger = LoggerFactory.getLogger(Calculator.class);
    
    /**
     * Adds two numbers
     * 
     * @param x first number
     * @param y second number
     * @return sum of x and y
     */
    public double sum(double x, double y) {
        double result = x + y;
        logger.debug("Sum of {} and {} is {}", x, y, result);
        return result;
    }

    /**
     * Subtracts second number from first number
     * 
     * @param x first number
     * @param y second number to subtract
     * @return difference of x and y
     */
    public double subtract(double x, double y) {
        double result = x - y;
        logger.debug("Subtraction of {} from {} is {}", y, x, result);
        return result;
    }

    /**
     * Multiplies two numbers
     * 
     * @param x first number
     * @param y second number
     * @return product of x and y
     */
    public double multiply(double x, double y) {
        double result = x * y;
        logger.debug("Multiplication of {} and {} is {}", x, y, result);
        return result;
    }

    /**
     * Divides first number by second number
     * 
     * @param x dividend
     * @param y divisor
     * @return quotient of x divided by y
     * @throws ArithmeticException if divisor is zero
     */
    public double divide(double x, double y) throws ArithmeticException {
        if (y != 0) {
            double result = x / y;
            logger.debug("Division of {} by {} is {}", x, y, result);
            return result;
        } else {
            logger.error("Attempted to divide {} by zero", x);
            throw new ArithmeticException("Cannot divide by zero");
        }
    }
}
