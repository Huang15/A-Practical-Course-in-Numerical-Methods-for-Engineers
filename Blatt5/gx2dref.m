function gaussx = gx2dref(n)
    [a,b]=meshgrid(gx(n)',gx(n));
    [gaussx(:,1),gaussx(:,2)]=deal(reshape(a,[],1),reshape(b,[],1));
end