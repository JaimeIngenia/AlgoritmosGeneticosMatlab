%% MUTACION 


function  [X,FO,In]=mutacion(X,pm,N,t,c,v,b)


 if rand <= pm    % decide si hace o no la mutación 
%      msgbox('se realizó mutación')
     a=floor((N-1)*rand+1);  % número aleatorio para escojer el descendiente a mutar 
     b=floor((t-1)*rand+1); 
     
     if X(a,b)==1   % si el descendiente (a) en el producto (b) es 1 entonces se coloca en cero, y si es cero se coloca en uno
     X(a,b)=0;
     else 
      X(a,b)=1;  
     end
         
     
     
 end

 for i=1:1:N
  
   FO(i,1)=X(i,:)*c';  % vector que representa el valor de la función objetivo
   In(i,1)=X(i,:)*v'-b;  % vector que representa el valor de la infactibilidad del punto 
   a=In<0;      % extrae los puntos que no son infactibles 
   In(a)=0;    % vuelve cero los puntos que no son infactibles
end
