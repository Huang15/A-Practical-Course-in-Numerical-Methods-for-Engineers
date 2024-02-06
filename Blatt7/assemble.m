function [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele)

for i =1:4
    rhs(ele(i))=rhs(ele(i))+elevec(i);
    for j=1:4
        sysmat(ele(i),ele(j))=sysmat(ele(i),ele(j))+elemat(i,j);       
    end
end
end