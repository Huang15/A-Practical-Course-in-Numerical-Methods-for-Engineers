x1 = solveGauss([10.0, 2, 1; 3, 4, 4; 1, 8, 4], [1; 1; 2]);
%% aufgabe 2
x2 = solveG([10.0, 2.0, 10.0; 2.0, 40.0, 8.0; 10.0, 8.0, 60.0], [1.0; 1.0; 2.0], [0.0; 0.0; 0.0], 1e-7, 1000);
%% aufgabe 3
x3 =  solveCG([10.0, 2.0, 10.0; 2.0, 40.0, 8.0; 10.0, 8.0, 60.0], [1.0; 1.0; 2.0], [0.0; 0.0; 0.0], 1e-7, 1000);
%%  aufgabe 4
phi=[10.0, 6.0, 5.1, 5.01, 5.001, 5.00001, 5.0000001, 5.000000001, 5.00000000001];
n=300;
A1 = diag(-2*ones(1,n-1),1);
A2 = diag(-2*ones(1,n-1),-1);
A = cell(size(phi,2),1);
for i =1:size(phi,2)
    A3 = diag([1 phi(i)*ones(1,n-1)],0);
    A{i}=A1+A2+A3;
end
b=ones(n,1);
x0=zeros(n,1);
rtol=1e-7;
itermax=10000;
t_end1=zeros(9,1);
t_end2=zeros(9,1);
t_end3=zeros(9,1);
t_end4=zeros(9,1);
for i =1:size(phi,2)
    t1 = tic;
    x = solveGauss(A{i},b);
    t_end1(i)=toc(t1);
    
    t2= tic;
    x = solveG(A{i},b,x0,rtol,itermax);
    t_end2(i)=toc(t2);

    t3= tic;
    x = solveCG(A{i},b,x0,rtol,itermax);
    t_end3(i)=toc(t3);
    
    t4=tic;
    x=A{i}\b;
    t_end4(i)=toc(t4);


end
% 结论 小数点位数越多，越不好解，对于高斯反而差不多，自带的nb但是对于整数反而递进法好用


