# NumericalIntegration
Integrals' approximation using Composite Trapezoidal and Simpson's rules

1. [Theory](#theory)
   - [Trapezoidal Composite Rule](#trapezoidal-composite-rule)
   - [Simpson's Composite Rule](#simpsons-composite-rule)
   - [Comparison](#comparison)
2. [Code Structure](#code-structure)
   - [mysimp](#mysimp)
   - [mysimpc](#mysimpc)
   - [mysimpcnodi](#mysimpcnodi)
   - [mytrap](#mytrap)
   - [mytrapc](#mytrapc)
   - [BE CAREFUL](#be-careful)
3. [Examples](#examples)


# Theory
## Trapezoidal composite Rule

The Trapezoidal composite Rule is a numerical method for approximating the definite integral of a function by dividing the interval into $n$ subintervals and applying the trapezoidal rule to each subinterval. Here's how it works:

1. **Interval Division**: Divide the interval of integration into $n$ subintervals of equal width $\Delta x$.
2. **Trapezoidal Rule**: Apply the trapezoidal rule to each subinterval: $$\int_{x_k}^{x_{k+1}} f(x) dx \approx (x_{k+1} - x_k) * \frac{1}{2} (f(x_k)+f(x_{k+1}))$$ for each subinterval $[x_k, x_{k+1}]$
3. **Composite Rule**: Sum the results obtained from each subinterval to get the overall approximation of the integral.
   $$\int_{a}^{b} f(x) dx \approx \frac{\Delta x}{2} \left( f(x_0) + 2f(x_1) + 2f(x_2) + \ldots + 2f(x_{n-1}) + f(x_n) \right)$$
   where $x_0$ to $x_n$ are the endpoints of the subintervals and $f(x_i)$ are the function values at those points

## Simpson's composite Rule

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

# Code structure

## mysimp

### Purpose
Approximation of the integral of `fun(x)` over the interval `[a,b]` using the composite Simpson's rule with a preset number of subintervals.

### Input
- `fun`: Integrand function.
- `a`: Lower limit of integration.
- `b`: Upper limit of integration.
- `n`: Number of subintervals to apply the Simpson's rule.

### Output
- `Sn`: Approximation of the integral.

## mysimpc

### Purpose
Approximation of the integral of `fun(x)` over the interval `[a,b]` using the composite Simpson's rule with an error less than a given tolerance.

### Input
- `fun`: Integrand function.
- `a`: Lower limit of integration.
- `b`: Upper limit of integration.
- `tol`: Preset tolerance (maximum error the algorithm can commit on the integral approximation).
- `nfmax`: Safety factor: maximum number of function evaluations the algorithm can perform.

### Output
- `S`: Integral approximation using Simpson's method.
- `err`: Estimation of the error committed on the approximation.
- `ierr`: Error indicator.

## mysimpcnodi

### Purpose
Approximation of the integral of `fun(x)` over the interval `[a,b]` using the composite Simpson's rule, ensuring an error below a given tolerance.

### Input
- `fun`: Integrand function.
- `a`: Lower limit of integration.
- `b`: Upper limit of integration.
- `tol`: Preset tolerance (maximum error the algorithm can commit on the integral approximation).
- `nfmax`: Safety factor: maximum number of function evaluations the algorithm can perform.

### Output
- `S`: Integral approximation using Simpson's method.
- `err`: Estimation of the error committed on the approximation.
- `ierr`: Error indicator.
- `nodes`: Nodes at which the composite Simpson's rule is applied.

## mytrap

### Purpose
Approximation of the integral of `fun(x)` over the interval `[a,b]` using the composite trapezoidal rule with a preset number of subintervals.

### Input
- `fun`: Integrand function.
- `a`: Lower limit of integration.
- `b`: Upper limit of integration.
- `n`: Number of subintervals to apply the trapezoidal rule.

### Output
- `Tn`: Approximation of the integral.

## mytrapc

### Purpose
Approximation of the integral of `fun(x)` over the interval `[a,b]` using the composite trapezoidal rule with an error less than a given tolerance.

### Input
- `fun`: Integrand function.
- `a`: Lower limit of integration.
- `b`: Upper limit of integration.
- `tol`: Preset tolerance (maximum error the algorithm can commit on the integral approximation).
- `nfmax`: Safety factor: maximum number of function evaluations the algorithm can perform.

### Output
- `T`: Integral approximation using the trapezoidal method.
- `err`: Estimation of the error committed on the approximation.
- `ierr`: Error indicator.

# BE CAREFUL
mysimp and mytrap need a preset number of subintervals, insthead mysimpc and mytrapc automatically determine the required number of subintervals in order to meet the tolerance goals

# Examples 

