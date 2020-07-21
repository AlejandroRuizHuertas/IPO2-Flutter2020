import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_circuitos.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_circuitos.dart';

class DetallesCircuito extends StatefulWidget {
// Propiedad inmutable
  final ModeloCircuito circuito;
  DetallesCircuito({this.circuito});
  @override
  _DetallesCircuitoState createState() => _DetallesCircuitoState();
}

class _DetallesCircuitoState extends State<DetallesCircuito> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          title: new Text(widget.circuito.nombre,
              style: new TextStyle(color: Theme.of(context).accentColor)),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.build,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                Route ruta = new MaterialPageRoute(
                    builder: (context) =>
                        new AddModCircuito(circuito: widget.circuito));
                Navigator.push(context, ruta);
              },
            )
          ],
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                _mostrar_imagen(widget.circuito.imagenCircuito),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.mapSigns)," Nombre: ", widget.circuito.nombre),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.euroSign)," Precio: ", widget.circuito.precio),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.fileAlt)," Descripción: ", ""),
                _mostrar_individual(widget.circuito.descripcion),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.landmark)," Monumentos: ", ""),
                _mostrar_individual(widget.circuito.monumentos),
              ],
            )));
  }

  Widget _mostrar_fila_icono(Widget icono, String nombre, String apellido) {
    return new Container(
        margin: const EdgeInsets.only(top: 15.0),
        child: Row(
          children: <Widget>[
            icono,
            new Text(
              nombre,
              style: new TextStyle(
                fontSize: 20,
              ),
            ),
            new Text(
              apellido,
              style: new TextStyle(
                  fontSize: 20,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ));
  }

  Widget _mostrar_imagen(String imagenRuta) {
    return new Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(20.0)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagenRuta))),
         );
  }

  Widget _mostrar_individual(String texto) {
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      alignment: Alignment.topLeft,
      child: Text(
        texto,
        style: new TextStyle(
            fontSize: 20,
            fontFamily: Theme.of(context).textTheme.body1.fontFamily,
            fontWeight: FontWeight.normal),
      ),
    );
    ;
  }
}
