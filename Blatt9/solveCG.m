function x = solveCG(A,b,x0,rtol,itermax)
r=b-A*x0;
p=r;
k=0;
x=x0;
while norm(r)> rtol && k < itermax
    v = A*p;
    alpha = r'*r/(p'*v);
    x = x + alpha*p;
    r_2 = r-alpha*v;
    beta=r_2'*r_2/(r'*r);
    p=r_2+beta*p;
    r=r_2;
    k =k+1;
end
disp(k)

end