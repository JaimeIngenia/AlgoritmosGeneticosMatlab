%% Funci�n principal de algoritmos gen�ticos 
clc
clear all

c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
Inc=0; % incumbente
b=26;
N=20;                      % tama�o de la poblaci�n inicial % debe ser un n�mero par para cumplir con la recombinaci�n (los valores t�picos recomendados [30-200])
t=size(c,2);               % n�mero de productos  

pr=0.9;              % probabilidad de recombinaci�n (valores t�picos recomendados  [0.5 - 1.0])
pm=0.005;             % probabilidad de Mutacion  (valores t�picos recomendados  [0.001 - 0.050])

[X,FO,In]=poblacion(c,v,b,N,t);   % se crea la poblaci�n inicial (lo ideal ser�a aleatoria controlada)
l=1; % mientras sea igual a uno se itera 
a=0;
r=0;
iter=0;
alpha=0;
while l==1

alpha=alpha+0.15;     % factor de penalizacion para los puntos infactibles en la selecci�n (se recomienda empezar en valores bajos y aumentar paulatinamente)

[des,X,FO,In,N,t,c,b] =seleccion4(X,FO,In,c,b,N,t,alpha);   % se usa el algoritmo de selecci�n por torneo 

[X,FO,In]=recombinacion(des,X,FO,In,N,t,c,v,b,pr);  % se usa el proceso de recombinaci�n (single point crossover)

[X,FO,In]=mutacion(X,pm,N,t,c,v,b);  % se hace el proceso de mutaci�n (este proceso es aleatorio y altamente improbable)

%% incumbente

 for i=1:1:N   % recorrer todos el vector FO, e In
   if In(i,1)==0   % si la infactibilidad es cero 
       a=FO(i,1);   % entonces se guarda la funci�n objetivo en a
     if Inc < a    % la incumbente es menor que a 
        Inc=a;     % volver la incumbente igual a la variable a
        x=X(i,:);  % se guardan los datos de la incumbente (cromosoma)
     end
    
   end
 end
  if a==Inc   % si la Inc es igual a la variable a (no se mejoro la incumbente en esta generacion 
         r=r+1;   % incrementar la variable para finalizar el bucle (por el no mejoramiento de la incumbente)
        
         if r ==10             % si la incumbente no mejora por 10 iteraciones 
             msgbox('la incumbente no mejora')
            l=0;
         end
  end
  if iter==100
     l=0; 
  end
  iter=iter+1;   % cuenta el n�mero de iteraciones del AG
  
 
end
 