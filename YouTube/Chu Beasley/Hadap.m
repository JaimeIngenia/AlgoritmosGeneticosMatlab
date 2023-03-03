function [FOH]=Hadap(BIN,H1,y,u)

ValorH=(H1*BIN')/100;

MH=y(end)-0.4*y(end-1)-ValorH*u(end-1);

FOH=abs(1/MH);


