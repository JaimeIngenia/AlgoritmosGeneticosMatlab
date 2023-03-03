%% Selección

function [P1 P2 FO]=Seleccion(X,N,y,u,T,t,a)

    %selección aleatoria de elementos para el torneo
    for i=1:T
        C1(i,1)=randi(N,1);
        
    end
            
    Tor=X(C1,:); %Matriz de elementos en el torneo
    

    
    %Vector de peso       
    for i=0:1:t-1
          BIN(1,i+1)=2^i;
    end
           
            
    Tor1=(Tor*BIN')/100;  %Vector de elementos en el torneo
            
    
    %Evaluar en funcion objetivo
    for j=1:T
        
          b=Tor1(j,1);
          M=y(end)-0.4*y(end-1)-b*u(end-1);  
          FO1(j,1)=abs(1/M);            
    
    end
    
%          [fila1, col]=find(FO1==max(FO1));
         [dato, fila1]=max(FO1);
         P1=Tor(fila1,:);
         
         FO1(fila1,1)=0;
         
         [dato, fila1]=max(FO1);
         
         P2=Tor(fila1,:);
         
         
%% se calcula la función objetivo para todos los individuos de la población         
   for j=1:N   
        
          b=a(j,1);
          M=y(end)-0.4*y(end-1)-b*u(end-1);  
          FO(j,1)=abs(1/M);            
    
    end
        