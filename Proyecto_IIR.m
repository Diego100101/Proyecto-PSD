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

[s,fs] = audioread('Domini_Fil.wav');
duracion = length(s)/fs;

fc = [500/fs, 1000/fs]; % Frecuencias de paso normalizadas
orden = 5;

 % Función butter, recibe orden y vector con las frecuencias de paso
[bCoef, aCoef] = butter(orden, fc, 'bandpass'); 

% Respuesta en frecuencia del filtro
[h, w] = freqz(bCoef, aCoef); 

% Espectro de la señal original
S = abs(fftshift(fft(s))); 

% Filtración de la señal
senalFiltrada = filter(bCoef, aCoef, s);

% Espectro de la señal filtrada
senalFiltradaEspectro = fftshift(fft(senalFiltrada));

%% Graficación

% Respuesta en frecuencia del filtro pasa banda IIR
figure(1);
subplot(3,1,1);
plot(w, abs(h), 'r')
title('Filtro IIR');
xlabel('Respuesta en frecuencia del filtro pasa banda IIR');
grid on, grid minor;
% Espectro de la señal filtrada
subplot(3,1,2);
plot(abs(senalFiltradaEspectro), 'g')
xlabel('Espectro de la señal original filtrado');
grid on, grid minor;
subplot(3,1,3);
plot(abs(S), 'g')
xlabel('Espectro de la señal original');
grid on, grid minor;

% Sonido de la señal filtrada
sound(senalFiltrada,fs)
pause(duracion + 1);

audiowrite('Audio IIR.wav',senalFiltrada,fs)
