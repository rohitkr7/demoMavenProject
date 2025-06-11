package DevOpsDemo.Calculators;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import Calculators.Calculator;

/**
 * Test class for Calculator operations
 */
public class CalculatorTestIT {
    private Calculator calculator;
    
    @BeforeMethod
    public void setup() {
        calculator = new Calculator();
    }
    
    /**
     * Test for sum operation
     */
    @Test
    public void sumTest() {
        // Test with positive numbers
        assertEquals("Sum of positive numbers not working correctly", 30.0, calculator.sum(10, 20), 0.001);
        
        // Test with negative numbers
        assertEquals("Sum of negative numbers not working correctly", -30.0, calculator.sum(-10, -20), 0.001);
        
        // Test with mixed numbers
        assertEquals("Sum of mixed numbers not working correctly", -10.0, calculator.sum(-20, 10), 0.001);
    }

    /**
     * Test for subtract operation
     */
    @Test
    public void subtractTest() {
        // Test with positive numbers
        assertEquals("Subtraction of positive numbers not working correctly", 80.0, calculator.subtract(100, 20), 0.001);
        
        // Test with negative numbers
        assertEquals("Subtraction of negative numbers not working correctly", -80.0, calculator.subtract(-100, -20), 0.001);
    }

    /**
     * Test for multiply operation
     */
    @Test
    public void multiplyTest() {
        // Test with positive numbers
        assertEquals("Multiplication of positive numbers not working correctly", 200.0, calculator.multiply(10, 20), 0.001);
        
        // Test with negative numbers
        assertEquals("Multiplication of negative numbers not working correctly", 200.0, calculator.multiply(-10, -20), 0.001);
        
        // Test with mixed numbers
        assertEquals("Multiplication of mixed numbers not working correctly", -200.0, calculator.multiply(-10, 20), 0.001);
    }

    /**
     * Test for divide operation
     */
    @Test
    public void divideTest() {
        // Test with positive numbers
        assertEquals("Division of positive numbers not working correctly", 1.5, calculator.divide(3, 2), 0.001);
        
        // Test with negative numbers
        assertEquals("Division of negative numbers not working correctly", 1.5, calculator.divide(-3, -2), 0.001);
    }
    
    /**
     * Test for divide by zero exception
     */
    @Test
    public void divideByZeroTest() {
        try {
            calculator.divide(10, 0);
            fail("Expected ArithmeticException was not thrown");
        } catch (ArithmeticException e) {
            assertEquals("Exception message is incorrect", "Cannot divide by zero", e.getMessage());
        }
    }
}
