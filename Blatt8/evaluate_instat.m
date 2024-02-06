function [elemat,elevec] = evaluate_instat(elenodes,gpx,gpw,elesol,eleosol,timInt_m,timestep,theta,firststep)
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt7')
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt6')
Rho=7800;c=452;
M=zeros(4,4);
B1=zeros(4,4);
lamnda=48;
for i =1:4
    for j=1:4
        for k=1:size(gpx,1)
            xi=gpx(k,1);
            eta=gpx(k,2);
            [~,detJ,invJ] = getJacobian(elenodes, xi, eta);
            val = linquadref(xi,eta);
            M(i,j)=M(i,j)+Rho*c*val(i)*val(j)*detJ*gpw(k);
            deriv = linquadderivref(xi,eta);
            B1(i,j)=B1(i,j)+lamnda*deriv(i,:)*invJ*(deriv(j,:)*invJ)'*detJ*gpw(k);
        end
    end
end
switch timInt_m
    case 1
        B{1}=-B1;
        B{2}=-B1;
        C=[0,0];
        [elemat,elevec] = OST(theta,timestep,M,B,C,elesol);
    case 2
        B{1}=-B1;
        B{2}=-B1;
        C=[0,0];
        sol{1}=elesol;
        sol{2}=eleosol;
        [elemat,elevec] = AB2(timestep,M,B,C,sol);
    case 3
        B{1}=-B1;
        B{2}=-B1;
        B{3}=-B1;
        C=[0,0,0];
        sol{1}=elesol;
        sol{2}=eleosol;
        [elemat,elevec] = AM3(timestep,M,B,C,sol);
    case 4
        B=-B1;
        C=0;
        sol{1}=elesol;
        sol{2}=eleosol;
        [elemat,elevec] = BDF2(timestep,M,B,C,sol);

end

end