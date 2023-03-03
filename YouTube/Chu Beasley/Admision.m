%% Admisión del nuevo hijo

function [v]=Admision(FO,FOH,N,t,H1,X,k)

v=2;
if FOH>min(FO)
v=0;
a=0;

for i=1:N
    
    for j=1:t
        
        if H1(1,j)~=X(i,j)
            
           a=a+1; 
    
        end
       
       
         
    end
         if a>=k
           
                a=0;
         
         else
                v=1;
                break
                
         end
             
    end
    
end



