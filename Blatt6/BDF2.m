function [LHS,RHS] = BDF2(timestep,M,B,C,sol)
if iscell(sol)
    LHS=3/2*M-timestep*B;
    RHS=2*M*sol{1}-1/2*M*sol{2}+timestep*C;
else
    LHS=3/2*M-timestep*B;
    RHS=2*M*sol(1)-1/2*M*sol(2)+timestep*C;
end
end