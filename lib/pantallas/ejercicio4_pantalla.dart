
import 'package:flutter/material.dart';
import 'package:res_problemas/logica/ejercicio4_logica.dart';

class Ejercicio4Pantalla extends StatefulWidget {
  const Ejercicio4Pantalla({super.key});

  @override
  State<Ejercicio4Pantalla> createState() =>
      _Ejercicio4PantallaState();
}

class _Ejercicio4PantallaState
    extends State<Ejercicio4Pantalla> {

  // Controladores
  final cantidadController = TextEditingController();
  final nombreController = TextEditingController();
  final horasController = TextEditingController();
  final pagoController = TextEditingController();

  // Logica
  SueldosSemanales sueldos = SueldosSemanales();

  int cantidadTrabajadores = 0;
  bool iniciado = false;
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
      cantidadTrabajadores = cantidad;
      sueldos = SueldosSemanales();
      iniciado = true;
      mensaje = 'Puede comenzar a registrar trabajadores';
    });

    nombreController.clear();
    horasController.clear();
    pagoController.clear();
  }

  // Registrar trabajador
  void registrar() {

    if (!iniciado) {
      setState(() {
        mensaje = 'Primero inicie el registro';
      });
      return;
    }

    if (sueldos.registrados >= cantidadTrabajadores) {
      setState(() {
        mensaje = 'Ya registro todos los trabajadores';
      });
      return;
    }

    String nombre = nombreController.text.trim();
    double? horas = double.tryParse(horasController.text);
    double? pagoHora = double.tryParse(pagoController.text);

    if (nombre.isEmpty ||
        horas == null ||
        pagoHora == null ||
        horas < 0 ||
        pagoHora < 0) {
      setState(() {
        mensaje = 'Ingrese datos validos';
      });
      return;
    }

    setState(() {
      sueldos.registrarTrabajador(nombre, horas, pagoHora);

      if (sueldos.registrados == cantidadTrabajadores) {
        mensaje = 'Registro finalizado';
      } else {
        mensaje = 'Trabajador registrado correctamente';
      }
    });

    nombreController.clear();
    horasController.clear();
    pagoController.clear();
  }

  // Limpiar
  void limpiar() {
    setState(() {
      cantidadController.clear();
      nombreController.clear();
      horasController.clear();
      pagoController.clear();

      sueldos = SueldosSemanales();
      cantidadTrabajadores = 0;
      iniciado = false;
      mensaje = '';
    });
  }

  @override
  void dispose() {
    cantidadController.dispose();
    nombreController.dispose();
    horasController.dispose();
    pagoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4 - Sueldos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Sueldos Semanales',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: cantidadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad de trabajadores',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: iniciar,
              child: const Text('Iniciar registro'),
            ),

            const SizedBox(height: 20),

            if (iniciado) ...[

              Text(
                'Trabajadores registrados: '
                '${sueldos.registrados} de $cantidadTrabajadores',
              ),

              const SizedBox(height: 20),

              if (sueldos.registrados < cantidadTrabajadores) ...[

                Text(
                  'Trabajador ${sueldos.registrados + 1}',
                  style: const TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del trabajador',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: horasController,
                  keyboardType:
                      const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Horas trabajadas',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: pagoController,
                  keyboardType:
                      const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Sueldo por hora',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                ElevatedButton(
                  onPressed: registrar,
                  child: const Text('Registrar trabajador'),
                ),
              ],
            ],

            const SizedBox(height: 20),

            Text(
              mensaje,
              style: const TextStyle(color: Colors.blue),
            ),

            if (sueldos.registrados > 0) ...[

              const SizedBox(height: 20),

              const Text(
                'Resultados',
                style: TextStyle(fontSize: 22),
              ),

              const Divider(),

              for (int i = 0; i < sueldos.resultados.length; i++)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    sueldos.resultados[i],
                    style: const TextStyle(fontSize: 16),
                  ),
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
