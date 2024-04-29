function Sn=mysimp(fun,a,b,n)
% Purpose: Approximation of the integral of fun(x) in dx over the interval [a,b]
% using the composite Simpson's rule with a preset number of
% subintervals.
% Graphically, we divide the interval [a,b] into n subintervals and
% approximate the area under the graph of f with the area under parabolic
% arcs passing through the points (x_2i,f(x_i)), (x_2i+1,f(x_2i+1)), and
% (x_2i+2,f(x_2i+2)) for i=0,1,...,m-1.
%
% Syntax: Sn=mysimp(fun,a,b,n)
% Input:
% fun:     integrand function;
% a:       lower limit of integration;
% b:       upper limit of integration;
% n:       number of subintervals to apply the Simpson's rule.
%          NOTE: n MUST be a positive even integer (for Simpson's rule, we
%          need 3 nodes);
% Output:
% Sn:      approximation of the integral
%
% Example:
% fun=@(x) x.*log(x);
% a=1;
% b=1.5;
% n=4;
%
% Sn=mysimp(fun,a,b,n);
%
% Author: Luigi Emanuele Zippo

sum2=0;
sum4=0;
m=n/2;

h=(b-a)/n;

for k=1:(m-1)
    sum2=sum2+fun(a+2*k*h);
end

for k=0:(m-1)
    sum4=sum4+fun(a+(2*k+1)*h);
end

Sn=h/3*(fun(a)+2*sum2+4*sum4+fun(b));

end
