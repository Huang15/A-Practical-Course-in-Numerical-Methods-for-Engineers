function [J,detJ,invJ] = getJacobian(nodes, xi, eta)
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt3')
J=nodes'*linquadderivref(xi,eta);
detJ=det(J);
invJ=inv(J);
end