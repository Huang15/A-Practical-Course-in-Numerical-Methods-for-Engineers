function x = solveGauss(A,b)
m=size(A,1);
n=size(A,2);
Ab=[A b];
for j =1:n-1 %%j是列
    for i=j+1:m
        Ab(i,:)=Ab(i,:)-Ab(i,j)/Ab(j,j)*Ab(j,:);
    end
end
 
for k=n:-1:2
    for l=k-1:-1:1
        Ab(l,:)=Ab(l,:)-Ab(l,k)/Ab(k,k)*Ab(k,:);
    end
end
x=zeros(n,1);
for i =1:n
    x(i,1)=Ab(i,n+1)/Ab(i,i);
end


end