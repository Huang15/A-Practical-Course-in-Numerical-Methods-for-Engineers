delta=logspace(-20,5,1000);%%wenn Verteilung mehr als 10000,zum beispiel 100000,es gibt Rechnung fehler
Xex=2-1;%%analytische exakte Linie y=x+1
P1=[0.0;1.0];
P2=[delta;1.0+delta];

Xnum=zeros(size(delta,2),1);

for i=1:size(delta,2)
Xnum(i)=lineintersection(P1,P2(:,i));
end
loglog(delta,abs(Xex-Xnum));
