%% población diversa

% N=20;      % tamaño de la población
% t=10;      % numero de bits
% 
% k=1;       % diversidad de orden 1

function [X]=poblacion(N,t,k)
X=[];      % vector para la población
i=0;
while i<N
    i=i+1;
    X(i,:)=floor(rand(1,t)+0.5);   % genera un vector aleatorio binario
    
    if i~=1                     % si es diferente al primer individuo
      for a=1:1:i-1             % variable para comparar diversidad llega hasta i-1 (dado que i es el individuo que vamos a comparar)
          u=0;                  %variable para saber cuantos bits diferentes tienen los individuos
          for l=1:1:t           % variable que recorrerá todos los bits
              if X(i,l)==X(a,l)   % si el bit de los dos individuos es igual 
                  
              else
                  u=u+1;      % si los bits comparados son diferentes incrementa la variable
              end
          end
          
          if u<k         % si u es menor que k entonces los individuos son iguales (se debe rehacer)
              i=i-1;     % entonces se descuenta el hijo 
          end
          
      end  
    end
    
    
    
end
b=[];
for i=1:1:t
    b(1,i)=2^i;
end
a=[];
for i=1:1:N
   a(i,:)=X(i,:)*b'; 
    
end
c=[X a]