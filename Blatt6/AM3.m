function [LHS,RHS] = AM3(timestep,M,B,C,sol)
if iscell(B) && iscell(sol)
    LHS =  M-5/12*timestep*B{1};
    RHS=5/12*timestep*C(1)+(8/12*timestep*B{2}+M)*sol{1}+8/12*timestep*C(2)-timestep/12*(B{3}*sol{2}+C(3));
else
    LHS =  M-5/12*timestep*B(1);
    RHS=5/12*timestep*C(1)+(8/12*timestep*B(2)+M)*sol(1)+8/12*timestep*C(2)-timestep/12*(B(3)*sol(2)+C(3));
end
end