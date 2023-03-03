%% Método de vecindad fija para el problema de la mochila 

clear all
clc

c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
b=26;

U=[c' v']; %organización de datos en una matriz

%% algoritmo (First improvement or Best improvement)

%% para algoritmo first improvement 
%% vecindad fija  (cambio de dos productos a la vez)

Xbase=zeros(1,size(U,1))   % vector fila (Varía la base de solución)
XbaseV=zeros(1,size(U,1))  %vector fila (guarda la base de solución)

%cuantos vecinos tiene este problema (agregar dos producto o sacar dos
%productos, sacar y agregar uno)
    i=0;
    j=0;
    a=0;
    XbaseV=Xbase;
while i <size(U,1)
     
    
    i=i+1   %incrementar la variable fija
     j=0;   % reiniciar la variable cambiante 
     
         if Xbase(1,i)== 0   % colocar la casilla de la variable fija en 1 o 0 
              Xbase(1,i)=1;
         else
              Xbase(1,i)=0;
         end
     
    while j <size(U,1)
       j=j+1   %incrementar la variable cambiante
       
        if   i~=j   % si no se encuentra la variable fija y la variable cambiante en el mismo espacio  
         
            if Xbase(1,j)== 0    % colocar la casilla de la variable cambiante en 1 o 0 
                 Xbase(1,j)=1;
            else
                  Xbase(1,j)=0;
            end
   Xbase
     if U(:,1)'*Xbase' < U(:,1)'*XbaseV'     % si la solución no mejora regresar al valor anterior 
    
        if Xbase(1,j)==1
            Xbase(1,j)=0;
        else
            Xbase(1,j)=1;
        end
%         a=0;                        % la base no debe cambiar debido a que no se mejoró en la función objetivo
 
  
     else                              % si la solución mejora 
        if U(:,2)'*Xbase'> b          % si se viola la restricción de volumen se devuelve a la condición inicial
                if Xbase(1,j)==1
                     Xbase(1,j)=0;
                else
                     Xbase(1,j)=1;
                end
        else
               XbaseV=Xbase;   % si se mejora entonces se cambia la base   
%                a=1;            % entonces se debe reiniciar el conteo para barrer las vecindades 
        i=0;
        j=size(U,1);
        end
         
         
     end
        
        
    end
    end
end

Volumen=U(:,2)'*Xbase'
Costo=U(:,1)'*Xbase'
