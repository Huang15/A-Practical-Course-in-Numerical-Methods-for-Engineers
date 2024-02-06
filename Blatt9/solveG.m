function x = solveG(A,b,x0,rtol,itermax)
r=b-A*x0;
k=0;
x=x0;
while norm(r)> rtol && k < itermax
    v = A*r;
    alpha = r'*r/(r'*v);
    x = x + alpha*r;
    r = r-alpha*v;
    k =k+1;
end
disp(k)
