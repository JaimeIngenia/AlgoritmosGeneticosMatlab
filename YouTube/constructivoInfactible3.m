%% Mochila llena (solución infactible)

clear all
clc


c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
b=26;


%% se espera iniciar desde una solución infactible (mochila llena con todos
%% los productos) y empezar a retirar productos por medio de un indice

%% indice de sensibilidad será el costo/volumen
un=c./v;
U=[c' v' un'];
Orden=zeros(1,3);

for i=1:1:size(U,1); %ordenamiento debido al indice de sensibilidad 
[s,j]=max(U(:,3)); %ordenamiento debido al costo/volumen 
Orden(i,:)=U(j,:); %ordenamiento de mayor a menor
U(j,:)=[];
end

%% algoritmo para sacar productos de la mochila 

x=ones(size(Orden,1),1);

i=size(Orden,1);
while b<= Orden(:,2)'*x
volumen=Orden(:,2)'*x
x(i,1)=0; 
i=i-1  %% se sacan los productos de menor costo 

end

volumen=Orden(:,2)'*x
costo=Orden(:,1)'*x