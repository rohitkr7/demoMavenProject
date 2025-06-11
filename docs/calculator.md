# Calculator Documentation

The `Calculator` class provides basic arithmetic operations for numerical calculations.

## Features

The Calculator supports the following operations:

### Addition

```java
double sum(double x, double y)
```

Adds two numbers and returns their sum.

**Example:**
```java
Calculator calculator = new Calculator();
double result = calculator.sum(10.5, 20.3); // Returns 30.8
```

### Subtraction

```java
double subtract(double x, double y)
```

Subtracts the second number from the first and returns the difference.

**Example:**
```java
Calculator calculator = new Calculator();
double result = calculator.subtract(30.5, 10.2); // Returns 20.3
```

### Multiplication

```java
double multiply(double x, double y)
```

Multiplies two numbers and returns their product.

**Example:**
```java
Calculator calculator = new Calculator();
double result = calculator.multiply(5.0, 4.0); // Returns 20.0
```

### Division

```java
double divide(double x, double y)
```

Divides the first number by the second and returns the quotient.

**Example:**
```java
Calculator calculator = new Calculator();
double result = calculator.divide(20.0, 4.0); // Returns 5.0
```

**Note:** Division by zero will throw an `ArithmeticException` with the message "Cannot divide by zero".

## Logging

All calculator operations are logged using SLF4J at the DEBUG level. This includes:
- Input parameters
- Operation results
- Error conditions (e.g., division by zero)

To view these logs, ensure your logging configuration has the appropriate log level set for the `Calculators` package.
