function [LHS,RHS] = AB2(timestep,M,B,C,sol)
if iscell(B) && iscell(sol)
    LHS=M;
    RHS=M*sol{1}+0.5*timestep*(3*(B{1}*sol{1}+C(1))-B{2}*sol{2}-C(2));
else
    LHS=M;
    RHS=M*sol(1)+0.5*timestep*(3*(B(1)*sol(1)+C(1))-B(2)*sol(2)-C(2));
end
end