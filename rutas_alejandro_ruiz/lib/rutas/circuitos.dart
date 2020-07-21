import "package:flutter/material.dart";
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_circuitos.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_circuitos.dart';
import 'package:rutas_alejandro_ruiz/vistas/item_circuito.dart';

class Circuitos extends StatefulWidget {
  @override
  _CircuitosState createState() => new _CircuitosState();
}

class _CircuitosState extends State<Circuitos> {
  List<ModeloCircuito> circuitos;

  @override
  void initState() {
    super.initState();
    circuitos = <ModeloCircuito>[
      ModeloCircuito(
        nombre: "Argamasilla de Alba",
        imagenCircuito: "imagenes/argamasilla.jpg",
        precio: "65€/persona",
        descripcion: "Una ruta por los lugares más emblemáticos del pueblo",
        monumentos:
            "-Iglesia San Juan Bautista\n- Quijote Negro\n- Cueva de Medrano",
      ),
      ModeloCircuito(
        nombre: "Puertollano",
        imagenCircuito: "imagenes/puertollano.jpg",
        precio: "22€/persona",
        descripcion: "Una ruta por los lugares más chungos del pueblo",
        monumentos: "-Barrio del Carmen\n- Burger King de la plaza",
      ),
      ModeloCircuito(
        nombre: "Cinco Casas",
        imagenCircuito: "imagenes/cincocasas.jpg",
        precio: "5€/persona",
        descripcion: "Un paseo de 5 minutos por las cuatro calles que tiene",
        monumentos: "-Planta Solar\n- Ayuntamiento",
      ),
      ModeloCircuito(
        nombre: "Alcázar de San Juan",
        imagenCircuito: "imagenes/alcazar.jpg",
        precio: "34€/persona",
        descripcion: "Un vistazo a la parte antigua de la estación de tren y su impacto en la Guerra Civil",
        monumentos: "- Estación de Tren\n- Mercado de Abastos\n- Ayuntamiento General",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                          Route ruta = new MaterialPageRoute(
                    builder: (context) =>
                        new AddModCircuito());
                Navigator.push(context, ruta);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: new ListView.builder(
          itemCount: circuitos.length,
          itemBuilder: (context, int item) =>
              new ItemCircuito(circuitos[item])),
    );
  }
}
