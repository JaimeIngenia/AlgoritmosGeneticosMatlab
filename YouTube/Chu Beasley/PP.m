clc
clear all
%%
%Población inicial

N=20;
t=10;
k=1;
T=4; %Numero de elementos para torneo
pc=0.9; %Tasa de recombinación
pm=0.09; %Tasa de mutación
[X a]=poblacion(N,t,k);

for i=0:1:t-1
      BIN(1,i+1)=2^i;
end

%%
%Variables para la identificación

uicontrol('String','Parar','Callback','parada=0;');
t0=clock;
h=0.01;
parada=1;
u=ones(100,1);
y=ones(100,1);
ye=ones(100,1);
r=ones(100,1);
k=1;
theta=ones(1,2);
FO=ones(N,1);
evol=0;


while (parada)
    if etime(clock,t0)>=h
        t0=clock;
        
         %%   
         %Generar Entrada u
         if(k>=30)
         u(end)=5*rand;
         k=1;
         end
         %%
         %Planta Simulada
         if (evol>0) &&(evol<=200)
         y(end)=0.4*y(end-1)+0.8*u(end-1);
         end
         if (evol>200) &&(evol<=400)
         y(end)=0.4*y(end-1)+0.4*u(end-1);
         end
         if (evol>400) && (evol<600)
          y(end)=0.4*y(end-1)+0.2*u(end-1);   
         end
         evol=evol+1;

         if evol==600
            evol=0; 
         end

         for lo=1:1:10
%% Selección por Torneo       
         
[P1 P2 FO]=Seleccion(X,N,y,u,T,t,a);       
        

%% Recombinación

[H]=Recombinacion(P1,P2,pc,t);


%% Mutación

[H1]=Mutacion(H,t,pm);


%% Valor de la Función de adaptación del hijo

[FOH]=Hadap(BIN,H1,y,u)



%% Valor de la Función de adaptación de todos los individuos
                      
[inc]=incumbente(FO,a)



%% Admisión del nuevo hijo

[v]=Admision(FO,FOH,N,t,H1,X,k);

%% Algoritmo de mejoría local

[X]=mejoriaLocal(v,FO,H1,BIN,y,u,N,t,X,k)       

         end
        ye(end)=0.4*y(end-1)+inc*u(end-1);
        
         y(1:end-1)=y(2:end);
         u(1:end-1)=u(2:end);
         ye(1:end-1)=ye(2:end);
         plot([y u ye]);
         k=k+1;
    end
    pause(0.00001)
    
end