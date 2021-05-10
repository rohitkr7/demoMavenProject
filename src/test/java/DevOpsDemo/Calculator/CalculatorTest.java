package DevOpsDemo.Calculator;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class CalculatorTest {
	Calculator calculator = new Calculator();
	@Test
	public void sumTest() {
		//This test will check the sum functionality of the test
		
		assertTrue(calculator.sum(10, 20) == 30);
	}
}
