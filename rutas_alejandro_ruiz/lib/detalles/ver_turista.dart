import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_turistas.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_turista.dart';
import 'package:url_launcher/url_launcher.dart';

class DetallesTurista extends StatefulWidget {
// Propiedad inmutable
  final ModeloTurista turista;
  DetallesTurista({this.turista});
  @override
  _DetallesTuristaState createState() => _DetallesTuristaState();
}

class _DetallesTuristaState extends State<DetallesTurista> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          title: new Text(widget.turista.nombre,
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
                        new AddModTurista(turista: widget.turista));
                Navigator.push(context, ruta);
              },
            )
          ],
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                _mostrar_fila_icono(Icon(Icons.group)," Nombre: ", widget.turista.nombre),
                _mostrar_llamada(" Teléfono: ", widget.turista.telefono, context),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.clipboardList)," Lista de integrantes: ", ""),
                _mostrar_individual(widget.turista.integrantes),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.fileAlt)," Descripción: ", ""),
                _mostrar_individual(widget.turista.descripcion),
              ],
            )));
  }

  Widget _mostrar_llamada(
      String nombre, String apellido, BuildContext context) {
    String phone = "tel:" + apellido;
    _callPhone() async {
      if (await canLaunch(phone)) {
        await launch(phone);
      } else {
        throw 'Could not Call Phone';
      }
    }

    return new Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          new Divider(
            height: 18.0,
          ),
          Row(
            children: <Widget>[
              new Icon(Icons.phone),
              new Text(
                nombre,
                style: new TextStyle(
                  fontSize: 20,
                ),
              ),
              new FlatButton(
                  onPressed: () {
                    _callPhone();
                  },
                  child: new Text(
                    apellido,
                    style: new TextStyle(
                        fontSize: 20,
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).accentColor,
                        decoration: TextDecoration.underline),
                        
                  )),
            ],
          )
        ],
      ),
    );
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

  Widget _mostrar_individual(String texto) {
    return new Container(
      margin: const EdgeInsets.only(top: 15.0),
      alignment: Alignment.topLeft,
      child: Text(
        texto,
        style: new TextStyle(
          fontSize: 20,
          fontFamily: Theme.of(context).textTheme.body1.fontFamily,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
