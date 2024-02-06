%Aufgabe 1.1
fx=@(x)x^3+3^x;
dfx=@(x)3*x^2+3^x*log(3);
x=0;
i=0;
while abs(fx(x)) > 10^-12
    x=x-fx(x)/dfx(x);
    i=i+1;
end
%% 1.2
fx2=@(x)atan(x);
dfx2=@(x)1/(1+x^2);
xb1=2;xb2=1;
i1=0;i2=0;
while abs(fx2(xb1)) >10^-12
    xb1=xb1-fx2(xb1)/dfx2(xb1);
    i1=i1+1;
end

while abs(fx2(xb2)) >10^-12
    xb2=xb2-fx2(xb2)/dfx2(xb2);
    i2=i2+1;
end