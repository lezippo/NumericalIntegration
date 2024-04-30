function [S,err,ierr,nodes] = mysimpcnodi(fun,a,b,tol,nfmax)
% purpose: approximation of the integral of fun(x) in dx over the interval [a,b]
% using the composite Simpson's rule, ensuring an error
% below a given tolerance;
%
% syntax: [S,err,ierr,nodes] = mysimpcnodi(fun,a,b,tol,nfmax)
% input:
% fun:     integrand function;
% a:       lower limit of integration;
% b:       upper limit of integration;
% tol:     preset tolerance (maximum error the algorithm can
%          commit on the integral approximation);
% nfmax:   safety factor: maximum number of function evaluations
%          the algorithm can perform;
% output:
% S:       integral approximation using Simpson's method;
% err:     estimation of the error committed on the approximation;
% ierr:    error indicator: ierr=0 if the error satisfies the tolerance
%          and no more than nfmax function evaluations have been performed;
%          ierr=-1 if the error does not satisfy the tolerance or more
%          than nfmax function evaluations have been performed;
% nodes:   nodes at which the composite Simpson's rule is applied

% stopping criterion: estimation of the error on successive iterations (it is demonstrated
% that the error E(h/2)~(I(h/2)-I(h))/15 with h being the width of subintervals)
%
% example:
% fun=@(x) x.^2.*log(x);
% a=1;
% b=1.5;
% tol=10^-3;
% nfmax=100
%
% [S,err,ierr,nodes]=mysimpcnodi(fun,a,b,tol,nfmax)
%
% author: Zippo Luigi Emanuele

nodes = [];
gamma = 15;
fa = fun(a);
nodes(1) = a;
fb = fun(b);
nodes(2) = b;
c = (a + b) / 2;
fc = fun(c);
nodes(3) = c;
ierr = 0;
sum2 = 0;
sum4 = 0;
n = 2;
it = 4;

h = (b - a) / n;

% computing the initial approximation of the integral considering the nodes
% at the endpoints a and b and the midpoint of the interval

I1 = (fa + 4 * fc + fb) * h / 3;

% halving the width of the intervals

m = n;
n = 2 * n;

h = (b - a) / n;

for k = 1:(m - 1)
    sum2 = sum2 + fun(a + 2 * k * h);
    nodes(it) = a + 2 * k * h;
    it = it + 1;
end

for k = 0:(m - 1)
    sum4 = sum4 + fun(a + (2 * k + 1) * h);
    nodes(it) = a + (2 * k + 1) * h;
    it = it + 1;
end

% computing a new approximation of the integral (over intervals
% half the width of those used in the initial approximation)

I2 = h / 3 * (fa + 2 * sum2 + 4 * sum4 + fb);

diff = abs(I2 - I1);

% so far, 2*n+2 function evaluations have been performed

nfval = 2 * n + 2;

while diff > gamma * tol && nfval < nfmax
    I1 = I2;
     
    % halving the width of the intervals again

    m = n;
    n = 2 * n;
    h = (b - a) / n;

    sum2 = sum2 + sum4;
    sum4 = 0;

    for k = 0:(m - 1)
        % halving the width of the subintervals doubles the number of
        % nodes; it is not necessary to recalculate f at all nodes at each iteration,
        % f is recalculated only at the 'new' nodes
        sum4 = sum4 + fun(a + (2 * k + 1) * h);
        nodes(it) = a + (2 * k + 1) * h;
        it = it + 1;
    end
    
    % applying Simpson's method on the new subintervals

    I2 = (fa + 2 * sum2 + 4 * sum4 + fb) * h / 3;

    % updating diff with the new approximations to estimate
    % the error

    diff = abs(I1 - I2);

    % adding the function evaluations performed

    nfval = nfval + m;

    if nfval > nfmax
        ierr = -1;
        break;
    end
end

S = I2;
err = diff / gamma;

end
