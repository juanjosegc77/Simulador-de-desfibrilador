clear all % Limpiar todo
clc
esp=1; %espera
while esp >= 0.9 %Parámetro dado por nuestra gráfica de grabación
    
load('senal_ecg.mat'); % cargamos la señal de ECG

x=ECG(1,:); % Definimos x como una señal de ECG
Fs=0:0.004:40-0.004; % Definimos nuestra frecuencia de muestreo, dado que la señal de entrada original estaba muestreada a 250 Hz y tenía 10000 puntos, deducimos que tomaba muestras cada 0.004 segundos hasta la totalidad de la señal que era de 40 segundos

Fa=0:0.00001:40-0.00001; % Definimos una frecuencia de muestreo artificial, es decir que toma muestras a un intervalo de tiempo menor de lo que se muestreó la señal originalmente, en este caso el intervalo es de 0.0001 segundos.

yyi=spline(Fs,x,Fa); % Dado que la señal original de ECG está muestreada a una Fs y estamos simulando que tomó muestras a un menor intervalo de tiempo, les asignamos a esas muestras los valores más cercanos muestreados realmente, esto es para que la señal se vea más clara


Fay=20000; % Utilizando el teorema de Nyquist muestreamos al doble de la frecuencia máxima
soundsc(yyi,Fay) % Convertimos la señal digital de ECG, muestreada con la nueva frecuencia de muestreo Fa, a una señal analógica que saldrá por el puerto de audio de la computadora.

Fs =44600;
y = wavrecord(3*Fs,Fs,1);

i=0;
for(i=1:length(y))
    if y(i) >= 0.9; %Si hay un valor mayor a 0.9
        esp=y(i) %Reinicia el ciclo a esp
        break
    else
        esp=0; % En otro caso, no reinicies
    end
end

plot(y) %Graficar la señal de grabación
fprintf(1,'Fin') %Mostrar en pantalla el texto fin para saber que terminó


end
    
