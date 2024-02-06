%test
x_ptest=getxPos([2, 1; 4, 1; 4, 3; 2, 2], 0.577, -0.577);
[J_tesr,det_test,inv_test]=getJacobian([2, 1; 4, 1; 4, 3; 2, 2], 0.577, -0.577);
gaussx2d_test=gx2dref(1);
gw2d_test=gw2dref(3);

%Mehrdimensionale Gauß-Quadratur
n=1;
gaussx2d = gx2dref(n);
gw2d=gw2dref(n);
m12G1=0;
for i=1:size(gaussx2d,1)
    val=linquadref(gaussx2d(i,1),gaussx2d(i,2));
    [J_g1,detj_g1,inv_g1]=getJacobian([2, 1; 4, 1; 4, 3; 2, 2], gaussx2d(i,1), gaussx2d(i,2));
    m12G1=m12G1+gw2d(i)*detj_g1*val(1)*val(2);
end

% G2
n=2;
gaussx2d = gx2dref(n);
gw2d=gw2dref(n);
m12G2=0;
for i=1:size(gaussx2d,1)
    val=linquadref(gaussx2d(i,1),gaussx2d(i,2));
    [J_g1,detj_g1,inv_g1]=getJacobian([2, 1; 4, 1; 4, 3; 2, 2], gaussx2d(i,1), gaussx2d(i,2));
    m12G2=m12G2+gw2d(i)*detj_g1*val(1)*val(2);
end


% G3
n=3;
gaussx2d = gx2dref(n);
gw2d=gw2dref(n);
m12G3=0;
for i=1:size(gaussx2d,1)
    val=linquadref(gaussx2d(i,1),gaussx2d(i,2));
    [J_g1,detj_g1,inv_g1]=getJacobian([2, 1; 4, 1; 4, 3; 2, 2], gaussx2d(i,1), gaussx2d(i,2));
    m12G3=m12G3+gw2d(i)*detj_g1*val(1)*val(2);
end