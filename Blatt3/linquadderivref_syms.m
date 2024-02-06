function deriv = linquadderivref_syms(xi,eta)
syms a b
N1(a,b)=1/4*(1-a)*(1-b);
N2(a,b)=1/4*(1+a)*(1-b);
N3(a,b)=1/4*(1+a)*(1+b);
N4(a,b)=1/4*(1-a)*(1+b);

% N=cell(4,1);
% N{1}(a,b)=N1(a,b);
% N{2}(a,b)=N2(a,b);
% N{3}(a,b)=N3(a,b);
% N{4}(a,b)=N4(a,b);
% 
% dN=cell(4,2);
% for i=1:4
%     dN{i,1}(a,b)=diff(N{i},a);
%     dN{i,2}(a,b)=diff(N{i},b)
% end

dN1a(a,b)=diff(N1,a);
dN1b(a,b)=diff(N1,b);
dN2a(a,b)=diff(N2,a);
dN2b(a,b)=diff(N2,b);
dN3a(a,b)=diff(N3,a);
dN3b(a,b)=diff(N3,b);
dN4a(a,b)=diff(N4,a);
dN4b(a,b)=diff(N4,b);

deriv=double([dN1a(xi,eta),dN1b(xi,eta);dN2a(xi,eta),dN2b(xi,eta);dN3a(xi,eta),dN3b(xi,eta);dN4a(xi,eta),dN4b(xi,eta);]);

end