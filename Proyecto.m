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
%Información e importación de la señal
%---------------------------------------------------------------------------
[s,fs]=audioread('Domini_Fil.wav');
%    Canales = 1
%    fs = 8000 = 8ksps frecuencia de muestreo
%    N = 88576 muestras totales
%    Duración = 11.072
%    Bits por muesta = 16
%    BitRate = -1
%---------------------------------------------------------------------------
%Definición de filtro ideal
%---------------------------------------------------------------------------
%Realización del filtro pasa bajos
M = 88576; %muestras para el filtro ideal
Bw = 250*2; %ancho de banda
unos = floor( M * Bw ) %definición de los unos
if mod( unos, 2 ) == 0
  filtro += 1;
end
ceros = M - unos;
plot(s)
