
class PagosMensuales {

  // Variables
  List<double> pagos = [];
  double totalPagado = 0;

  // Calcular los pagos de los 20 meses
  void calcularPagos() {

    double pago = 10;

    pagos.clear();
    totalPagado = 0;

    for (int mes = 1; mes <= 20; mes++) {

      pagos.add(pago);

      totalPagado += pago;

      pago = pago * 2;
    }
  }
}
