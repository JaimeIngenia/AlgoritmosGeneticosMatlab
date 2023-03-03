%% heur�stica constructiva 
%% Problema de la mochila 
%% descomposici�n 
clear all
clc


c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
b=26;
cSv=c./v;

%% indicador de sensibilidad el costo/volumen del producto 

cd=cSv/max(cSv);     %normalizaci�n del indicador de sensibilidad 
U=[c',v',cd']
k1=0;
k2=0;
k3=0;
atractivos=zeros(1,3);   % categorias de los productos 
medianamente=zeros(1,3);
poco=zeros(1,3);

while size(U,1)>=1     % ciclo para descomposici�n en tres categorias 
             
    if U(1,3)>0.9             % los valores para la division de los productos debe ser modificado para cada problema
    k1=k1+1;                   %indice para llenar uno a uno las casillas de los productos 
    atractivos(k1,:)=U(1,:);
    U(1,:)=[];
    end
    
    if size(U,1)~=0  %% para evitar error cuando se vacia la matriz U
        
    if (U(1,3)>=0.3 && U(1,3)<=0.9)
    k2=k2+1;   
    medianamente(k2,:)=U(1,:);
    U(1,:)=[];
    end
    end
     
    if size(U,1)~=0
    if U(1,3) < 0.3
    k3=k3+1;    
    poco(k3,:)=U(1,:);
    U(1,:)=[];
    end
    end
   
    
end

bnuevo=b-sum(atractivos(:,2));  %% nuevo valor de las restricci�n para el volumen, se espera correr un m�todo exacto 

%% por un m�todo exacto se corre  el nuevo problema que es encontrar el
%% mayor costo de la mochila con los productos puestos en el vector llamado medianamente

%% primera fase se determinan los primeros productos a la mochila
%% indice de sensibilidad es el volumen

x=zeros(size(medianamente,1),1);  % vector que define que productos entran en la mochila
xnuevos=zeros((size(medianamente,1)),(size(medianamente,1))); % almacenador de datos X 
volumen=zeros((size(medianamente,1)),1);     % almacenador de productos 

k=0; % contador de espacios que cumplen con las restricci�n 
j=0; % contador de evaluaciones hechas (cumplan o no, con la restricci�n)
for i=1:1:6      %fija     el digito del vector 
    x(i,1)=1;
for a=1:1:6         % barre todos digitos del vector 

    if a~=i         % cuando la posici�n a barrer y la fija son iguales no hace el proceso
    x(a,1)=1;
 if bnuevo>= medianamente(:,2)'*x % si la restricci�n se cumple entonces almacena los datos del vector
     k=k+1;                       % aumenta el contador de los datos que cumplen con la restricci�n 
     xnuevos(k,:)=x';              %almacena el vector solucion que cumple a�n con la restricci�n
     volumen(k,1)=medianamente(:,2)'*x;  %almacena el dato de volumen 
 end
 j=j+1;                            %aumenta el contador de iteraciones 
    x(a,1)=0;                     % elimina el digito puesto debido a que ya se guard� en una memoria
    end
end
 x(i,1)=0;                       %elimina el valor fijo debido a que se encuentra en una memoria y se debe colocar otro valor fijo
end
    
  xnuevos;
  volumen;
%% segunda fase se hace otra busqueda mirando si pueden entrar mas
%% productos

xnew=zeros((size(medianamente,1)),(size(medianamente,1)));  % se genera un nuevo espacio de soluci�n mucho mas cercano a la restricci�n
volumenNew=zeros((size(medianamente,1)),1);          % vector para guardar los datos nuevos de volumen 
k=0;                                               % contador para guardar los nuevos valores 

for i=1:1:size(volumen(:,1),1)                 % recorrer� el vector de volumenes encontrado en la iteraci�n anterior
    
    if bnuevo-min(medianamente(:,2)) >= volumen(i,1)  % solo analizar� las restricciones que pueden mejorar (bnuevo-min ) analiza solo los datos que pueden mejorar
         k=k+1;                          % guarda los datos que mejoran 
        xnew(k,:)=xnuevos(i,:);         %se guarda el vector solucion anterior para ser manejado
        
        for j=1:1:size(medianamente,1)    % recorre las casillas del vector solucion para aumentar un producto
        
            if xnew(k,j)==0         % si el producto no se encuentra dentro de la mochila 
               xnew(k,j)=1;         % se  ingresa en la mochila 
            if medianamente(:,2)'*xnew(k,:)'>bnuevo      % si se supera la restricci�n
               xnew(k,j)=0;    % se saca el producto debido a que supera la restricci�n 
            end
           
            end
         end
        volumenNew(k,1)=medianamente(:,2)'*xnew(k,:)'; % se guardan los nuevos valores de volumen (mejores que los anteriores)
    end
    
end
    

Svolum=[volumen;volumenNew];  % se genera un vector total con la fase 1 y la fase 2 de soluciones 
Sx=[xnuevos ;xnew];                  % se genera una matriz con las X soluciones de la fase 1 y 2 

Sc=zeros(size(Sx,1),1);   % se crea el vector que guardar� el costo 

for i=1:1:size(Sx,1)     %algoritmo para llenar el vector de costo
    
    Sc(i,1)=medianamente(:,1)'*Sx(i,:)';   % se llena casilla a casilla con la multiplicaci�n de los vectores
    
end
S=[Sc Svolum];    % se organizan los valores de costo y volumen para verlos f�cilmente 

[a i]=max(Sc);     % se extrae la informacion del m�ximo costo para dar los resultados finales 

costoFinal=sum(atractivos(:,1))+Sc(i,1)
volumenFinal=sum(atractivos(:,2))+Svolum(i,1)
    