function Tn=mytrap(fun,a,b,n)
% Purpose: Approximation of the integral of fun(x) in dx over the interval [a,b]
% using the composite trapezoidal rule with a preset number of
% subintervals.
% Graphically, we divide the interval [a,b] into n subintervals and
% approximate the area under the graph of f with the area under the segments
% with endpoints (x_i,f(x_i)) and (x_i+1,f(x_i+1)) for i=0,1,...,n. We
% approximate the integral with the sum of the areas of n trapezoids.
%
% Syntax: Tn=mytrap(fun,a,b,n)
% Input:
% fun:     integrand function;
% a:       lower limit of integration;
% b:       upper limit of integration;
% n:       number of subintervals to apply the trapezoidal rule;
% Output:
% Tn:      approximation of the integral
%
% Example:
% fun=@(x) x.*log(x);
% a=1;
% b=1.5;
% n=4;
%
% Tn=mytrap(fun,a,b,n);
%
% Author: Luigi Emanuele Zippo

h=(b-a)/n;
Tn=0;

for i=1:(n-1)
    % Evaluate the function at the interior points
    Tn=Tn+fun(a+i*h);
end

Tn=2*Tn;
Tn=(fun(a)+Tn+fun(b))*h/2;

end
