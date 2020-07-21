import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_turista.dart';

class AddModTurista extends StatefulWidget {
// Propiedad inmutable
  ModeloTurista turista;
  AddModTurista({this.turista});
  @override
  _AddModPromocionState createState() => _AddModPromocionState();
}

class _AddModPromocionState extends State<AddModTurista> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: formulario(context));
  }

  Widget formulario(BuildContext context) {
    //Si el turista está vacío es que es nuevo
    if (widget.turista == null) {
      widget.turista = new ModeloTurista(
          nombre: "",
          descripcion: "",
          telefono: "",
          integrantes: "",
          numIntegrantes: "");
    }
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(
              color: Theme.of(context).accentColor //change your color here
              ),
          title: new Text("Nueva turista",
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
                      _tfTelefono(),
                      _tfIntegrantes(),
                      _tfDescripcion(),
                      _btnEnviar(),
                    ],
                  ),
                ))));
  }

  Widget _tfNombre() {
    var txt = TextEditingController();
    txt.text = widget.turista.nombre;
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
          hintText: "Introduzca el nombre del grupo de turistas",
          labelText: "Nombre",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfTelefono() {
    var txt = TextEditingController();
    txt.text = widget.turista.telefono;
    return TextFormField(
      maxLength: 9,
      keyboardType: TextInputType.phone,

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
          hintText: "Introduzca el teléfono del turista",
          labelText: "Teléfono",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfDescripcion() {
    var txt = TextEditingController();
    txt.text = widget.turista.descripcion;
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
          hintText: "Introduzca la descripción del grupo de turistas",
          labelText: "Descripción",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfIntegrantes() {
    var txt = TextEditingController();
    txt.text = widget.turista.integrantes;
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
          hintText: "Introduzca el nombre de los integrantes",
          labelText: "Integrantes",
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
            msg: "Turistas registrados",
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
