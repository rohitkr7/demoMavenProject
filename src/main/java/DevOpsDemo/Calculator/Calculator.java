package DevOpsDemo.Calculator;

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
	
	public double divide(double x, double y) throws Exception {
		//This is a modified division method
		if(y!=0) {
			return x / y; 
		}
		else {
			throw new Exception("Divide By Zero");
		}
	}
}
