%test
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt5')
[elemat,elevec] = evaluate_stat([0, 0; 1, 0; 1, 2; 0, 2], gx2dref(3), gw2dref(3));
[sysmat,rhs] = assemble([1, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12; 13, 14, 15, 16], [17; 18; 19; 20], eye(5,5), ones(5,1), [5, 3, 1, 2]);
[sysmat1,rhs1] = assignDBC([12, 12, 10, 0, 9; 15, 17, 14, 0, 13; 7, 8, 7, 0, 5; 0, 0, 0, 1, 0; 3, 4, 2, 0, 2], [20; 21; 19; 1; 18], [2, -7; 5, -2]);

%% 
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt5')
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt1')
el_nodes=cell(1,10);r=0.02;
el_nodes{1}=[0,0;0.1,0;0.1,0.1;0,0.1];
el_nodes{2}=el_nodes{1};el_nodes{2}(:,1)=el_nodes{2}(:,1)+0.1;
el_nodes{3}=el_nodes{2};el_nodes{3}(:,1)=el_nodes{3}(:,1)+0.1;
el_nodes{4}=el_nodes{1};el_nodes{4}(:,2)=el_nodes{4}(:,2)+0.1;
el_nodes{5}=el_nodes{4};el_nodes{5}(:,1)=el_nodes{5}(:,1)+0.1;
el_nodes{6}=[0.2,0.1;0.3-r*sin(pi/6),0.3-r*cos(pi/6);0.3-r*cos(pi/6),0.3-r*sin(pi/6);0.2,0.2];
el_nodes{7}=[0.2,0.1;0.3,0.1;0.3,0.3-r;0.3-r*sin(pi/6),0.3-r*cos(pi/6)];
el_nodes{8}=el_nodes{4};el_nodes{8}(:,2)=el_nodes{8}(:,2)+0.1;
el_nodes{9}=[0.1,0.2;0.2,0.2;0.15,0.3;0.1,0.3];
el_nodes{10}=[0.2,0.2;0.3-r*cos(pi/6),0.3-r*sin(pi/6);0.3-r,0.3;0.15,0.3];

ele=[1,2,6,5;2,3,7,6;3,4,8,7;5,6,10,9;6,7,11,10;7,12,14,11;7,8,13,12;9,10,16,15;10,11,17,16;11,14,18,17];
sysmat=zeros(18);
rhs=zeros(18,1);
for i=1:size(el_nodes,2)
    [elemat,elevec] = evaluate_stat(el_nodes{i}, gx2dref(2), gw2dref(2));
    [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele(i,:));
end
[sysmat,rhs] = assignDBC(sysmat,rhs,[1,600;2,600;3,600;4,600;18,300;14,300;12,300;13,300]);
T=sysmat\rhs;
x=[0,0.1,0.2,0.3,0,0.1,0.2,0.3,0,0.1,0.2,0.3-r*sin(pi/6),0.3,0.3-r*cos(pi/6),0,0.1,0.15,0.3-r];
y=[0,0,0,0,0.1,0.1,0.1,0.1,0.2,0.2,0.2,0.3-r*cos(pi/6),0.3-r,0.3-r*sin(pi/6),0.3,0.3,0.3,0.3];
quadplot([x' y'],ele,T);
colorbar;
%% 找出r
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt5')
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt1')
for r =0.02:0.01:0.3
        el_nodes=cell(1,10);
        el_nodes{1}=[0,0;0.1,0;0.1,0.1;0,0.1];
        el_nodes{2}=el_nodes{1};el_nodes{2}(:,1)=el_nodes{2}(:,1)+0.1;
        el_nodes{3}=el_nodes{2};el_nodes{3}(:,1)=el_nodes{3}(:,1)+0.1;
        el_nodes{4}=el_nodes{1};el_nodes{4}(:,2)=el_nodes{4}(:,2)+0.1;
        el_nodes{5}=el_nodes{4};el_nodes{5}(:,1)=el_nodes{5}(:,1)+0.1;
        el_nodes{6}=[0.2,0.1;0.3-r*sin(pi/6),0.3-r*cos(pi/6);0.3-r*cos(pi/6),0.3-r*sin(pi/6);0.2,0.2];
        el_nodes{7}=[0.2,0.1;0.3,0.1;0.3,0.3-r;0.3-r*sin(pi/6),0.3-r*cos(pi/6)];
        el_nodes{8}=el_nodes{4};el_nodes{8}(:,2)=el_nodes{8}(:,2)+0.1;
        el_nodes{9}=[0.1,0.2;0.2,0.2;0.15,0.3;0.1,0.3];
        el_nodes{10}=[0.2,0.2;0.3-r*cos(pi/6),0.3-r*sin(pi/6);0.3-r,0.3;0.15,0.3];
        
        ele=[1,2,6,5;2,3,7,6;3,4,8,7;5,6,10,9;6,7,11,10;7,12,14,11;7,8,13,12;9,10,16,15;10,11,17,16;11,14,18,17];
        sysmat=zeros(18);
        rhs=zeros(18,1);
        for i=1:size(el_nodes,2)
            [elemat,elevec] = evaluate_stat(el_nodes{i}, gx2dref(2), gw2dref(2));
            [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele(i,:));
        end
        [sysmat,rhs] = assignDBC(sysmat,rhs,[1,600;2,600;3,600;4,600;18,300;14,300;12,300;13,300]);
        T=sysmat\rhs;
        if T(15)<=450 && T(16)<=450 && T(17)<=450 && T(18)<=450
            break
        end
end

r_neu=r;


x=[0,0.1,0.2,0.3,0,0.1,0.2,0.3,0,0.1,0.2,0.3-r*sin(pi/6),0.3,0.3-r*cos(pi/6),0,0.1,0.15,0.3-r];
y=[0,0,0,0,0.1,0.1,0.1,0.1,0.2,0.2,0.2,0.3-r*cos(pi/6),0.3-r,0.3-r*sin(pi/6),0.3,0.3,0.3,0.3];
quadplot([x' y'],ele,T);
colorbar;
