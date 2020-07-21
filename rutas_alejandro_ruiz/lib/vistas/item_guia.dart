import 'package:flutter/material.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_guia.dart';
import 'package:rutas_alejandro_ruiz/detalles/ver_guia.dart';

class ItemGuia extends StatelessWidget {
  final ModeloGuia _guia;
  ItemGuia(this._guia);
    TextStyle _stTitulo = new TextStyle(
              fontFamily: "IBMPlexSans",
              fontWeight: FontWeight.bold
            );
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Divider(
        height: 18.0,
      ),
      new ListTile(
        leading: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(_guia.imagenGuia)))),
        title: new Row(
          children: <Widget>[
            new Text(
              _guia.nombre,
              style: _stTitulo,
            ),
            new Text(
              _guia.puntuacion,
              style: Theme.of(context).textTheme.body2
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        subtitle:                   new Text(
                    "Teléfono: "+_guia.telefono,
                    style: Theme.of(context).textTheme.body2,
                  ),
        onTap: () {
          Route ruta = new MaterialPageRoute(
              builder: (context) => new DetallesGuia(guia: _guia));
          Navigator.push(context, ruta);
        },
      )
    ]);
  }
}
