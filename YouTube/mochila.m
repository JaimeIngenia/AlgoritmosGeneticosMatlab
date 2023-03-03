%% heurística constructiva 
%% Problema de la mochila 

c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];

b=26;


%% indice de sensibilidad costo 

D=[c;v]';
Orden=zeros(10,2);

for i=1:1:10; %ordenamiento debido al indice de sensibilidad 
[s,j]=max(D(:,1)); %ordenamiento debido al costo 
Orden(i,:)=D(j,:);
D(j,:)=[];
end

% agregar productos a la mochila 
x=zeros(10,1);
k=0; %agregador de productos en cada iteración  

while b> (Orden(:,2)'*x)  % comprueba la restricción de volumen 
k=k+1;

x(k,1)=1;
costo=Orden(:,1)'*x;
volumen=(Orden(:,2)'*x);

if(k==10)
    msgbox('se agregaron todos los productos')
end
end
x(k,1)=0;
costo=Orden(:,1)'*x         %mejor costo con este indice de sensibilidad
volumen=(Orden(:,2)'*x)     %mejor volumen con este indice de sensibilidad 
x'

%% indice de sensibilidad volumen

D=[c;v]';
Orden=zeros(10,2);

for i=1:1:10; %ordenamiento debido al indice de sensibilidad 
[s,j]=min(D(:,2)); %ordenamiento debido al volumen 
Orden(i,:)=D(j,:);
D(j,:)=[];
end

% agregar productos a la mochila 
x=zeros(10,1);
k=0; %agregador de productos en cada iteración  

while b> (Orden(:,2)'*x)  % comprueba la restricción de volumen 
k=k+1;

x(k,1)=1;
costo=Orden(:,1)'*x;
volumen=(Orden(:,2)'*x);

if(k==10)
    msgbox('se agregaron todos los productos')
end
end
x(k,1)=0;
costo=Orden(:,1)'*x         %mejor costo con este indice de sensibilidad
volumen=(Orden(:,2)'*x)     %mejor volumen con este indice de sensibilidad 
x'

%% indice de sensibilidad costo/volumen
e=c./v;               %hacer la división punto a punto 
D=[c;v;e]';
Orden=zeros(10,3);

for i=1:1:10; %ordenamiento debido al indice de sensibilidad 
[s,j]=max(D(:,3)); %ordenamiento debido al costo/volumen 
Orden(i,:)=D(j,:);
D(j,:)=[];
end

% agregar productos a la mochila 
x=zeros(10,1);
k=0; %agregador de productos en cada iteración  

while b> (Orden(:,2)'*x)  % comprueba la restricción de volumen 
k=k+1;

x(k,1)=1;
costo=Orden(:,1)'*x;
volumen=(Orden(:,2)'*x);

if(k==10)
    msgbox('se agregaron todos los productos')
end
end
x(k,1)=0;
costo=Orden(:,1)'*x         %mejor costo con este indice de sensibilidad
volumen=(Orden(:,2)'*x)     %mejor volumen con este indice de sensibilidad 
x'




%% indice de sensibilidad volumen/costo
e=v./c;               %hacer la división punto a punto 
D=[c;v;e]';
Orden=zeros(10,3);

for i=1:1:10; %ordenamiento debido al indice de sensibilidad 
[s,j]=min(D(:,3)); %ordenamiento debido al costo/volumen 
Orden(i,:)=D(j,:);
D(j,:)=[];
end

% agregar productos a la mochila 
x=zeros(10,1);
k=0; %agregador de productos en cada iteración  

while b> (Orden(:,2)'*x)  % comprueba la restricción de volumen 
k=k+1;

x(k,1)=1;
costo=Orden(:,1)'*x;
volumen=(Orden(:,2)'*x);

if(k==10)
    msgbox('se agregaron todos los productos')
end
end
x(k,1)=0;
costo=Orden(:,1)'*x         %mejor costo con este indice de sensibilidad
volumen=(Orden(:,2)'*x)     %mejor volumen con este indice de sensibilidad 
x'