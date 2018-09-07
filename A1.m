%-------------------------------------------%
%---Assignment 1 of Computational Finance---%
%-------------------------------------------%

clear all;
close all;

%% setting parameters

s0 = 14; 
K = 15;
r = 0.1;
sigma = 0.25;
T = 0.5;
gamma = 1;
num_t=1000; %number of time steps
M=1000; %number of sample paths


dt=T/num_t;
range = 0:dt:T;

%% MC simulation
for j = 1:M
    S(j,1) = s0;
    V(j,1) = max(S(j,1) - K, 0);
   
    

    for i = 2:num_t+1
        

        S(j,i) = S(j,i-1) + r*S(j,i-1)*dt + sigma*(S(j,i-1)^gamma)*randn()*sqrt(dt);
        
        V(j,i) = max(S(j,i)-K, 0);
    end

end

EqV = mean(V);
V0 = exp(-r*T) * EqV;

%% calculate exact solution
for i = 1:num_t+1
    
    bigT = range(i);%T-range(i); 
    
    teachers(i)=bsexact(sigma, r, K, bigT, s0);
    
end

%% plot result
plot(V0)
hold on
plot(teachers)