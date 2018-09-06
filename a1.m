%assignment 1
clear all;
close all;
s0 = 14;

S(1) = s0;

K = 15;
r = 0.1;
sigma = 0.25;
T = 0.5;
gamma = 1;

dt = 0.001;

range = 0:dt:T;

for j = 1:1000
    S(j,1) = s0;
    V(j,1) = max(S(j,1) - K, 0);
   
    
    for i = 2:length(range)
        

        S(j,i) = S(j,i-1) + r*S(j,i-1)*dt + sigma*(S(j,i-1)^gamma)*randn()*sqrt(dt);
        
        V(j,i) = max(S(j,i)-K, 0);
    end

end

EqV = mean(V(:,end));

V0 = exp(-r*T) * EqV;

teachers=bsexact(sigma,r,K,T,s0);

