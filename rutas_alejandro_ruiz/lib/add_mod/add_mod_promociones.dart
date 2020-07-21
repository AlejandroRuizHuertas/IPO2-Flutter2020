import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_promocion.dart';

class AddModPromociones extends StatefulWidget {
// Propiedad inmutable
  ModeloPromocion promocion;
  AddModPromociones({this.promocion});
  @override
  _AddModPromocionState createState() => _AddModPromocionState();
}

class _AddModPromocionState extends State<AddModPromociones> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: formulario(context));
  }

  Widget formulario(BuildContext context) {
    //Si el promocion está vacío es que es nuevo
    if (widget.promocion == null) {
      widget.promocion = new ModeloPromocion(
          nombre: "", descripcion: "", fecha: "", descuento: "", ruta: "");
    }
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(
              color: Theme.of(context).accentColor //change your color here
              ),
          title: new Text("Nueva promocion",
              style: TextStyle(color: Theme.of(context).accentColor)),
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _tfNombre(),
                      _tfDescuento(),
                      _tfFecha(),
                      _tfDescripcion(),
                      _tfRutas(),
                      _btnEnviar(),
                    ],
                  ),
                ))));
  }

   Widget _tfFecha() {
    var txt = TextEditingController();
    txt.text = widget.promocion.fecha;

        return TextFormField(
          keyboardType: TextInputType.datetime,
          controller: txt,
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value.isEmpty) {
              return 'Introduzca un valor válido';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Introduzca la fecha del contrato",
              labelText: "Fecha",
              counterText: '',
              labelStyle: new TextStyle(color: Colors.black)),

    );
  } 

  Widget _tfNombre() {
    var txt = TextEditingController();
    txt.text = widget.promocion.nombre;
    return TextFormField(
      controller: txt,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Introduzca el nombre de la promocion",
          labelText: "Nombre",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfDescuento() {
    var txt = TextEditingController();
    txt.text = widget.promocion.descuento;

    return TextFormField(
      maxLength: 2,
      keyboardType: TextInputType.number,
      controller: txt,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Introduzca el descuento de la promoción",
          labelText: "Descuento",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfDescripcion() {
    var txt = TextEditingController();
    txt.text = widget.promocion.descripcion;
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: txt,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Introduzca la descripción de la promoción",
          labelText: "Descripción",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }
    Widget _tfRutas() {
    var txt = TextEditingController();
    txt.text = widget.promocion.ruta;
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: txt,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Introduzca la el nombre de las rutas",
          labelText: "Rutas",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _btnEnviar() {
    return new RaisedButton(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      onPressed: () {
        if (_key.currentState.validate()) {
          Fluttertoast.showToast(
            msg: "Promoción registrada",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: new Color(0xff007e39),
            textColor: Theme.of(context).accentColor,
            fontSize: 18.0,
          );
          Navigator.of(context).pop();
        }
      },
      child: Text('ENVIAR',
          style: new TextStyle(color: Theme.of(context).accentColor)),
    );
  }
}
