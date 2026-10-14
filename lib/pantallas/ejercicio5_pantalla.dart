
import 'package:flutter/material.dart';
import 'package:res_problemas/logica/ejercicio5_logica.dart';

class Ejercicio5Pantalla extends StatefulWidget {
  const Ejercicio5Pantalla({super.key});

  @override
  State<Ejercicio5Pantalla> createState() =>
      _Ejercicio5PantallaState();
}

class _Ejercicio5PantallaState
    extends State<Ejercicio5Pantalla> {

  // Controlador
  final anioController = TextEditingController(text: '2026');

  // Logica
  InversionAnual inversion = InversionAnual();

  bool calculado = false;
  String mensaje = '';

  // Calcular
  void calcular() {

    int? anioFinal = int.tryParse(anioController.text);

    if (anioFinal == null || anioFinal < 1961) {
      setState(() {
        mensaje = 'Ingrese un anio valido desde 1961';
        calculado = false;
      });
      return;
    }

    setState(() {
      inversion.calcularInversion(anioFinal);
      calculado = true;
      mensaje = 'Calculo realizado correctamente';
    });
  }

  // Limpiar
  void limpiar() {
    setState(() {
      anioController.text = '2026';
      inversion = InversionAnual();
      calculado = false;
      mensaje = '';
    });
  }

  @override
  void dispose() {
    anioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 5 - Inversion'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Inversion con Interes Anual',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            const Text(
              'Una persona deposito \$1500 en 1961 '
              'en una cuenta de ahorros que paga '
              '15% de interes anual.',
            ),

            const SizedBox(height: 25),

            const Text(
              'Datos de la inversion',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 15),

            const Text('Capital inicial: \$1500.00'),

            const SizedBox(height: 10),

            const Text('Interes anual: 15%'),

            const SizedBox(height: 10),

            const Text('Anio inicial: 1961'),

            const SizedBox(height: 20),

            TextField(
              controller: anioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Anio final',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcular,
              child: const Text('Calcular inversion'),
            ),

            const SizedBox(height: 15),

            Text(
              mensaje,
              style: const TextStyle(color: Colors.blue),
            ),

            if (calculado) ...[

              const SizedBox(height: 25),

              const Text(
                'Resultados',
                style: TextStyle(fontSize: 22),
              ),

              const Divider(),

              Text(
                'Anios transcurridos: '
                '${inversion.aniosTranscurridos}',
              ),

              const SizedBox(height: 15),

              Text(
                'Capital inicial: '
                '\$${inversion.capitalInicial.toStringAsFixed(2)}',
              ),

              const SizedBox(height: 15),

              Text(
                'Intereses ganados: '
                '\$${inversion.interesesGanados.toStringAsFixed(2)}',
              ),

              const Divider(),

              Text(
                'CAPITAL FINAL: '
                '\$${inversion.capitalFinal.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
            ],

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: limpiar,
              child: const Text('Limpiar'),
            ),
          ],
        ),
      ),
    );
  }
}
