
class VentasTikiTaka {
  // Contadores
  int cantidadMayor1000 = 0;
  int cantidadEntre500y1000 = 0;
  int cantidadHasta500 = 0;
  int ventasRegistradas = 0;

  // Acumuladores
  double totalMayor1000 = 0;
  double totalEntre500y1000 = 0;
  double totalHasta500 = 0;
  double totalGeneral = 0;

  // Registrar una venta
  void registrarVenta(double monto) {
    if (monto > 1000) {
      cantidadMayor1000++;
      totalMayor1000 += monto;
    } else if (monto > 500) {
      cantidadEntre500y1000++;
      totalEntre500y1000 += monto;
    } else {
      cantidadHasta500++;
      totalHasta500 += monto;
    }

    ventasRegistradas++;
    totalGeneral += monto;
  }
}
