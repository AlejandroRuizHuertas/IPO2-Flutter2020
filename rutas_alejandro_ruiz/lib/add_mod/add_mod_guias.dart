import 'dart:io';

import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_guia.dart';

class AddModGuia extends StatefulWidget {
// Propiedad inmutable
  ModeloGuia guia;
  AddModGuia({this.guia});
  @override
  _AddModGuiaState createState() => _AddModGuiaState();
}

class _AddModGuiaState extends State<AddModGuia> {
  File imageFile;
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: formulario(context));
  }

  Widget formulario(BuildContext context) {
    //Si el guia está vacío es que es nuevo
    if (widget.guia == null) {
      widget.guia = new ModeloGuia(
          imagenGuia: "imagenes/jose.jpg",
          nombre: "",
          puntuacion: "",
          telefono: "",
          turno: "");
    }
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(
              color: Theme.of(context).accentColor //change your color here
              ),
          title: new Text("Nuevo guia",
              style: TextStyle(color: Theme.of(context).accentColor)),
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _mostrar_imagen(widget.guia.imagenGuia),
                      _tfNombre(),
                      _tfPuntuacion(),
                      _tfTelefono(),
                      _tfTurno(),
                      _btnEnviar()
                    ],
                  ),
                ))));
  }

  Widget _mostrar_imagen(String imagenRuta) {
    if (imageFile == null) {
      return new Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(90.0)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagenRuta))),
          alignment: Alignment.bottomRight,
          child: _btnSubirFoto());
    } else {
      return new Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(90.0)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: Image.file(imageFile).image)),
          alignment: Alignment.bottomRight,
          child: _btnSubirFoto());
    }
  }

  Widget _btnSubirFoto() {
    return ClipOval(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(FontAwesomeIcons.image,
                  color: Theme.of(context).accentColor)),
          onTap: () {
            _openGallery();
          },
        ),
      ),
    );
  }

  void _openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
    });
  }

  Widget _tfNombre() {
    var txt = TextEditingController();
    txt.text = widget.guia.nombre;
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
          hintText: "Introduzca el nombre del guia",
          labelText: "Nombre",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfPuntuacion() {
    var txt = TextEditingController();
    txt.text = widget.guia.puntuacion;

    return TextFormField(
      maxLength: 1,
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
          hintText: "Introduzca la puntuación del guia",
          labelText: "Puntuación",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfTelefono() {
    var txt = TextEditingController();
    txt.text = widget.guia.telefono;
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
          hintText: "Introduzca el teléfono del guia",
          labelText: "Teléfono",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfTurno() {
    var txt = TextEditingController();
    txt.text = widget.guia.turno;
    return TextFormField(
      controller: txt,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      keyboardType: TextInputType.text,
      maxLines: null,
      decoration: InputDecoration(
          hintText: "Introduzca el turno de trabajo del guia",
          labelText: "Turno",
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
            msg: "Guía registrado",
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
