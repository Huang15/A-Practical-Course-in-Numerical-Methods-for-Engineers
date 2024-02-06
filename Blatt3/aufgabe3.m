N0_0=linquadref(0,0);
N0577_0577=linquadref(0.577,-0.577);
Nd0_0=linquadderivref_syms(0,0);
Nd0577_0577=linquadderivref(0.577,-0.577);

y=[0 1 3 1];
f0_0=dot(N0_0,y); % y*N0_0
f0577_0577=dot(N0577_0577,y);
fd0_0=y*Nd0_0;
fd0577_0577=y*Nd0577_0577;
