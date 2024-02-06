function [elemat,elevec] = evaluate_stat(elenodes,gpx,gpw)
%elenodes 行是第几个nodes,列是x,y
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt5')
A=zeros(4,4);
lamnda=48;
for i =1:4
    for j=1:4
        for k=1:size(gpx,1)
            xi=gpx(k,1);
            eta=gpx(k,2);
            [~,detJ,invJ] = getJacobian(elenodes, xi, eta);
            deriv = linquadderivref(xi,eta);
            A(i,j)=A(i,j)+lamnda*deriv(i,:)*invJ*(deriv(j,:)*invJ)'*detJ*gpw(k);
        
        end
    end

elemat=A;
elevec=[0;0;0;0];
end