function [sysmat,rhs] = assignDBC(sysmat,rhs,dbc)
for i =1:size(dbc,1)  
    sysmat(dbc(i,1),:)=0;
    sysmat(dbc(i,1),dbc(i,1))=1;
    rhs(dbc(i))=dbc(i,2);

end
end
