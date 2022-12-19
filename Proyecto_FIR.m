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

%    Canales = 1
%    fs = 8000 = 8ksps frecuencia de muestreo
%    N = 88576 muestras totales
%    Duración = 11.072
%    Bits por muesta = 16
%    BitRate = -1

%---------------------------------------------------------------------------
% Definición de filtro ideal
%---------------------------------------------------------------------------

M = 64; % taps
N = length(s); % Número de muestras de la señal original
fourier = linspace(-fs/2, fs/2, N); % Ventana de Fourier que va de -4kHz a 4kHz
fourierCoeficiente = linspace(-fs/2, fs/2, M); % Ventana de fourier para los 64 coeficientes

% H(k) Respuesta al impulso en frecuencia ideal para filtro pasa bajos
H_k = 1.*( abs(fourier) <= 250 ).';
H_kCoeficientes= 1.*( abs(fourierCoeficiente) <= 250 ).';

% Vector de duración
duracion = length(s)/fs;

% Coeficientes h(n) del filtro
h_n = fftshift(ifft(H_k)); 
h_nCoeficientes = fftshift(ifft(H_kCoeficientes));

% Audio en el dominio de la frecuencia
S = fftshift(fft(s));

% Modulación de la h(n) para filtro pasa bandas
desplazada = fft(modulate(h_n, 750, fs)) ;

% Filtrado de la señal con el filtro pasa bandas
filtrado = desplazada .* S;

% Recuperar sonido
senalFiltrada = ifft(fftshift(filtrado));
senalFiltrada = real(senalFiltrada);

%---------------------------------------------------------------------------
% Graficación
%---------------------------------------------------------------------------

% Respuesta al impulso en frecuencia ideal
figure(1);
subplot(2,1,1);
plot(fourier, H_k, 'r'); 
title('Respuesta al impulso en frecuencia ideal')
xlabel('Respuesta al impulso en frecuencia');
grid on, grid minor;
% Señal de los 64 coeficientes para el filtro
subplot(2,1,2);
stem(fourierCoeficiente, abs(h_nCoeficientes), 'r');
xlabel('Coeficientes 64 taps');
grid on, grid minor;

% Pasa bajos con el espectro de la señal original
magnitudSenal = abs(S);
figure(2);
subplot(2,1,1);
plot(fourier, abs(desplazada), 'r')
title('Filtrado');
hold on;
plot(fourier, magnitudSenal/max(magnitudSenal), 'g');
xlabel('Espectro de la señal original con filtro pasa banda');
grid on, grid minor;
subplot(2,1,2);
magnitudFiltrado = abs(filtrado);
plot(fourier, magnitudFiltrado/max(magnitudFiltrado), 'g');
hold on;
plot(fourier, abs(desplazada), 'r')
xlabel('Espectro de la señal original filtrada');
grid on, grid minor;

% Comparación
figure(3);
subplot(2,1,1);
plot(fourier, senalFiltrada, 'g');
title('Comparación');
xlabel('Señal filtrada')
grid on, grid minor;
subplot(2,1,2);
plot(s, 'g')
xlabel('Señal original')
grid on, grid minor;


% Sonido original 
sound(s,fs);
pause(duracion + 1);

% Sonido resultante
sound(senalFiltrada, fs);
pause(duracion + 1);

audiowrite("Audio FIR.wav",senalFiltrada,fs)
