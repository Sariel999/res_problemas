
import 'package:flutter/material.dart';
import 'package:res_problemas/logica/ejercicio3_logica.dart';

class Ejercicio3Pantalla extends StatefulWidget {
  const Ejercicio3Pantalla({super.key});

  @override
  State<Ejercicio3Pantalla> createState() =>
      _Ejercicio3PantallaState();
}

class _Ejercicio3PantallaState
    extends State<Ejercicio3Pantalla> {

  // Controladores
  final ciudadesController = TextEditingController();
  final tiendasController = TextEditingController();
  final empleadosController = TextEditingController();
  final ventaController = TextEditingController();

  // Logica
  VentasMandilon cadena = VentasMandilon();

  String mensaje = '';

  // Iniciar
  void iniciar() {

    int? c = int.tryParse(ciudadesController.text);
    int? t = int.tryParse(tiendasController.text);
    int? n = int.tryParse(empleadosController.text);

    if (c == null || t == null || n == null ||
        c <= 0 || t <= 0 || n <= 0) {
      setState(() {
        mensaje = 'Ingrese cantidades validas';
      });
      return;
    }

    setState(() {
      cadena.iniciar(c, t, n);
      mensaje = 'Registro iniciado';
    });

    ventaController.clear();
  }

  // Registrar venta
  void registrar() {

    if (!cadena.iniciado) {
      setState(() {
        mensaje = 'Primero inicie el registro';
      });
      return;
    }

    if (cadena.finalizado) {
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
      cadena.registrarVenta(monto);

      if (cadena.finalizado) {
        mensaje = 'Registro finalizado';
      } else {
        mensaje = 'Venta registrada correctamente';
      }
    });

    ventaController.clear();
  }

  // Limpiar
  void limpiar() {
    setState(() {
      ciudadesController.clear();
      tiendasController.clear();
      empleadosController.clear();
      ventaController.clear();

      cadena = VentasMandilon();
      mensaje = '';
    });
  }

  @override
  void dispose() {
    ciudadesController.dispose();
    tiendasController.dispose();
    empleadosController.dispose();
    ventaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 3 - Tiendas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Cadena El Mandilon',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: ciudadesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad de ciudades',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: tiendasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tiendas por ciudad',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: empleadosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Empleados por tienda',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: iniciar,
              child: const Text('Iniciar registro'),
            ),

            const SizedBox(height: 20),

            if (cadena.iniciado) ...[

              Text(
                'Ventas registradas: '
                '${cadena.ventas.length} de '
                '${cadena.totalRegistros}',
              ),

              const SizedBox(height: 15),

              if (!cadena.finalizado) ...[

                Text(
                  'Ciudad ${cadena.ciudadActual} - '
                  'Tienda ${cadena.tiendaActual} - '
                  'Empleado ${cadena.empleadoActual}',
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: ventaController,
                  keyboardType:
                      const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Monto vendido por empleado',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                ElevatedButton(
                  onPressed: registrar,
                  child: const Text('Registrar venta'),
                ),
              ],
            ],

            const SizedBox(height: 15),

            Text(
              mensaje,
              style: const TextStyle(color: Colors.blue),
            ),

            if (cadena.finalizado) ...[

              const SizedBox(height: 20),

              const Text(
                'Resultados de ventas',
                style: TextStyle(fontSize: 22),
              ),

              const Divider(),

              for (int i = 0;
                  i < cadena.resultados.length;
                  i++)
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(cadena.resultados[i]),
                ),

              const Divider(),

              Text(
                'TOTAL DE LA CADENA: '
                '\$${cadena.totalCadena.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
            ],

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
