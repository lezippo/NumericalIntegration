fun = @(x) exp(2*x)*sin(3*x);
a = 0;
b = 2;
n = 2;
tol = 10^-4;
gamma = 3;
err = tol + 1;

oldTn = mytrap(fun, a, b, n);
n = 2 * n;

while err > tol
    newTn = mytrap(fun, a, b, n);
    err = abs(newTn - oldTn) / gamma;
    n = 2 * n;
    oldTn = newTn;
end

n = n / 2;

disp('Trapezoid')

disp('Integral Approximation: ')
disp(oldTn)
disp('Error:')
disp(err)
disp('Required Nodes (including endpoints): ')
disp(n + 1)
disp('Interval Width: ')
disp((b - a) / n)

n = 2;
gamma = 15;
err = tol + 1;

oldSn = mysimp(fun, a, b, n);
n = 2 * n;

while err > tol
    newSn = mysimp(fun, a, b, n);
    err = abs(newSn - oldSn) / gamma;
    n = 2 * n;
    oldSn = newSn;
end

n = n / 2;

disp('Simpson')

disp('Integral Approximation: ');
disp(oldTn)
disp('Error:')
disp(err)
disp('Required Nodes (including endpoints): ')
disp(n + 1)
disp('Interval Width: ')
disp((b - a) / n)
