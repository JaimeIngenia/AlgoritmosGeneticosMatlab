%% heurística constructiva 
%% Problema de la mochila 
%% descomposición y división 

c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
b=26;


%% indicador de sensibilidad el costo del producto 

cd=c/max(c);     %normalización del indicador de sensibilidad 
U=[c',v',cd']
k1=0;
k2=0;
k3=0;
atractivos=zeros(1,3);   % categorias de los productos 
medianamente=zeros(1,3);
poco=zeros(1,3);

while size(U,1)>=1     % ciclo para descomposición en tres categorias 
             
    if U(1,3)>0.9
    k1=k1+1;                   %indice para llenar uno a uno las casillas de los productos 
    atractivos(k1,:)=U(1,:);
    U(1,:)=[];
    end
    
    if size(U,1)~=0  %% para evitar error cuando se vacia la matriz U
        
    if (U(1,3)>=0.4 && U(1,3)<=0.9)
    k2=k2+1;   
    medianamente(k2,:)=U(1,:);
    U(1,:)=[];
    end
    end
     
    if size(U,1)~=0
    if U(1,3) < 0.4
    k3=k3+1;    
    poco(k3,:)=U(1,:);
    U(1,:)=[];
    end
    end
   
    
end

bnuevo=b-sum(atractivos(:,2));  %% nuevo valor de las restricción para el volumen, se espera correr un método exacto 

%% por un método exacto se corre  el nuevo problema que es encontrar el
%% mayor costo de la mochila con los productos puestos en el vector llamado medianamente

x=zeros(size(medianamente,1),1);
  
i=0;
    
while bnuevo>=medianamente(:,2)'*x   
    i=i+1;
    x(1,i)=1;
    
    
end

x(1,i)=0;
medianamente(:,2)'*x   
    

    
    
    

