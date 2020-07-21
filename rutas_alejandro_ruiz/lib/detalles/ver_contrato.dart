import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_contratos.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_contratos.dart';

class DetallesContrato extends StatefulWidget {
// Propiedad inmutable
  final ModeloContrato contrato;
  DetallesContrato({this.contrato});
  @override
  _DetallesContratoState createState() => _DetallesContratoState();
}

class _DetallesContratoState extends State<DetallesContrato> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(
              color: Theme.of(context).accentColor //change your color here
              ),
          title: new Text(widget.contrato.id,
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
                        new AddModContrato(contrato: widget.contrato));
                Navigator.push(context, ruta);
              },
            )
          ],
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                _mostrar_imagen(widget.contrato.imagenRuta),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.hiking), " Guía: ",
                    widget.contrato.guia),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.calendar)," Fecha: ", widget.contrato.fecha),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon (FontAwesomeIcons.check)," Estado: ", widget.contrato.estado),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(Icons.group)," Turista: ", widget.contrato.turista)
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
}
