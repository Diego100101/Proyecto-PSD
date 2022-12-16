clc;
clear;
%---------------------------------------------------------------------------
% Proyecto de la UEA Procesamiento digital de señales
%---------------------------------------------------------------------------
% Insitución: UAM Lerma
% Fecha: 11 de diciembre de 2022
% Programadores:
% Anahi Betzayda Martínez Hernández
% Diego Cantoral González
% Emanuel Martínez Felipe
%---------------------------------------------------------------------------
% Información e importación de la señal
%---------------------------------------------------------------------------

[s,fs]=audioread('Domini_Fil.wav');
duracion = length(s)/fs;

fc = [500/fs, 1000/fs]; % Frecuencias de paso normalizadas
orden = 5;

[bCoef, aCoef] = butter(orden, fc, 'bandpass');

[h, w] = freqz(bCoef, aCoef); % Respuesta en frecuencia del filtro

S = abs(fftshift(fft(s)));

senalFiltrada = filter(bCoef, aCoef, s);

senalFiltradaEspectro = fftshift(fft(senalFiltrada));
figure();
plot(abs(senalFiltradaEspectro))
% plot(w, abs(h), 'r')

sound(senalFiltrada,fs)
pause(duracion + 1);

