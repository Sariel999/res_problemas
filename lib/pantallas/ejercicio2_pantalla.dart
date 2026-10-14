
import 'package:flutter/material.dart';
import 'package:res_problemas/logica/ejercicio2_logica.dart';

class Ejercicio2Pantalla extends StatefulWidget {
  const Ejercicio2Pantalla({super.key});

  @override
  State<Ejercicio2Pantalla> createState() =>
      _Ejercicio2PantallaState();
}

class _Ejercicio2PantallaState
    extends State<Ejercicio2Pantalla> {

  // Logica
  PagosMensuales pagos = PagosMensuales();

  bool calculado = false;

  // Calcular
  void calcular() {
    setState(() {
      pagos.calcularPagos();
      calculado = true;
    });
  }

  // Limpiar
  void limpiar() {
    setState(() {
      pagos = PagosMensuales();
      calculado = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2 - Pagos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Pagos Mensuales',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            const Text(
              'Una persona debe pagar un producto '
              'durante 20 meses. El primer mes '
              'paga \$10 y cada mes se duplica '
              'el pago anterior.',
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcular,
              child: const Text('Calcular pagos'),
            ),

            const SizedBox(height: 20),

            if (calculado) ...[

              const Text(
                'Detalle de los pagos',
                style: TextStyle(fontSize: 22),
              ),

              const Divider(),

              for (int i = 0; i < pagos.pagos.length; i++)
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Mes ${i + 1}: '
                    '\$${pagos.pagos[i].toStringAsFixed(2)}',
                  ),
                ),

              const Divider(),

              Text(
                'TOTAL PAGADO: '
                '\$${pagos.totalPagado.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: limpiar,
                child: const Text('Limpiar'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
