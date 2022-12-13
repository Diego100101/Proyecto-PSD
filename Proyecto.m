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
M = 64; %muestras para el filtro ideal ; taps
% fnormalizada = 500/8000 = 0.0625
Bw = 0.0625*2; % 2xFrecuencia de corte normalizada a la frecuencia de muestreo
N = length(s); %Número de muestras
##duracion = length(s)/fs;
t = linspace(0, duracion, length(s)); % tiempo lenght(s) = número de muestras
##plot(s)
title('Audio Domini_Fil en términos de muestras')

espectroSenal = fftshift(fft(s)); %transformada del audio centrada

f = linspace(-fs/2, fs/2, N); %ventana de Fourier que va de -4kHz a 4kHz con N muestras
plot(f, abs(espectroSenal)/max(abs(espectroSenal)))
grid on, grid minor;

% Diseño del filtro ideal

filtrolp = 1.*( abs(f) <= 250 );
filtroInverso = fftshift(ifft(filtrolp));

##figure();
##plot(f, filtrolp, 'b')

portadora = cos(750*2*pi*t);
modulacion = filtroInverso .* portadora;

filtroModulado = fftshift(fft(modulacion));
figure();
plot(t, filtroModulado)
