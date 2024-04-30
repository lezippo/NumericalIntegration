# NumericalIntegration
Integrals' approximation using Composite Trapezoidal and Simpson's rules

## Trapezoidal Composite Rule

The Trapezoidal Composite Rule is a numerical method for approximating the definite integral of a function by dividing the interval into $n$ subintervals and applying the trapezoidal rule to each subinterval. Here's how it works:

1. **Interval Division**: Divide the interval of integration into $n$ subintervals of equal width $\Delta x$.
2. **Trapezoidal Rule**: Apply the trapezoidal rule to each subinterval:
   $$\int_{a}^{b} f(x) \, dx \approx \frac{\Delta x}{2} \left( f(x_0) + 2f(x_1) + 2f(x_2) + \ldots + 2f(x_{n-1}) + f(x_n) \right)$$
   where $x_0$ to $x_n$ are the endpoints of the subintervals and $f(x_i)$ are the function values at those points.
3. **Composite Rule**: Sum the results obtained from each subinterval to get the overall approximation of the integral.

## Simpson's Rule

Simpson's Rule is another numerical method for approximating integrals. It provides a more accurate approximation by fitting parabolic arcs to the function over small intervals. Here's how it works:

1. **Interval Division**: Divide the interval of integration into $n$ subintervals of equal width $\Delta x$. $n$ must be even.
2. **Simpson's Formula**: Apply Simpson's formula to each pair of adjacent subintervals:
   $$\int_{a}^{b} f(x) \, dx \approx \frac{\Delta x}{3} \left( f(x_0) + 4f(x_1) + 2f(x_2) + 4f(x_3) + \ldots + 2f(x_{n-2}) + 4f(x_{n-1}) + f(x_n) \right)$$
   where $x_0$ to $x_n$ are the endpoints of the subintervals and $f(x_i)$ are the function values at those points.
3. **Composite Rule**: Sum the results obtained from each pair of adjacent subintervals and adjust the weights accordingly.

## Comparison

- **Trapezoidal Composite Rule**:
  - Simple to implement.
  - Less accurate compared to Simpson's Rule but often sufficient for many applications.
  - Converges linearly with the number of subintervals.
- **Simpson's Rule**:
  - More accurate than the Trapezoidal Rule.
  - Requires fewer function evaluations for the same level of accuracy compared to the Trapezoidal Rule.
  - Converges quadratically with the number of subintervals.

Both methods are effective for approximating integrals, with Simpson's Rule generally providing more accurate results but at the cost of slightly more computational effort compared to the Trapezoidal Composite Rule.
