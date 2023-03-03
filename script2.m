clc
clear all

opciones  = optimoptions('ga', 'PlotFcn', @gaplotbestf);
[x,fval,exitflag,output,population,scores] = ga(@funcion_1, 3, [],[],[],[],[1 1 2],[20 20 40], [],[],opciones)
