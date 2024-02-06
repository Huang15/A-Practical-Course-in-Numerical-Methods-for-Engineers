function x_num = lineintersection(P1,P2)
x1=P1(1);
y1=P1(2);
x2=P2(1);
y2=P2(2);
x_num =(2-y1)*(x2-x1)/(y2-y1)+x1; %%  Zweite Grade y=2,Erste Grade y-y1=(y2-y1)/(x2-x1) *(x-x1),
end