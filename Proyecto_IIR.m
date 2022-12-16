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
figure();
plot(w, abs(h), 'r')

% Espectro de la señal filtrada
figure();
plot(abs(senalFiltradaEspectro))

% Sonido de la señal filtrada
sound(senalFiltrada,fs)
pause(duracion + 1);

