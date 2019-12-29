# Simulador de desfibrilador

Simulador de desfibrilador automático implantable utilizando un microcontrolador MSP430g2553 y Matlab. Proyecto final escolar realizado para la asignatura "Secuenciadores y microprocesadores" de la Licenciatura en Ingeniaría Biomédica cursada en la Universidad Autónoma Metropolitana.


## Resumen

Se realizó un sistema retroalimentado para detectar la onda R de una señal de ECG que generara un pulso de reactivación. La señal se proporcionó mediante Matlab a partir del puerto auxiliar para audífonos, se utilizó un microcontrolador MSP430g2553 de Texas Instrument para detectar la onda R y generar un pulso cuando esta onda no estuviese presente, este pulso se capturó con Matlab por el auxiliar para micrófono y sirvió de condición para recargar la señal de ECG.


## Funcionamiento

 * Se genera una señal de salida de ECG en el conector de audifonos de una computadora utilizando MATLAB.
 * Se recibe y muestrea la señal de ECG en el MSP430.
 * El microprocesador MSP430g2553 indica encendiendo un led verde la existencia del componente R de la señal de ECG. También devuelve un valor 0 si existe el componente R y un 1, en caso contrario.
 * La computadora recibe el valor devuelto desde el MSP430 en el conector para micrófono. Con MATLAB se lee dicho valor, si el valor es 0 no sucede nada, si el valor es 1 se reinicia la reproducción de la señal de ECG.
 
 
![esquema](https://user-images.githubusercontent.com/58958653/71551375-a0137e80-29ab-11ea-9df1-45e2f926c7c3.png)


 
 
 
 
