function [dbcsysmat,dbcrhs] = assignDBC_nlin(sysmat,rhs, dbc)
for i =1:size(dbc,1)  
    sysmat(dbc(i,1),:)=0;
    sysmat(dbc(i,1),dbc(i,1))=1;
    rhs(dbc(i))=0;

end
dbcsysmat=sysmat;
dbcrhs=rhs;

end