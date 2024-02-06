function [elemat,elevec]=Evaluieren(elenodes,gpx,gpw,T)
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt7')
[A,~]=evaluate_stat(elenodes,gpx,gpw);%Fi的前半部分还要乘T
c1=10^6;
c2=10^3;
B=zeros(4,1);
C=zeros(4,4);


for k=1:size(gpx,1)
    xi=gpx(k,1);
    eta=gpx(k,2);
    [~,detJ,~] = getJacobian(elenodes, xi, eta);
    val = linquadref(xi,eta);
    for i= 1:4
        sumnj=0;
        for j =1:4
            sumnj = sumnj+val(j)*T(j);
            %Jij 部分
            C(i,j)=C(i,j)+val(i)*val(j)*c1*c2/(sumnj^2)*exp(-c2/sumnj)*detJ*gpw(k);
        end
        B(i)=B(i)+val(i)*c1*exp(-c2/sumnj)*detJ*gpw(k);
    end
end
elevec =-(A*T-B);
elemat = A-C;
end