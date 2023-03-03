%% selección 



[X,FO,In]=poblacion(c,v,b,N,t)   % se ingresan los datos de los productos y restricción 

alpha=4;     % factor de penalizacion para los puntos infactibles  
%% crear la función  de adaptabilidad 
Fadap=FO-alpha*In;

%% comparación    %
% Fadap1=FO-0.5*In;
% Fadap2=FO-1*In;
% Fadap3=FO-3*In;
% 
% Ndes1=Fadap1/(sum(Fadap1)/N);
% Ndes2=Fadap2/(sum(Fadap2)/N);
% Ndes3=Fadap3/(sum(Fadap3)/N);
% 
% comp=[Fadap1,Fadap2,Fadap3]
% comp1=[Ndes1,Ndes2,Ndes3]
%%

Ndes=Fadap/(sum(Fadap)/N); % número de descendientes para cada padre  

des=floor(Ndes);    % vector con el número de descendientes (parte entera) 
res=Ndes-des ;      % valores restantes para distribuir en los padres (parte decimal)

for j=sum(des):1:N-1  % un for que va desde el numero de descendientes asignados (parte entera) hasta el numero que debe cumplir la poblacion 

[v,i]=max(res);   % se escoje el mayor residuo y extrae su posicion(i) 
des(i,1)=des(i,1)+1; % se suma en la posición i un nuevo hijo 
res(i,1)=0;  % se iguala la casilla res a cero para que no tenga oportunidad de tener un nuevo hijo 

end

des
