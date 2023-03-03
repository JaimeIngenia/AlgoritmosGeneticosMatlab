%% población inicial para algoritmo genético

%% el 10 o 20 % de la poblacion debe estar basado en heurísticas (buenos
%% puntos iniciales)



function [X,FO,In]=poblacion(c,v,b,N,t)

%c=vector de costo
%v=vector de volumen
%b=restriccion de volumen
%N=tamaño de la población
%t=número de productos


%% el número de la población creada debe ser constante en todas las iteraciones

%% Cuantos deben estar en la población inicial?
%% en este código la población será de 20 (pero la población ideal depende del problema a tratar)

% se generarán 3 individuos con heurísticas (buenos puntos) 20% de la
% población

X=zeros(N,t);  %matriz con población inicial 
FO=zeros(N,1);  %vector de la función objetivo del problema
In=zeros(N,1);  %vector que representa la infactibilidad del punto 

%% tres puntos dados por las heuristicas aplicadas al principio (se debe
%% modificar para hacer las heuristicas como funciones)
X(N,:)=[0 1 1 1 1 1 0 0 1 0]; % heuristica constructiva basada en volumen (ingresar productos con el menor volumen)
X(N-1,:)=[0 0 0 0 0 0 1 0 1 1]; % heuristica constructiva basada en costo (ingresar productos con el mayor costo)
X(N-2,:)=[0 1 1 1 1 0 1 0 0 0]; % ingresar un producto con respecto al mejor costo volumen, otro al volumen y otro al costo 


for i=1:1:N   % este for generará los 17 individuos restantes
   a=0;        % reiniciar la variable a la cual va a contar las casillas aleatorias llenadas
   if i<=N-3  % para las primeras 17 casillas
   while a<=1+floor((t-1)*rand) % se define cuantas casillas se llenarán en el individuo  
    a=a+1;            % incrementando la variable a que llenará el vector 
    p=1+floor((t-1)*rand); % número aleatorio que define que producto que entra en el vector solución
   if X(i,p)==0  % si la casilla a llenar es realmente 0 (se asegura no ingresar un producto nuevamente 
       
    X(i,p)=1;  % poner casilla en 1 
   else  % si no 
    a=a-1;   % descontar una casilla en la variable a (debido a que en esa casilla ya se habia puesto un 1 )
   end
       
   end
   end
   FO(i,1)=X(i,:)*c';  % vector que representa el valor de la función objetivo
   In(i,1)=X(i,:)*v'-b;  % vector que representa el valor de la infactibilidad del punto 
   a=In<0;      % extrae los puntos que no son infactibles 
   In(a)=0;    % vuelve cero los puntos que no son infactibles
end




