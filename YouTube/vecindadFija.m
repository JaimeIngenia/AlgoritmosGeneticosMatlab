%% Método de vecindad fija para el problema de la mochila 

clear all
clc

c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
b=26;

U=[c' v']; %organización de datos en una matriz

%% algoritmo (First improvement or Best improvement)

%% para algoritmo first improvement 
%% vecindad fija

Xbase=zeros(1,size(U,1))   % vector fila (Varía la base de solución)
XbaseV=zeros(1,size(U,1))  %vector fila (guarda la base de solución)

%cuantos vecinos tiene este problema (agregar un producto o sacar un
%producto)
    i=0;
    a=0;
while i <size(U,1)
     i=i+1;   %incrementar la variable 
    if a==1   % si a es igual a 1 quiere decir que la base de solucion se actualizo nuevamente 
       i=1; 
    end
    if Xbase(1,i)==1                     % cambiar el 1 en cero y el cero en 1
        Xbase(1,i)=0;
    else
        Xbase(1,i)=1;
    end
    i
    Xbase 
  if U(:,1)'*Xbase' < U(:,1)'*XbaseV'     % si la solución no mejora regresar al valor anterior 
    
        if Xbase(1,i)==1
            Xbase(1,i)=0;
        else
            Xbase(1,i)=1;
        end
        a=0;                        % la base no debe cambiar debido a que no se mejoró en la función objetivo
 
  
   else                              % si la solución mejora 
      if U(:,2)'*Xbase'> b          % si se viola la restricción de volumen se devuelve a la condición inicial
            if Xbase(1,i)==1
                 Xbase(1,i)=0;
            else
                Xbase(1,i)=1;
            end
      else
           XbaseV=Xbase;   % si se mejora entonces se cambia la base   
           a=1;            % entonces se debe reiniciar el conteo para barrer las vecindades 
      end

  end
    
end

Volumen=U(:,2)'*Xbase'
Costo=U(:,1)'*Xbase'
