%% Mochila llena (soluci�n infactible)

clear all
clc


c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
b=26;


%% se espera iniciar desde una soluci�n infactible (mochila llena con todos
%% los productos) y empezar a retirar productos por medio de un indice

%% indice de sensibilidad ser� el volumen 

U=[c' v'];
Orden=zeros(1,2);

for i=1:1:size(U,1); %ordenamiento debido al indice de sensibilidad 
[s,j]=min(U(:,2)); %ordenamiento debido al volumen 
Orden(i,:)=U(j,:);
U(j,:)=[];
end

%% algoritmo para sacar productos de la mochila 

x=ones(size(Orden,1),1);

i=size(Orden,1);
while b<= Orden(:,2)'*x

volumen=Orden(:,2)'*x
x(i,1)=0;
i=i-1

end

volumen=Orden(:,2)'*x
costo=Orden(:,1)'*x