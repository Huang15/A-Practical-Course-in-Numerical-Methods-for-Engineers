function deriv = linquadderivref(xi,eta)
dN1_xi=-1/4*(1-eta);
dN1_eta=-1/4*(1-xi);
dN2_xi=1/4*(1-eta);
dN2_eta=-1/4*(1+xi);
dN3_xi=1/4*(1+eta);
dN3_eta=1/4*(1+xi);
dN4_xi=-1/4*(1+eta);
dN4_eta=1/4*(1-xi);

deriv=[dN1_xi,dN1_eta;dN2_xi,dN2_eta;dN3_xi,dN3_eta;dN4_xi,dN4_eta];
end