%% heurística constructiva 
%% Problema de la mochila 
%% descomposición 

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
             
    if U(1,3)>0.8
    k1=k1+1;                   %indice para llenar uno a uno las casillas de los productos 
    atractivos(k1,:)=U(1,:);
    U(1,:)=[];
    end
    
    if size(U,1)~=0  %% para evitar error cuando se vacia la matriz U
        
    if (U(1,3)>=0.4 && U(1,3)<=0.8)
    k2=k2+1;   
    medianamente(k2,:)=U(1,:);
    U(1,:)=[];
    end
    
    if U(1,3) < 0.4
    k3=k3+1;    
    poco(k3,:)=U(1,:);
    U(1,:)=[];
    end
    
    end
    
end

% sum(atractivos(:,1))
% sum(atractivos(:,2))


