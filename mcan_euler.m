function [err2,errn,V] = mcan_euler(sigma, r, s0, K, gamma, np, T, n, rsol)
% dt = time interval size
% T = final time 
% n = time of monte carlo simulation 
% default we set to run 10 times of MC 
% rsol = real analytical solution

S(1) = s0;


dt = T/np;
range = linspace(0,T,np);


    
    for j = 1:n
        S(j) = s0;
        S2(j) = s0;
        


        for i = 2:length(range)
            
            my_ran = randn();


            S(j) = S(j) + r*S(j)*dt + sigma*(S(j)^gamma)*my_ran*sqrt(dt);
            S2(j) = S2(j) + r*S2(j)*dt - sigma*(S2(j)^gamma)*my_ran*sqrt(dt);


            
        end
        
        V(j) = max(S(j)-K, 0);
        V2(j) = max(S2(j)-K, 0);



    end

    EqV = mean(V);
    EqV2 = mean(V2);
    

    V0 = exp(-r*T) * EqV;
    V02 = exp(-r*T) * EqV2;
    
    V = 0.5*(V0+V02);

    errn = abs(rsol - V0);
    err2 = abs(rsol - V);


end
