import 'package:flutter/material.dart';

import 'ejercicio1_pantalla.dart';
import 'ejercicio2_pantalla.dart';
import 'ejercicio3_pantalla.dart';
import 'ejercicio4_pantalla.dart';
import 'ejercicio5_pantalla.dart';

class MenuPantalla extends StatelessWidget {
  const MenuPantalla({super.key});

  // Crear una tarjeta para cada ejercicio
  Widget crearTarjeta(
    BuildContext context,
    String titulo,
    String descripcion,
    IconData icono,
    Widget pantalla,
  ) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icono, color: Colors.blue, size: 28),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        descripcion,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pantalla),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Abrir ejercicio'),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),

      appBar: AppBar(
        title: const Text('Resolucion de Problemas'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Encabezado
                Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'PROYECTO FLUTTER',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'NRC 36872',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Divider(height: 25),

                      const Row(
                        children: [
                          Icon(Icons.people, color: Colors.blue),
                          SizedBox(width: 10),
                          Text(
                            'Integrantes',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'Juan Gutierrez\n'
                        'Cesar Galarza\n'
                        'Sariel Peralta',
                        style: TextStyle(fontSize: 15, height: 1.7),
                      ),

                      const Divider(height: 25),

                      const Text(
                        'Presiona en [Abrir ejercicio]',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Ejercicio 1
                crearTarjeta(
                  context,
                  'Ejercicio 1 - Ventas Tiki Taka',
                  'Clasificacion y totales de ventas',
                  Icons.shopping_cart,
                  const Ejercicio1Pantalla(),
                ),

                // Ejercicio 2
                crearTarjeta(
                  context,
                  'Ejercicio 2 - Pagos mensuales',
                  'Calculo de 20 mensualidades',
                  Icons.calendar_month,
                  const Ejercicio2Pantalla(),
                ),

                // Ejercicio 3
                crearTarjeta(
                  context,
                  'Ejercicio 3 - El Mandilon',
                  'Ventas de ciudades y tiendas',
                  Icons.store,
                  const Ejercicio3Pantalla(),
                ),

                // Ejercicio 4
                crearTarjeta(
                  context,
                  'Ejercicio 4 - Sueldos semanales',
                  'Calculo de sueldos y descuentos',
                  Icons.people,
                  const Ejercicio4Pantalla(),
                ),

                // Ejercicio 5
                crearTarjeta(
                  context,
                  'Ejercicio 5 - Inversion anual',
                  'Intereses y capital acumulado',
                  Icons.trending_up,
                  const Ejercicio5Pantalla(),
                ),

                const SizedBox(height: 15),

                const Center(
                  child: Text(
                    'Desarrollado por GR02',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
