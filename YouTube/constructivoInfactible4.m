%% combinación de los constructivos en el caso infactible 
%% sacar un producto por medio de un indice de sensibilidad (uno a la vez)


clear all
clc


c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
b=26;

%% se espera iniciar desde una solución infactible (mochila llena con todos
%% los productos) y empezar a retirar productos por medio de un indice


un=c./v;
U=[c' v' un'];
Orden=zeros(1,3);
i=0;
while U~=0  %% se hace mientras hallan productos que ordenar
% los productos que ingresen primero serán los que salgan primero de la
% mochila
%% producto debido al indice de sensibilidad costo/volumen 
i=i+1; 
[s,j]=min(U(:,3)); %ordenamiento debido al costo/volumen 
Orden(i,:)=U(j,:); % ingresar el producto con menor indice costo/volumen
U(j,:)=[];

%% producto debido al indice de sensibilidad volumen 

if U~=0              % para evitar errores cuando la matrix se vuelve cero 
i=i+1;               % ingresar siguiente producto
[s,j]=max(U(:,2));   % ordenamiento debido al volumen 
Orden(i,:)=U(j,:);   %ingresar el producto con mayor volumen
U(j,:)=[];
end

%% producto debido al indice de sensibilidad costo 

if U~=0              % para evitar errores cuando la matrix se vuelve cero 
i=i+1;               % ingresar siguiente producto
[s,j]=min(U(:,1));   % ordenamiento debido al costo
Orden(i,:)=U(j,:);   %sale el producto con menor costo
U(j,:)=[];
end

end

%% algoritmo para sacar productos de la mochila 
%% según como se organizó en la parte inicial se sacarán los primeros
%% productos (entender bien el código inicial)

x=ones(size(Orden,1),1);

i=1;
while b<= Orden(:,2)'*x

volumen=Orden(:,2)'*x
x(i,1)=0; 
i=i+1

end

volumen=Orden(:,2)'*x
costo=Orden(:,1)'*x