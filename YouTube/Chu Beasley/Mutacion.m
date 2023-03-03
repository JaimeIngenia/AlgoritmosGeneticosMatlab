%% Mutación


function [H1]=Mutacion(H,t,pm)

for i=1:t    % se pregunta Gen a Gen 
   a=rand;
   
   if a<pm 
       if H(1,i)==1
          H(1,i)=0; 
       else
          H(1,i)=1; 
       end
   end
    
    
end

H1=H;