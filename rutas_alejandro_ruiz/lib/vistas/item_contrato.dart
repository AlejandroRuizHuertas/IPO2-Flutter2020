import 'package:flutter/material.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_contratos.dart';
import 'package:rutas_alejandro_ruiz/detalles/ver_contrato.dart';

class ItemContrato extends StatelessWidget {
  final ModeloContrato _contrato;
  ItemContrato(this._contrato);
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
                    image: AssetImage(_contrato.imagenRuta)))),
        title: new Row(
          children: <Widget>[
            new Text(
              _contrato.id,
              style: _stTitulo,
            ),
            new Text(
              _contrato.fecha, style: Theme.of(context).textTheme.body2,
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
                    "Guía: ",
                    style: Theme.of(context).textTheme.body2,
                  ),
                                    new Text(
                    _contrato.guia,
                    style: Theme.of(context).textTheme.body2,
                  ),
                ],
              ),
              new Container(
                child: new Text(
                  _contrato.estado,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          padding: const EdgeInsets.only(top: 5.0),
        ),
        onTap: () {
          Route ruta = new MaterialPageRoute(
              builder: (context) => new DetallesContrato(contrato: _contrato));
          Navigator.push(context, ruta);
        },
      )
    ]);
  }
}
