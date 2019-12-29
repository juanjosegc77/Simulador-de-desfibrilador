#include <msp430g2553.h>

int v;

int tempOut ()
{
	long t=0;
    long n=100000;
    for (t=0;t<n;++t){

	    ADC10CTL0 |= ENC + ADC10SC;
	    while(ADC10CTL1 & BUSY);
		    v=ADC10MEM;
		    ADC10CTL0&=~ENC;

		// Si la amplitud del voltaje es mayor que 1022, prende el led rojo y después de 100 ciclos de reloj apágalo
		
		if (v>1022){
			P1OUT |= BIT6;
			P1OUT &= ~BIT0;
			__delay_cycles(100);
			P1OUT &= ~BIT6;
            t=0;
		}
		else if(v<1022 && t==20000){
			P1OUT |= BIT0;
            _delay_cycles(100);

		}
    }
}

void main(void) {
    volatile int temp;
	WDTCTL = WDTPW | WDTHOLD;

	// Inicialización de parámetros y variables
	P1DIR |= 0x41;
	P1OUT &= ~0X41;

	temp= 0;

	//Configuración del ADC10
    ADC10CTL0=SREF_1 + REFON + ADC10ON + ADC10SHT_3;
    ADC10CTL1=INCH_4 + ADC10DIV_3;

    // Llama a la rutina tempOut y ejecútala en un ciclo infinito
    while (1){
    	temp=tempOut ();
    }
 }
