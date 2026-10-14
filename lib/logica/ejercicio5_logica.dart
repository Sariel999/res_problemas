
class InversionAnual {

  // Datos iniciales
  double capitalInicial = 1500;
  double interesAnual = 0.15;
  int anioInicial = 1961;

  // Resultados
  double capitalFinal = 0;
  double interesesGanados = 0;
  int aniosTranscurridos = 0;

  // Calcular inversion
  void calcularInversion(int anioFinal) {

    aniosTranscurridos = anioFinal - anioInicial;

    double capital = capitalInicial;

    // Calcular interes por cada anio
    for (int anio = 1; anio <= aniosTranscurridos; anio++) {

      capital = capital * (1 + interesAnual);

    }

    capitalFinal = capital;
    interesesGanados = capitalFinal - capitalInicial;
  }
}
