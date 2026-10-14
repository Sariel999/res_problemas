
Algoritmo PagosMensuales
	
    Definir mes Como Entero
    Definir pago, totalPagado Como Real
	
    pago <- 10
    totalPagado <- 0
	
    Para mes <- 1 Hasta 20 Con Paso 1 Hacer
		
        Escribir "Mes ", mes, ": $", pago
		
        totalPagado <- totalPagado + pago
		
        pago <- pago * 2
		
    FinPara
	
    Escribir "-----------------------------"
    Escribir "TOTAL PAGADO: $", totalPagado
	
FinAlgoritmo
