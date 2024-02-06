clc;
clear;
close;

format long;
Aufgabe1();

Aufgabe2();

Aufgabe3();




function Aufgabe1()
A=eye(4)*3 ;v=[1;2;3;4];
a=dot(v,v); 
B=v*v'; 
C=A*B ;
lambda=eig(C);% matlab自带的eig函数解出来的特征值是数值解，存在误差不是解析解
x=(C-A)\(a*v);
C(:,2)=v;
b=C(:,3);
c=10:0.5:100;
f=c.*(5+c)+1./c+2.^c;
lf=size(f,2);
end

function Aufgabe2()
a=rand(1,1000);
if a(1)>=0
    disp('a1 >= 0.5');
else
    disp('a1 < 0.5');
end

n05=0;
for i=1:1000
    if a(i)>=0.5
        n05=n05+1;
    end
end

j=1;
while j<=1000
    if a(j)>=0.499 && a(j)<=0.501
        aj=a(j);
        break
    end
    j=j+1;
    if j>1000
        disp("Kein Element 0.499 <= a_i <= 0.501")
    end
end

test0=facultaet(0); 
test5=facultaet(5)
end

function Aufgabe3()

x=linspace(-pi,pi);
y=sin(x);
plot(x,y);
nodes = [-1, -1; 0, -1; 1, -1; -1, 0; 0, 0; 1, 0; -1, 1; 0, 1; 1, 1];
elements = [1, 2, 5, 4; 2, 3, 6, 5; 4, 5, 8, 7; 5, 6, 9, 8];
sol = [2; 1; 2; 1; 0; 1; 2; 1; 2];
quadplot(nodes,elements,sol)
end


