package DevOpsDemo.Calculator;

public class Calulator {
	public double sum(double x, double y) {
		return x + y; 
	}
	
	public double subtract(double x, double y) {
		return x - y; 
	}
	
	public double multiply(double x, double y) {
		return x * y; 
	}
	
	public double divide(double x, double y) {
		if(y!=0) {
			return x / y; 
		}
		else {
			return -1;
		}
	}
}
