%%Aufgabe 2 
n=1;
x_node=[0.0 1.0];
f_node=[0.000000000000 0.031250000000 ];
x=0.6;
f_l1=LagrangePolynom(x,n,x_node,f_node);
f_dl1=LagrangeDerivPolynom(x,n,x_node,f_node);
%fx
x_bereich=linspace(0,4,100);
f_exakt=(x_bereich./(1+x_bereich)).^5;
f_dexat=(5*x_bereich.^4)./(1+x_bereich).^6;
f_poly=LagrangePolynom(x_bereich,n,x_node,f_node);
f_dpoly=LagrangeDerivPolynom(x_bereich,n,x_node,f_node);

hold on
grid on
plot(x_node,f_node,'k.','MarkerSize',20)
plot(x_bereich,f_exakt,'b-','LineWidth',2);
plot(x_bereich,f_poly,'r--','LineWidth',2);
plot(x_bereich,f_dpoly,'g-','LineWidth',2);
plot(x_bereich,f_dexat,'y--','LineWidth',2);

title(' Lagrange Polynome vom Grad 1')
xlabel('x') 
ylabel('f(x)')
legend({'Stützstellen','exakte Funktion f(x)','Polynom P1','erste Ableitung Polynom P1','exakte Funktion df(x)/dx'},'Location','northwest')

hold off

%% 
n=4;
x_node=[0.0 1.0 2.0 3.0 4.0];
f_node=[0.000000000000 0.031250000000 0.131687242798 0.237304687500 0.32768000000];
x=0.6;
f_l4=LagrangePolynom(x,n,x_node,f_node);
f_dl4=LagrangeDerivPolynom(x,n,x_node,f_node);

x_bereich=linspace(0,4,100);
f_exakt=(x_bereich./(1+x_bereich)).^5;
f_dexat=(5*x_bereich.^4)./(1+x_bereich).^6;
f_poly=LagrangePolynom(x_bereich,n,x_node,f_node);
f_dpoly=LagrangeDerivPolynom(x_bereich,n,x_node,f_node);

hold on
grid on

plot(x_node,f_node,'k.','MarkerSize',25)
plot(x_bereich,f_exakt,'b-','LineWidth',3);
plot(x_bereich,f_poly,'r--.','LineWidth',2);
plot(x_bereich,f_dpoly,'g-','LineWidth',2);
plot(x_bereich,f_dexat,'y--','LineWidth',2);

title(' Lagrange Polynome vom Grad 4')
xlabel('x') 
ylabel('f(x)')
legend({'Stützstellen','exakte Funktion f(x)','Polynom P4','erste Ableitung Polynom P4','exakte Funktion df(x)/dx'},'Location','northwest')
%% 
n=80;
x_node=linspace(0,4,81);
f_node=(x_node./(1+x_node)).^5;

x=0.6;
f_l80=LagrangePolynom(x,n,x_node,f_node);
f_dl80=LagrangeDerivPolynom(x,n,x_node,f_node);

x_bereich=linspace(0,4,100);
f_exakt=(x_bereich./(1+x_bereich)).^5;
f_dexat=(5*x_bereich.^4)./(1+x_bereich).^6;
f_poly=LagrangePolynom(x_bereich,n,x_node,f_node);
f_dpoly=LagrangeDerivPolynom(x_bereich,n,x_node,f_node);
hold on
grid on

plot(x_node,f_node,'k.','MarkerSize',25)
plot(x_bereich,f_exakt,'b-','LineWidth',3);
plot(x_bereich,f_poly,'r--.','LineWidth',2);
plot(x_bereich,f_dpoly,'g-','LineWidth',2);
plot(x_bereich,f_dexat,'y--','LineWidth',2);

xlim([0,4]);
ylim([-0.05,0.35]);
title(' Lagrange Polynome vom Grad 80')
xlabel('x') 
ylabel('f(x)')
legend({'Stützstellen','exakte Funktion f(x)','Polynom P80','erste Ableitung Polynom P80','exakte Funktion df(x)/dx'},'Location','northwest')
