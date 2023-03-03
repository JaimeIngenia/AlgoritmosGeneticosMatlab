%% selecci�n 

c=[3 4 8 3 6 4 10 4 10 9];
v=[6 4 3 3 3 5 9 8 5 10];

b=26;
N=20;                      % tama�o de la poblaci�n inicial 
t=size(c,2);               % n�mero de productos  

[X,FO,In]=poblacion(c,v,b,N,t)   % se ingresan los datos de los productos y restricci�n 

alpha=2;     % factor de penalizacion para los puntos infactibles  
%% crear la funci�n  de adaptabilidad 
Fadap=FO-alpha*In;

%% comparaci�n    %
% Fadap1=FO-0.5*In;
% Fadap2=FO-1*In;
% Fadap3=FO-3*In;
% 
% Ndes1=Fadap1/(sum(Fadap1)/N);
% Ndes2=Fadap2/(sum(Fadap2)/N);
% Ndes3=Fadap3/(sum(Fadap3)/N);
% 
% comp=[Fadap1,Fadap2,Fadap3]
% comp1=[Ndes1,Ndes2,Ndes3]
%%

Ndes=Fadap/(sum(Fadap)/N); % n�mero de descendientes para cada padre  

des=floor(Ndes);    % vector con el n�mero de descendientes (parte entera) 
res=Ndes-des ;      % valores restantes para distribuir en los padres (parte decimal)

%% Selecci�n estocastica del residuo (ruleta)

res=360*res/sum(res); %se reparte en porciones (ruleta) los residuos 
for i=2:1:N           % se suman los espacios de la ruleta y queda distribuido en los 360 grados
    res(i,1)=res(i,1)+res(i-1,1)
end    

while sum(des)<N   % mientras los 20 descendientes no sean asignados 
   ruleta=360*rand;   % gira la ruleta 
   i=2;     % empezar en 2 para evitar problemas con asignaci�n de vector 
   while i < N     % hacer en todas las casillas de la ruleta 
      
       if ruleta>=res(i-1,1) && ruleta<res(i,1)  % si cay� entre las casillas (i-1) y la (i) entonces asignar descendiente a (i-1)
           des(i-1,1)=des(i-1,1)+1; % incrementar descendiente a des en la casilla i-1
           i=N;   % terminar el ciclo while colocando i =N
       end
       i=i+1; % incrementar la variable i (esta variable recorre las casillas de la ruleta)
   end
         
end

des