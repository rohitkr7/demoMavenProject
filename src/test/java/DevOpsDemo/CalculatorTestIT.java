package DevOpsDemo;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class CalculatorTestIT {
	Calculator calculator = new Calculator();

	final double Pi = 3.14;

	final String first_name = "rohit";
	String last_name = "roy_";

	private final String FULL_NAME = "rohit";

	
	@Test
	public void sumTest() {
		// This test will check the sum functionality of the test

		assertTrue("Sum function not working fine.", calculator.sum(10, 20) == 30);
	}


	public void subtractTest() {
		// This test will check the subtract functionality of the test

		assertTrue("Sum function not working fine.", calculator.subtract(100, 20) == 80);
	}

	@Test
	public void MultiplyTest() {
		// This test will check the multiply functionality of the test

		assertTrue("Sum function not working fine.", calculator.multiply(10, 20) == 200);
	}

	@Test
	public void divideTest() {
		// This test will check the multiply functionality of the test

		assertTrue("Division function not working fine.", calculator.divide(3, 2) == 1);
	}

	@Test
	public void helper_Method(){

	}
}
