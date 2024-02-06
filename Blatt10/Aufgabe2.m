T=[600*ones(4,1);300*ones(14,1)];%t0 时刻
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt5')
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt1')
el_nodes=cell(1,10);r=0.1;
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
itermax=20;
for k=1:itermax
    sysmat=zeros(18);
    rhs=zeros(18,1);
    for i=1:size(el_nodes,2)
        [elemat,elevec] = Evaluieren(el_nodes{i},gx2dref(3),gw2dref(3),T(ele(i,:)));
        [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele(i,:));
    end
    [dbcsysmat,dbcrhs] = assignDBC_nlin(sysmat,rhs, [1,600;2,600;3,600;4,600;18,300;14,300;12,300;13,300]);
    deltaT=dbcsysmat\dbcrhs;
    if norm(deltaT) <10^-8
        break
    end
    T=T+deltaT;
end
x=[0,0.1,0.2,0.3,0,0.1,0.2,0.3,0,0.1,0.2,0.3-r*sin(pi/6),0.3,0.3-r*cos(pi/6),0,0.1,0.15,0.3-r];
y=[0,0,0,0,0.1,0.1,0.1,0.1,0.2,0.2,0.2,0.3-r*cos(pi/6),0.3-r,0.3-r*sin(pi/6),0.3,0.3,0.3,0.3];
quadplot([x' y'],ele,T);
colorbar;

%% delta T=10K


addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt5')
addpath('C:\Users\HUANG\Desktop\TUM\A Practical Course in Numerical Methods for Engineers\Blatt1')
el_nodes=cell(1,10);r=0.1;
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
 
T=[600*ones(4,1);300*ones(14,1)];%t0 时刻
for t=1:30
    itermax=20;
    for k=1:itermax
        sysmat=zeros(18);
        rhs=zeros(18,1);
        for i=1:size(el_nodes,2)
            [elemat,elevec] = Evaluieren(el_nodes{i},gx2dref(3),gw2dref(3),T(ele(i,:)));
            [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele(i,:));
        end
        [dbcsysmat,dbcrhs] = assignDBC_nlin(sysmat,rhs, [1,600;2,600;3,600;4,600;18,300;14,300;12,300;13,300]);
        deltaT=dbcsysmat\dbcrhs;
        if norm(deltaT) <10^-8
            break
        end
        T=T+deltaT;
    end
    if T(15) > 450 || T(16) > 450 || T(17) > 450 || T(18) > 450
        T = [600*ones(4,1);300*ones(14,1)];
        T([12,13,14,18])=T([12,13,14,18])-10*t;
    else
        break
    end

end


