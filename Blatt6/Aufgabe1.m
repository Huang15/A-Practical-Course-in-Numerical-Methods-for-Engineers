phi_ext =@(t)exp(-5*t).*(t.^2-2*t+2)-2*exp(-6*t);
t=linspace(0,2,100);

delta_t=[0.1,0.2,0.4];
%按照时间画图 首先是∆t=0.1 循环 画图
for j=1:3
    figure
    t1=0:delta_t(j):2;
    phi=zeros(length(t1),6);
    phi(1,:)=0;
    %Vorwärts-Euler Verfahren
    for i=1:(2/delta_t(j))
        phi(i+1,1)=phi(i,1)+delta_t(j)*(t1(i)^2*exp(-5*t1(i))-6*phi(i,1));
    end
    plot(t1,phi(:,1),'--','LineWidth',2)
    hold on
    grid on
    % Rückwärts-Euler Verfahren f(t)中若有phi 可以移项合并
    for i=1:(2/delta_t(j))
        phi(i+1,2)=(phi(i,2)+delta_t(j)*(t1(i+1)^2*exp(-5*t1(i+1))))/(1+6*delta_t(j));
    end
    plot(t1,phi(:,2),'--.','LineWidth',2)
    
    %Trapezregel
    for i=1:(2/delta_t(j))
        phi(i+1,3)=(phi(i,3)+0.5*delta_t(j)*(t1(i)^2*exp(-5*t1(i))-6*phi(i,3)+t1(i+1)^2*exp(-5*t1(i+1))))/(1+3*delta_t(j));
    end
    plot(t1,phi(:,3),'-.','LineWidth',2)

    %Adams-Bashforth-Verfahren 2. Ordnung
    phi(2,4:6)=(phi(1,4)+0.5*delta_t(j)*(t1(1)^2*exp(-5*t1(1))-6*phi(1,4)+t1(1+1)^2*exp(-5*t1(1+1))))/(1+3*delta_t(j));
    timestep=delta_t(j);
    M=1;
    B=[-6,-6,-6];
    for i=2:(2/delta_t(j))
        C=[t1(i)^2*exp(-5*t1(i)),t1(i-1)^2*exp(-5*t1(i-1))];
        sol=[phi(i,4),phi(i-1,4)];
        [LHS,RHS] = AB2(timestep,M,B,C,sol);
        phi(i+1,4)=RHS/LHS;
    end
    plot(t1,phi(:,4),'-.','LineWidth',2)
    
    %Adams-Moulton-Verfahren 3. Ordnung
    for i=2:(2/delta_t(j))
        C=[t1(i+1)^2*exp(-5*t1(i+1)),t1(i)^2*exp(-5*t1(i)),t1(i-1)^2*exp(-5*t1(i-1))];
        sol=[phi(i,5),phi(i-1,5)];
        [LHS,RHS] = AM3(timestep,M,B,C,sol);
        phi(i+1,5)=RHS/LHS;
    end
    plot(t1,phi(:,5),'-.','LineWidth',2)
    
    %BDF2-Verfahren
    for i=2:(2/delta_t(j))
        C=t1(i+1)^2*exp(-5*t1(i+1));
        sol=[phi(i,6),phi(i-1,6)];
        [LHS,RHS] = BDF2(timestep,M,B,C,sol);
        phi(i+1,6)=RHS/LHS;
    end
    plot(t1,phi(:,6),'-.','LineWidth',2)

    
    plot(t,phi_ext(t),'LineWidth',2)
    legend({'Vorwärts-Euler','Rückwärts-Euler','Trapezregel','AB2','AM3','BDF2','exakte Lösung'},'Location','northwest')
    xlabel("t")
    ylabel('φ(t)')
    title(['lösung mit ∆t=',num2str(delta_t(j))])
    if j==3
        ylim([0,9*10^-3])
    end
end
    
    

%|1-λ∆t|≤ 1,λ=-6,0≤∆t≤1/3;  maximale Zeitschritt für ein stabiles Verfahren






 









