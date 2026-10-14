
import 'package:flutter/material.dart';
import 'package:res_problemas/logica/ejercicio1_logica.dart';

class Ejercicio1Pantalla extends StatefulWidget {
  const Ejercicio1Pantalla({super.key});

  @override
  State<Ejercicio1Pantalla> createState() =>
      _Ejercicio1PantallaState();
}

class _Ejercicio1PantallaState
    extends State<Ejercicio1Pantalla> {

  // Controladores
  final cantidadController = TextEditingController();
  final ventaController = TextEditingController();

  // Logica
  VentasTikiTaka ventas = VentasTikiTaka();

  int cantidadVentas = 0;
  String mensaje = '';

  // Iniciar registro
  void iniciar() {
    int? cantidad = int.tryParse(cantidadController.text);

    if (cantidad == null || cantidad <= 0) {
      setState(() {
        mensaje = 'Ingrese una cantidad valida';
      });
      return;
    }

    setState(() {
      cantidadVentas = cantidad;
      ventas = VentasTikiTaka();
      mensaje = 'Puede comenzar a registrar las ventas';
    });

    ventaController.clear();
  }

  // Registrar venta
  void registrar() {
    if (cantidadVentas == 0) {
      setState(() {
        mensaje = 'Primero ingrese la cantidad de ventas';
      });
      return;
    }

    if (ventas.ventasRegistradas >= cantidadVentas) {
      setState(() {
        mensaje = 'Ya registro todas las ventas';
      });
      return;
    }

    double? monto = double.tryParse(ventaController.text);

    if (monto == null || monto < 0) {
      setState(() {
        mensaje = 'Ingrese un monto valido';
      });
      return;
    }

    setState(() {
      ventas.registrarVenta(monto);

      if (ventas.ventasRegistradas == cantidadVentas) {
        mensaje = 'Registro finalizado';
      } else {
        mensaje = 'Venta registrada correctamente';
      }
    });

    ventaController.clear();
  }

  // Limpiar datos
  void limpiar() {
    setState(() {
      cantidadController.clear();
      ventaController.clear();
      cantidadVentas = 0;
      ventas = VentasTikiTaka();
      mensaje = '';
    });
  }

  @override
  void dispose() {
    cantidadController.dispose();
    ventaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1 - Ventas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Tienda Tiki Taka',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: cantidadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad de ventas',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: iniciar,
              child: const Text('Iniciar registro'),
            ),

            const SizedBox(height: 20),

            Text(
              'Ventas registradas: '
              '${ventas.ventasRegistradas} de $cantidadVentas',
            ),

            const SizedBox(height: 15),

            TextField(
              controller: ventaController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Monto de la venta',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: registrar,
              child: const Text('Registrar venta'),
            ),

            const SizedBox(height: 15),

            Text(
              mensaje,
              style: const TextStyle(color: Colors.blue),
            ),

            const SizedBox(height: 25),

            const Text(
              'Resultados',
              style: TextStyle(fontSize: 22),
            ),

            const Divider(),

            Text(
              'Ventas mayores a \$1000: '
              '${ventas.cantidadMayor1000}',
            ),
            Text(
              'Total: \$${ventas.totalMayor1000.toStringAsFixed(2)}',
            ),

            const SizedBox(height: 15),

            Text(
              'Ventas mayores a \$500 hasta \$1000: '
              '${ventas.cantidadEntre500y1000}',
            ),
            Text(
              'Total: \$${ventas.totalEntre500y1000.toStringAsFixed(2)}',
            ),

            const SizedBox(height: 15),

            Text(
              'Ventas hasta \$500: '
              '${ventas.cantidadHasta500}',
            ),
            Text(
              'Total: \$${ventas.totalHasta500.toStringAsFixed(2)}',
            ),

            const Divider(),

            Text(
              'TOTAL GENERAL: '
              '\$${ventas.totalGeneral.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

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
