function [X]=mejoriaLocal(v,FO,H1,BIN,y,u,N,t,X,k)

 if v<=1  % si es mayor a 1 entonces no se ingresa al hijo
   if v==1  
     %% se aplica una heur�stica constructiva 
     while v==1
       i=0;
       
       while i<t
         i=i+1;
         
         if H1(1,i)==1  % variar bit para encontrar mejor soluci�n
           H1(1,i)=0;
         else
           H1(1,i)=1;
         end
         
         [FOH]=Hadap(BIN,H1,y,u); % extraer nueva funci�n objetivo de hijo 
         
         
         [v]=Admision(FO,FOH,N,t,H1,X,k);  % mirar si el nuevo hijo cumple con diversidad 
         
         if v <= 1    % no cumple con el mejoramiento de la funci�n objetivo
             if v==1  % no cumple con el criterio de diversidad 
                 
             else     % cumple con el criterio de diversidad 
              [valor,fila]=min(FO);
              X(fila,:)=H1; % reemplazar al padre con el hijo
              break
             end
         end
         
       end
         v=0;  % salir del ciclo dado que termin� el proceso heuristico
     end
     
   else
     %% ingreso de hijo directamente
     [valor,fila]=min(FO);
     X(fila,:)=H1;
   end
 end