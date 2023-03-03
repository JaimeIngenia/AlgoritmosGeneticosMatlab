%% GRASP 
clear all
clc

c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];
b=26;
Elite=[]; % vector que guarda las soluciones elite 
%% tiene 3 fases (preprocesamiento, constructiva, búsqueda local)

for k=1:1:30    % se guardarán 10 soluciones elites
%% fase de preprocesamiento 

I=[c./v; 1:1:10]  % primera fila indice de sensibilidad, segunda fila posición del producto
% se identifican el esquema de alta calidad y será X
X=[0 0 1 0 0 0 0 0 0 0]; % esquema de alta calidad
I(:,3)=[]; % se elimina el producto que pertenece el esquema de alta calidad 

%% fase constructiva (el índice de sensibilidad es costo/volumen)

alpha=0.7;   % valor para la creacion LRC
LRC=[]
while b >= v*X'     % con esta condición se lleva al limite de la infactibilidad 
    Xv=X;          % guarda el vector para el límite de la factibilidad
    
valor=max(I(1,:))-alpha*(max(I(1,:))-min(I(1,:))); % índice para los productos en la LRC 

a=I(1,:)>=valor;   % obtiene los indices que sean mayores al Valor de los LRC
LRC=I(:,a);     % se guarda en el vector LRC la lista de candidatos

N=floor(size(LRC,2)*rand+1); % se escoje aleatoriamente un producto de la LRC  

X(1,LRC(2,N))=1;   % se agrega ese producto al vector X el producto

a=I(2,:)==LRC(2,N);  % se busca que coincidan los indices  
I(:,a)=[];     % se eliminan de los productos 


LRC(:,N)=[];  % se elimina de la LRC el producto agregado 

end

%% fase de búsqueda (metodología first improvement)

i=0;   % se inicializa el contador que cambiará la vecindad (ingresa o saca un producto a la vez)

Xp=X;  % se trabajará con la variable Xp (dado que se puede trabajar en el limite de la factibilidad con Xv y en el de la infactibilidad con X)

while i<size(c,2)
    Xpv=Xp  % guardar una vector de desicion anterior para poder tomar decisiones más adelante
    i=i+1; % incrementa el contador para pasar al siguiente producto
    if i==3  % evitar quitar el esquema de alta calidad 
       i=i+1;
    end
    
    %% si se esta en el límite de la factibilidad 
    if v*Xp'<= b
    if Xp(1,i)==0  % si el producto se encuentra fuera de la mochila entonces se ingresa y si esta dentro se retira
        Xp(1,i)=1;
    else
        Xp(1,i)=0;
    end
        
    if v*Xp'<= b  % si al agregar o retirar un producto no se viola la restricción 
       if c*Xp'>= c*Xpv'  % si el costo mejora 
           break   % terminar el ciclo 
       else 
         if Xp(1,i)==0  % si el producto se encuentra fuera de la mochila entonces se ingresa y si esta dentro se retira
            Xp(1,i)=1;
         else
            Xp(1,i)=0;
         end  
           
       end
    end
           
                   
           
    
    else    
    %% si se esta en el límite de la infactibilidad    
    if Xp(1,i)==0  % si el producto se encuentra fuera de la mochila entonces se ingresa y si esta dentro se retira
        Xp(1,i)=1;
    else
        Xp(1,i)=0;
    end
    
    
    
    
    if v*Xp'<= b % si se factibiliza el el problema 
    
        break   % terminar el algoritmo de vecindad 
        
    else
        
     if Xp(1,i)==0  % regresar a el punto inicial 
        Xp(1,i)=1;
    else
        Xp(1,i)=0;
    end   
        
    end
    end
    
    
end

Elite(k,:)=[Xp c*Xp']; % soluciones élites 


end

[a b]=max(Elite(:,end));
X=Elite(b,1:end-1)
a
