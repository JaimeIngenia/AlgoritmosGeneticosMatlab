%% selecci�n usando torneo (metodolog�a mas eficiente)  % se benefician los
%% padres con funci�n de adaptaci�n alta 


function [des,X,FO,In,N,t,c,b] =seleccion4(X,FO,In,c,b,N,t,alpha) 



% [X,FO,In]=poblacion(c,va,b,N,t)   % se ingresan los datos de los productos y restricci�n 

  
%% crear la funci�n  de adaptabilidad 
Fadap=FO-alpha*In;

%%
k=4;  %n�mero de individuos de la competencia
%%

v=zeros(k,2); %matriz para guardar la competencia 
des=zeros(N,1); %matriz con los descendientes

while sum(des)<N % mientras no se asignen todos los descendientes 
    i=1;
  while i<=k      % repetir ciclo para escojencia de padres que entran a torneo
     
    a=floor((N-1)*rand+1);  % se escoje un padre aleatoriamente
    
   if a~= v(:,2) % para evitar que se repita al padre en el torneo 
   v(i,:)=[Fadap(a,1) a];  % se guarda en un vector los padres (funci�n de adaptaci�n) y posici�n del padre
   i=i+1;    % si no se repite el padre entonces que se pase a escojer un nuevo padre para el torneo
   end
   
  end

  [r j]=max(v(:,1)); % se extrae el mejor padre del torneo 
  
  des(v(j,2),1)=des(v(j,2),1)+1; %sumar un descendiente al padre ganador del torneo 
  
end
 
des
