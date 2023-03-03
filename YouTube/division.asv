%% heurística constructiva 
%% Problema de la mochila 
%%  división 
clear all
clc


c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
b=26;


%% división de la mochila 
% se dividirá en dos mochilas más pequeñas ( de que tamaño deberian ser?)
% (cuantos productos deberian tener? ) buscar bin packing 

%% se dividirá la mochila en dos submochilas de la mitad del espacio de la
%% mochila grande y los productos 

bres=b/2;        %   volumen el cual será la nueva restricción de los dos volumenes
Ua=[c',v'];       %   se organizan los vectores costo y volumen en una matriz (productos para la mochila 1)
Ub=zeros(1,2);   %   matriz que se llenará con los productos para llenar la segunda mochila 

for i=1:1:(size(c',1)/2)  % se dividiran los productos por la mitad 
    
    d=floor((size(Ua,1)-1)*rand)+1;  % se escojen aleatoriamente los productos (RAND)
    
    Ub(i,:)=Ua(d,:); % se llena la matriz para tener aleatoriamente los productos 
    Ua(d,:)=[];   % se borran los productos debido a que estos fueron seleccionados para la mochila 2
end


%% algoritmo para llenar la mochila 1 
%% el índice de sensibilidad será el costo 

OrdenA=zeros(1,2);

for i=1:1:(size(c',1)/2)      %ordenamiento debido al indice de sensibilidad 
[s,j]=max(Ua(:,1));           %ordenamiento debido al costo 
OrdenA(i,:)=Ua(j,:);          % el valor más grande se guarda en la matriz Ordenada respecto al indice de sensibilidad
Ua(j,:)=[];                   % borrar la fila de la matriz desordenada 
end


%% llenar la mochila 1 con cada producto puesto en la matriz ordenada con
%% respecto al indice de sensibilidad

x1=zeros((size(c',1)/2),1);             % variable que indica si el producto entra o está fuera de la mochila
k1=0;                                   % agregador de productos
while k1< size(c',1)/2                 % recorrer todos los productos    
 k1=k1+1;                              % agregar un nuevo producto 
x1(k1,1)=1;                              % se agrega un producto

if bres < OrdenA(:,2)'*x1                 % si al agregar el proximo producto excede el volumen, entonces que lo elimine
x1(k1,1)=0; 
end
end

costo1=OrdenA(:,1)'*x1;
volumen1=OrdenA(:,2)'*x1;



%% algoritmo para llenar la mochila 2
%% el índice de sensibilidad será el costo/volumen 
Ub=[Ub Ub(:,1)./Ub(:,2)];  % se coloca la tercera fila como el indice de sensibilidad
OrdenB=zeros(1,3);

for i=1:1:(size(c',1)/2)      %ordenamiento debido al indice de sensibilidad 
[s,j]=max(Ub(:,3));           %ordenamiento debido al costo/ volumen 
OrdenB(i,:)=Ub(j,:);          % el valor más grande se guarda en la matriz Ordenada respecto al indice de sensibilidad
Ub(j,:)=[];                   % borrar la fila de la matriz desordenada 
end



%% llenar la mochila 2 con cada producto puesto en la matriz ordenada con
%% respecto al indice de sensibilidad

x2=zeros((size(c',1)/2),1);             % variable que indica si el producto entra o está fuera de la mochila
k2=0;                                  % agregador de productos
while k2< size(c',1)/2                 % recorrer todos los productos    
 k2=k2+1;                              % agregar un nuevo producto 
x2(k2,1)=1;                              % se agrega un producto

if bres < OrdenB(:,2)'*x2                 % si al agregar el proximo producto excede el volumen, entonces que lo elimine
x2(k2,1)=0; 
end
end

costo2=OrdenB(:,1)'*x2;
volumen2=OrdenB(:,2)'*x2;

TotalCosto=costo1+costo2
totalVolumen=volumen1+volumen2