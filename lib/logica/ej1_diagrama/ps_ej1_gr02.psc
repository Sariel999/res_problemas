
Algoritmo VentasTikiTaka
	
    Definir n, i Como Entero
    Definir cantidadMayor1000, cantidadEntre500y1000, cantidadHasta500 Como Entero
    Definir monto, totalMayor1000, totalEntre500y1000 Como Real
    Definir totalHasta500, totalGeneral Como Real
	
    cantidadMayor1000 <- 0
    cantidadEntre500y1000 <- 0
    cantidadHasta500 <- 0
	
    totalMayor1000 <- 0
    totalEntre500y1000 <- 0
    totalHasta500 <- 0
    totalGeneral <- 0
	
    Escribir "Ingrese la cantidad de ventas:"
    Leer n
	
    Mientras n <= 0 Hacer
        Escribir "Ingrese una cantidad valida:"
        Leer n
    FinMientras
	
    Para i <- 1 Hasta n Con Paso 1 Hacer
		
        Escribir "Ingrese el monto de la venta ", i, ":"
        Leer monto
		
        Mientras monto < 0 Hacer
            Escribir "Ingrese un monto valido:"
            Leer monto
        FinMientras
		
        Si monto > 1000 Entonces
            cantidadMayor1000 <- cantidadMayor1000 + 1
            totalMayor1000 <- totalMayor1000 + monto
        SiNo
            Si monto > 500 Entonces
                cantidadEntre500y1000 <- cantidadEntre500y1000 + 1
                totalEntre500y1000 <- totalEntre500y1000 + monto
            SiNo
                cantidadHasta500 <- cantidadHasta500 + 1
                totalHasta500 <- totalHasta500 + monto
            FinSi
        FinSi
		
        totalGeneral <- totalGeneral + monto
		
    FinPara
	
    Escribir "RESULTADOS DE VENTAS"
	
    Escribir "Ventas mayores a $1000: ", cantidadMayor1000
    Escribir "Monto: $", totalMayor1000
	
    Escribir "Ventas mayores a $500 hasta $1000: ", cantidadEntre500y1000
    Escribir "Monto: $", totalEntre500y1000
	
    Escribir "Ventas hasta $500: ", cantidadHasta500
    Escribir "Monto: $", totalHasta500
	
    Escribir "TOTAL GENERAL: $", totalGeneral
	
FinAlgoritmo
