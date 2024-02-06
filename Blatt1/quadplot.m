function quadplot(nodes,elements,sol)
x=nodes(:,1);
y=nodes(:,2);
z=sol;
elements1=[elements elements(:,1)];
% T=zeros(size(elements,1)*2,3);
% T(1:2:end,:)=elements1(:,1:3);
% T(2:2:end,:)=elements1(:,3:5);
T=[elements1(:,1:3);elements1(:,3:5)];

trisurf(T,x,y,z,'FaceColor', 'interp','EdgeColor', 'white');
colormap(hot);
xlabel('x'); 
ylabel('y'); 
zlabel('T(x,y)');
end