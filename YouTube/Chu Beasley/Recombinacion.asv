%% Recombinación


function [H]=Recombinacion(P1,P2,pc,t)



a=rand; %Probabilidad de recombinacion

if pc>a
    
    W=randi(t,1); %Punto de cruce
    H=[P1(1,1:W) P2(1,W+1:t)];

else
    
    H=P1; %Hijo
    
end   
