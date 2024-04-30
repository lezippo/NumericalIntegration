fun=@(x) (x.^3-x)./(1+x.^4);
hold on
a=0;
b=6; 
tol=0.4*10^-3;
nfmax=200;
fplot(fun,[a,b],'k','LineWidth',1.5)

% [T,err,ierr] = mytrapc(fun,a,b,tol,nfmax)
% [S,err,ierr] = mysimpc(fun,a,b,tol,nfmax)

[T,err,ierr,noditrap]=mytrapcnodi(fun,a,b,tol,nfmax);
[S,err,ierr,nodisimp]=mysimpcnodi(fun,a,b,tol,nfmax);

plot(noditrap,0,'bo',nodisimp,0,'m.')