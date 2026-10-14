
class SueldosSemanales {

  // Variables
  List<String> resultados = [];
  int registrados = 0;

  // Registrar trabajador y calcular sueldo
  void registrarTrabajador(
      String nombre, double horas, double pagoHora) {

    double sueldoBruto = horas * pagoHora;
    double porcentaje = -1;

    // Determinar el porcentaje de descuento
    if (sueldoBruto >= 0 && sueldoBruto <= 150) {
      porcentaje = 0.05;
    } else if (sueldoBruto > 150 && sueldoBruto < 300) {
      porcentaje = 0.07;
    } else if (sueldoBruto > 300 && sueldoBruto < 450) {
      porcentaje = 0.09;
    }

    String resultado;

    if (porcentaje >= 0) {
      // Calcular descuento y sueldo neto
      double descuento = sueldoBruto * porcentaje;
      double sueldoNeto = sueldoBruto - descuento;

      resultado =
          'Trabajador: $nombre\n'
          'Sueldo bruto: \$${sueldoBruto.toStringAsFixed(2)}\n'
          'Descuento: ${(porcentaje * 100).toStringAsFixed(0)}%\n'
          'Valor descontado: \$${descuento.toStringAsFixed(2)}\n'
          'Sueldo neto: \$${sueldoNeto.toStringAsFixed(2)}';

    } else {
      resultado =
          'Trabajador: $nombre\n'
          'Sueldo bruto: \$${sueldoBruto.toStringAsFixed(2)}\n'
          'Descuento no definido en el enunciado\n'
          'Sueldo neto pendiente de calcular';
    }

    resultados.add(resultado);
    registrados++;
  }
}
