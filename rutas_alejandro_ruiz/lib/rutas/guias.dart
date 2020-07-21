import "package:flutter/material.dart";
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_guias.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_guia.dart';
import 'package:rutas_alejandro_ruiz/vistas/item_guia.dart';

class Guias extends StatefulWidget {
  @override
  _GuiasState createState() => new _GuiasState();
}

class _GuiasState extends State<Guias> {
  List<ModeloGuia> guias;

  @override
  void initState() {
    super.initState();
    guias = <ModeloGuia>[
      ModeloGuia(
          nombre: "Pepe Guiones",
          imagenGuia: "imagenes/pepe.jpg",
          telefono: "753210432",
          puntuacion:
              "3/5",
          turno: "Mañana y tarde"),
                ModeloGuia(
          nombre: "Antonio Recio",
          imagenGuia: "imagenes/tony.jpg",
          telefono: "656212343",
          puntuacion:
              "5/5",
          turno: "Noche"),
                                    ModeloGuia(
          nombre: "Ignacio Segurola",
          imagenGuia: "imagenes/ignacio.jpg",
          telefono: "629420332",
          puntuacion:
              "5/5",
          turno: "Mañana"),
                ModeloGuia(
          nombre: "Jorge Rodríguez",
          imagenGuia: "imagenes/harold.jpg",
          telefono: "665767902",
          puntuacion:
              "2/5",
          turno: "Noche"),
                          ModeloGuia(
          nombre: "Encarnita Baptisterio",
          imagenGuia: "imagenes/encarnita.jpg",
          telefono: "665767902",
          puntuacion:
              "3/5",
          turno: "Noche"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                          Route ruta = new MaterialPageRoute(
                    builder: (context) =>
                        new AddModGuia());
                Navigator.push(context, ruta);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: new ListView.builder(
          itemCount: guias.length,
          itemBuilder: (context, int item) => new ItemGuia(guias[item])),
    );
  }
}
