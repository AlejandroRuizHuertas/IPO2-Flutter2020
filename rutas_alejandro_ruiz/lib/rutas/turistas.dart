import "package:flutter/material.dart";
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_turistas.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_turista.dart';
import 'package:rutas_alejandro_ruiz/vistas/item_turista.dart';

class Turistas extends StatefulWidget {
  @override
  _TuristasState createState() => new _TuristasState();
}

class _TuristasState extends State<Turistas> {
  List<ModeloTurista> turistas;
  @override
  void initState() {
    super.initState();
    turistas = <ModeloTurista>[
      ModeloTurista(
          nombre: "Fotógrafos",
          descripcion:
              "Grupo de jóvenes historiadores del arte que empiezan en el mundo de la fotografía",
          telefono: "665554443",
          numIntegrantes: "3",
          integrantes: "- Félix Felino\n- Juan Torquemada\n- Gonzalo González"),
      ModeloTurista(
          nombre: "Familia",
          descripcion: "Familia interesada en las iglesias",
          telefono: "726543212",
          numIntegrantes: "3",
          integrantes: "- Abilio González\n- Maribel Ruiz\n- Azul González"),
      ModeloTurista(
          nombre: "Ancianos",
          descripcion:
              "Grupo del IMSERSO que quieren ver los lugares característicos del Quijote",
          telefono: "660998277",
          numIntegrantes: "4",
          integrantes:
              "- José Jomírez\n- Pepa Pepita\n- Pedro González\n- Clara Ruiz"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route ruta =
              new MaterialPageRoute(builder: (context) => new AddModTurista());
          Navigator.push(context, ruta);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: new ListView.builder(
          itemCount: turistas.length,
          itemBuilder: (context, int item) => new ItemTurista(turistas[item])),
    );
  }
}
