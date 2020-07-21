import 'package:flutter/material.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_circuitos.dart';
import 'package:rutas_alejandro_ruiz/detalles/ver_circuito.dart';

class ItemCircuito extends StatelessWidget {
  final ModeloCircuito _circuito;
  ItemCircuito(this._circuito);
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
                    fit: BoxFit.cover,
                    image: AssetImage(_circuito.imagenCircuito)))),
        title: new Row(
          children: <Widget>[
            new Text(
              _circuito.nombre,
              style: _stTitulo,
            ),
            new Text(
              _circuito.precio,
              style: Theme.of(context).textTheme.body2
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        onTap: () {
          Route ruta = new MaterialPageRoute(
              builder: (context) => new DetallesCircuito(circuito: _circuito));
          Navigator.push(context, ruta);
        },
      )
    ]);
  }
}
