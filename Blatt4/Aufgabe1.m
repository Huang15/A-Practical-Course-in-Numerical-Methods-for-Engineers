f=@(x)(x/(1+x))^5;
h=0.1;
x0=0.6;
df_2P=(f(x0+h)-f(x0))/h;
df_3PE=(-3*f(x0)+4*f(x0+h)-f(x0+2*h))/(2*h);
df_3PM=(f(x0+h)-f(x0-h))/(2*h);
df_5PM=(f(x0-2*h)-8*f(x0-h)+8*f(x0+h)-f(x0+2*h))/(12*h);
%% 
x0=0.6;x1=2.0;
h=logspace(0,-5,1000);
f=@(x)(x./(1+x)).^5;

df_ex=@(x)(5*x^4)/(1+x)^6;

df_2P=@(x)(f(x+h)-f(x))./h;
df_3PE=@(x)(-3*f(x)+4*f(x+h)-f(x+2*h))./(2*h);
df_3PM=@(x)(f(x+h)-f(x-h))./(2*h);
df_5PM=@(x)(f(x-2*h)-8*f(x-h)+8*f(x+h)-f(x+2*h))./(12*h);

diff2p_x0=abs(df_ex(x0)-df_2P(x0));
diff3PE_x0=abs(df_ex(x0)-df_3PE(x0));
diff3PM_x0=abs(df_ex(x0)-df_3PM(x0));
diff5PM_x0=abs(df_ex(x0)-df_5PM(x0));
figure
loglog(h,diff2p_x0);hold on
loglog(h,diff3PE_x0);loglog(h,diff3PM_x0);loglog(h,diff5PM_x0);
loglog(h,h);loglog(h,h.^2);loglog(h,h.^4);
legend("diff2p_x0",'diff3PE_x0','diff3PM_x0','diff5PM_x0','h','h^2','h^4')
hold off

diff2p_x1=abs(df_ex(x1)-df_2P(x1));
diff3PE_x1=abs(df_ex(x1)-df_3PE(x1));
diff3PM_x1=abs(df_ex(x1)-df_3PM(x1));
diff5PM_x1=abs(df_ex(x1)-df_5PM(x1));

figure
loglog(h,diff2p_x0);hold on
loglog(h,diff3PE_x0);loglog(h,diff3PM_x0);loglog(h,diff5PM_x0);
loglog(h,h);loglog(h,h.^2);loglog(h,h.^4);
legend("diff2p_x0",'diff3PE_x0','diff3PM_x0','diff5PM_x0','h','h^2','h^4')
hold off


