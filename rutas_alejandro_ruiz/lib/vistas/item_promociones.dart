import 'package:flutter/material.dart';

import 'package:rutas_alejandro_ruiz/modelos/modelo_promocion.dart';
import 'package:rutas_alejandro_ruiz/detalles/ver_promocion.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ItemPromociones extends StatelessWidget {

      TextStyle _stTitulo = new TextStyle(
              fontFamily: "IBMPlexSans",
              fontWeight: FontWeight.bold
            );

  final ModeloPromocion _promocion;
  ItemPromociones(this._promocion);
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Divider(
        height: 18.0,
      ),
      new ListTile(
        title: new Row(
          children: <Widget>[
            new Text(
              _promocion.nombre,
              style: _stTitulo,
            ),
            new Text(
              _promocion.fecha,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        subtitle: new Container(
          child: new Row(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text(
                    "Descuento: ",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  new Text(
                    _promocion.descuento,
                    style: Theme.of(context).textTheme.body2,
                  ),
                ],
              ),
              new Container(
                  child: new IconButton(
                      icon: new Icon(Icons.send),
                      onPressed: () {
                        _mandar_promocion(context);
                      })),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          padding: const EdgeInsets.only(top: 5.0),
        ),
        onTap: () {
          Route ruta = new MaterialPageRoute(
              builder: (context) =>
                  new DetallesPromocion(promocion: _promocion));
          Navigator.push(context, ruta);
        },
      )
    ]);
  }

  void _mandar_promocion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Enviar promoción"),
          content: new Text("¿Quieres enviar la promoción?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Sí"),
              onPressed: () {
                Fluttertoast.showToast(
        msg: "Promoción enviada",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).primaryColor,
        textColor: Theme.of(context).accentColor,
        fontSize: 18.0,
    );

    Navigator.of(context).pop();
                
              },
            )
          ],
        );
      },
    );
  }
}
