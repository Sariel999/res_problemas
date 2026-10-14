
class VentasMandilon {

  // Cantidades
  int ciudades = 0;
  int tiendas = 0;
  int empleados = 0;

  // Posicion actual
  int ciudadActual = 1;
  int tiendaActual = 1;
  int empleadoActual = 1;

  int totalRegistros = 0;

  // Variables
  double totalCadena = 0;
  bool iniciado = false;
  bool finalizado = false;

  List<double> ventas = [];
  List<String> resultados = [];

  // Iniciar registro
  void iniciar(int c, int t, int n) {
    ciudades = c;
    tiendas = t;
    empleados = n;

    ciudadActual = 1;
    tiendaActual = 1;
    empleadoActual = 1;

    totalRegistros = c * t * n;
    totalCadena = 0;

    ventas.clear();
    resultados.clear();

    iniciado = true;
    finalizado = false;
  }

  // Registrar venta de un empleado
  void registrarVenta(double monto) {

    if (!iniciado || finalizado) {
      return;
    }

    ventas.add(monto);

    if (ventas.length == totalRegistros) {
      calcularTotales();
      finalizado = true;
    } else {

      if (empleadoActual < empleados) {
        empleadoActual++;
      } else {
        empleadoActual = 1;

        if (tiendaActual < tiendas) {
          tiendaActual++;
        } else {
          tiendaActual = 1;
          ciudadActual++;
        }
      }
    }
  }

  // Calcular resultados
  void calcularTotales() {

    int posicion = 0;
    totalCadena = 0;
    resultados.clear();

    // Recorrer ciudades
    for (int c = 1; c <= ciudades; c++) {

      double totalCiudad = 0;

      resultados.add('CIUDAD $c');

      // Recorrer tiendas
      for (int t = 1; t <= tiendas; t++) {

        double totalTienda = 0;

        // Recorrer empleados
        for (int n = 1; n <= empleados; n++) {

          double monto = ventas[posicion];

          resultados.add(
            'Tienda $t - Empleado $n: '
            '\$${monto.toStringAsFixed(2)}'
          );

          totalTienda += monto;
          posicion++;
        }

        resultados.add(
          'Total tienda $t: '
          '\$${totalTienda.toStringAsFixed(2)}'
        );

        totalCiudad += totalTienda;
      }

      resultados.add(
        'TOTAL CIUDAD $c: '
        '\$${totalCiudad.toStringAsFixed(2)}'
      );

      totalCadena += totalCiudad;
    }
  }
}
