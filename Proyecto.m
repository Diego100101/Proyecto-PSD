%---------------------------------------------------------------------------
%Proyecto de la UEA Procesamiento digital de señales
%---------------------------------------------------------------------------
%Insitución: UAM Lerma
%Fecha: 11 de diciembre de 2022
%Programadores:
%Anahi Betzayda Martínez Hernández
%Diego Cantoral González
%Emanuel Martínez Felipe
%---------------------------------------------------------------------------
[s,fs]=audioread('Domini_Fil.wav');
%Información de la señal:
%    Canales = 1
%    fs = 8000 frecuencia de muestreo
%    N = 88576 muestras totales
%    Duración = 11.072
%    Bits por muesta = 16
%    BitRate = -1
plot(s)
