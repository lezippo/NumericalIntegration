fun = @(x) 1/(1+x);
format long
a = 0;
b = 1;
Trapezoid = zeros(5,1);
Simpson = Trapezoid;

n = 4;

for i = 1:10
    Trapezoid(i,1) = mytrap(fun, a, b, n);
    Simpson(i,1) = mysimp(fun, a, b, n);
    n = n * 2;
end

n = [2,4,8,16,32,64,128,256,512,1024]';
disp(table(n, Trapezoid, Simpson))

err = zeros(9,1);
gamma = 3;

for i = 1:9
    err(i) = abs(Trapezoid(i+1) - Trapezoid(i)) / gamma;
end

disp(table(err, 'VariableNames', {'Trapezoid Error'}))

disp('Successive Iterates Ratios:')

for i = 1:8
    disp(err(i) / err(i+1))
end

% As we can observe, by halving h each time (the width of each
% interval with consecutive nodes), that is by doubling the
% number of nodes n, the error quadruples. We can conclude
% that the convergence order is 2

gamma = 15;

for i = 1:9
    err(i) = abs(Simpson(i+1) - Simpson(i)) / gamma;
end

disp(table(err, 'VariableNames', {'Simpson Error'}))

disp('Successive Iterates Ratios:')

for i = 1:8
    disp(err(i) / err(i+1))
end
