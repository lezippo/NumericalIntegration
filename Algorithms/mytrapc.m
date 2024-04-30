function [T,err,ierr]=mytrapc(fun,a,b,tol,nfmax)
% purpose: approximation of the integral of fun(x) over dx in the interval [a,b]
% using the composite trapezoidal rule with an error less than a given tolerance;
%
% syntax: [T,err,ierr]=mytrapc(fun,a,b,tol,nfmax)
% input:
% fun:     integrand function;
% a:       lower limit of integration;
% b:       upper limit of integration;
% tol:     preset tolerance (maximum error the algorithm can
%          commit on the integral approximation);
% nfmax:   safety factor: maximum number of function evaluations
%          the algorithm can perform;
% output:
% T:       integral approximation using the trapezoidal method
% err:     estimation of the error committed on the approximation;
% ierr:    error indicator: ierr=0 if the error satisfies the tolerance
%          and no more than nfmax function evaluations have been performed;
%          ierr=-1 if the error does not satisfy the tolerance or more
%          than nfmax function evaluations have been performed
%
% stopping criterion: estimation of the error on successive iterations (it is demonstrated
% that the error E(h/2)~(I(h/2)-I(h))/3 with h being the width of subintervals)
%
% example: fun=@(x) x.^2.*log(x);
% a=1;
% b=1.5;
% tol=10^-3;
% nfmax=100
%
% [T,err,ierr]=mytrapc(fun,a,b,tol,nfmax)
%
% author: Zippo Luigi Emanuele

gamma=3;
fa=fun(a);
fb=fun(b);
ierr=0;
sum=0;

h=(b-a);

% computing an initial estimate of the integral with only a and b as nodes

I1=(fa+fb)*h/2;

c=(b+a)/2;
fc=fun(c);
h=h/2;

% halving the interval and using the composite trapezoidal rule on the 2
% subintervals

I2=(h/2).*(fa+2.*fc+fb);

% using the variable diff to approximate the error

diff=abs(I2-I1);

% so far, 3 function evaluations have been performed

nfval=3;

n=2;

% in sum, we calculate the sum of the function evaluations at the "intermediate" points

sum=sum+fc;

% setting diff>gamma*tol is equivalent to setting error=diff/gamma>tol

while diff>gamma*tol && nfval<nfmax

    I1=I2;
    
    % halving the width of the subintervals again

    n=2*n;
    h=(b-a)/n;

    for k=0:(n/2-1)

        sum=sum+fun(a+(2*k+1)*h);
        
    end

    % using the composite trapezoidal rule on the new subintervals

    I2=(fa+2*sum+fb)*(h/2);

    diff=abs(I1-I2);

    % recalculating diff considering the new approximation. This way,
    % I estimate the error committed considering the new subintervals, of
    % halved width

    nfval=nfval+n/2;

    if nfval>nfmax

    ierr=-1;
    break

    end

end

T=I2;

err=diff/gamma;

end
