import "package:flutter/material.dart";
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_promociones.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_promocion.dart';
import 'package:rutas_alejandro_ruiz/vistas/item_promociones.dart';


class Promociones extends StatefulWidget {
  @override
  _PromocionesState createState() => new _PromocionesState();
}

class _PromocionesState extends State<Promociones> {

  List<ModeloPromocion> promociones;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    promociones = <ModeloPromocion>[
      ModeloPromocion(
          nombre: "Halloween",
          fecha: "31/09/2020",
          descuento: "22%",
          ruta: "Puertollano",
          descripcion: "Realiza una experiencia de miedo visitando los peores sitios de Puertollano"),
      ModeloPromocion(
          nombre: "Romería Peñarroya",
          fecha: "26/04/2020",
          descuento: "21%",
          ruta: "Castillo de Peñarroya",
          descripcion: "Cruza la presa del pantano y crúzate con tus conocidos en cierto estado de embriaguez"),
      ModeloPromocion(
          nombre: "True Mancha Experience",
          fecha: "09/05/2020",
          descuento: "23%",
          ruta: "-Tomelloso\n-Hospital de Membrilla",
          descripcion: "Visita los lugares más emblemáticos de la comarca para convertirte en un buen manchego"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                Route ruta = new MaterialPageRoute(
                    builder: (context) =>
                        new AddModPromociones());
                Navigator.push(context, ruta);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: new ListView.builder(
          itemCount: promociones.length,
          itemBuilder: (context, int item) =>
              new ItemPromociones(promociones[item])),
    );
  }
}

