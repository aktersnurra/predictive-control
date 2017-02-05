function [Dt,Et,bt]=myStageConstraints(A,B,D,cl,ch,ul,uh)

% your code goes here
    DA = D * A;
    DB = D * B;
    bt = [ch' -cl' uh' -ul']';
    
    m = size(DB, 2);
    I_m = eye(m);
    n = size(DA, 2);
    O = zeros(m, n);
    
    Dt = [DA; -DA; O; O];
    Et =[DB; -DB; I_m; -I_m]; 
    

end

