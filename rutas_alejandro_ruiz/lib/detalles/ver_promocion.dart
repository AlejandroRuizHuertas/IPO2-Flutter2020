import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_promociones.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_promocion.dart';

class DetallesPromocion extends StatefulWidget {
  final ModeloPromocion promocion;
  DetallesPromocion({this.promocion});
  @override
  _DetallesPromocionState createState() => _DetallesPromocionState();
}

class _DetallesPromocionState extends State<DetallesPromocion> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          title: new Text(widget.promocion.nombre,
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
                        new AddModPromociones(promocion: widget.promocion));
                Navigator.push(context, ruta);
              },
            )
          ],
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                _mostrar_fila_icono(Icon(Icons.email)," Nombre: ", widget.promocion.nombre),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.percent)," Descuento: ", widget.promocion.descuento),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(Icons.calendar_today)," Fecha: ", widget.promocion.fecha),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.fileAlt)," Descripción: ", " "),
                _mostrar_individual(widget.promocion.descripcion),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.mapSigns)," Ruta: ", " "),
                _mostrar_individual(widget.promocion.ruta)
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

  Widget _mostrar_individual(String texto) {
    return new Container(
      margin: const EdgeInsets.only(top: 15.0),
      alignment: Alignment.topLeft,
      child: Text(
        texto,
        style: new TextStyle(
            fontSize: 20,
            fontFamily: Theme.of(context).textTheme.body1.fontFamily,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
