f=@(x)(x/(1+x))^5;
a=0;b=4;
I_exakt = 0.55654377116283;
%Mittelpunktregel
I_mittel=(b-a)*f((a+b)/2);
diff_mittel=I_exakt-I_mittel;
%Trapezregel
I_Trape=(b-a)*(f(a)+f(b))/2;
diff_Trape=I_exakt-I_Trape;
%test gx gw
test_gx=gx(3);
test_gw=gw(3);
%Transformation
f_t=@(e)2*((2*e+2)./(2*e+2+1)).^5;
%Gauß-Quadratur mit einer Stützstelle
I_g1=gw(1)*f_t(gx(1));
diff_g1=I_exakt-I_g1;
%Gauß-Quadratur mit zwei Stützstellen
I_g2=sum(gw(2).*f_t(gx(2)));
diff_g2=I_exakt-I_g2;
%Gauß-Quadratur mit drei Stützstellen
I_g3=sum(gw(3).*f_t(gx(3)));
diff_g3=I_exakt-I_g3;