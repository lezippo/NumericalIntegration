fun = @(x) x .* cos(x .^ 2);
a = -pi/2;
b = pi/2;
tol = 10^-6;
nfmax = 100;

% The function is odd and the integration intervals are symmetric
% about the origin: the value of the integral is 0

[T,err,ierr] = mytrapc(fun, a, b, tol, nfmax)
[S,err,ierr] = mysimpc(fun, a, b, tol, nfmax)
