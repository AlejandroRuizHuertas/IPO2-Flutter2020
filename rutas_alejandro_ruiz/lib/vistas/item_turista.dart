import 'package:flutter/material.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_turista.dart';
import 'package:rutas_alejandro_ruiz/detalles/ver_turista.dart';

class ItemTurista extends StatelessWidget {
  final ModeloTurista _turista;
  ItemTurista(this._turista);
  TextStyle _stTitulo =
      new TextStyle(fontFamily: "IBMPlexSans", fontWeight: FontWeight.bold);
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
              _turista.nombre,
              style: _stTitulo,
            ),
            new Text(
              "Integrantes: " + _turista.numIntegrantes,
              style: Theme.of(context).textTheme.body2
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        subtitle: new Text("Teléfono: " + _turista.telefono, style: Theme.of(context).textTheme.body2),
        onTap: () {
          Route ruta = new MaterialPageRoute(
              builder: (context) => new DetallesTurista(turista: _turista));
          Navigator.push(context, ruta);
        },
      )
    ]);
  }
}
