package DevOpsDemo;

import static org.junit.Assert.assertTrue;
import static org.testng.Assert.assertFalse;
import org.testng.annotations.Test;

public class Calculator {
	public double sum(double x, double y) {
		return x + y;
	}

	public double subtract(double x, double y) {
		return x - y;
	}

	public double multiply(double x, double y) {
		return x * y;
	}

	public int divide(int x, int y) throws ArithmeticException {
		//This is a modified division method
		if(y!=0) {
			return x / y;
		}
		else {
			throw new ArithmeticException("Divide By Zero");
		}
	}
}
