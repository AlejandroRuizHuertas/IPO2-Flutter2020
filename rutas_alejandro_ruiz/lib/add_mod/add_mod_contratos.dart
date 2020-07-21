import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_contratos.dart';
import 'dart:io';

class AddModContrato extends StatefulWidget {
// Propiedad inmutable
  ModeloContrato contrato;
  AddModContrato({this.contrato});
  ModeloContrato get contratoApp => contrato;
  @override
  _AddModContratoState createState() => _AddModContratoState();
}

class _AddModContratoState extends State<AddModContrato> {
  File imageFile;
  TextStyle _stFormulario = new TextStyle(
    fontSize: 20,
  );
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: formulario(context));
  }

  Widget formulario(BuildContext context) {
    //Si el contrato está vacío es que es nuevo
    if (widget.contrato == null) {
      widget.contrato = new ModeloContrato(
          id: "Nuevo contrato",
          estado: "",
          turista: "",
          imagenRuta: "imagenes/tomelloso.jpg",
          guia: "",
          fecha: "");
    }

    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(
              color: Theme.of(context).accentColor //change your color here
              ),
          title: new Text("Nuevo contrato",
              style: TextStyle(color: Theme.of(context).accentColor)),
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _mostrar_imagen(widget.contrato.imagenRuta),
                      _tfGuia(),
                      _tfFecha(),
                      _tfEstado(),
                      _tfTurista(),
                      _btnEnviar()
                    ],
                  ),
                ))));
  }

  Widget _mostrar_imagen(String imagenRuta) {
    if (imageFile == null) {
      return new Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(20.0)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagenRuta))),
          alignment: Alignment.bottomRight,
          child: _btnSubirFoto());
    } else {
      return new Container(
         width: 400,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(20.0)),
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

  Widget _tfGuia() {
    var txt = TextEditingController();
    txt.text = widget.contrato.guia;
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
          hintText: "Introduzca el nombre del guía",
          labelText: "Guía",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfFecha() {
    var txt = TextEditingController();
    txt.text = widget.contrato.fecha;

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

  Widget _tfEstado() {
    var txt = TextEditingController();
    txt.text = widget.contrato.estado;
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
          hintText: "Introduzca el estado del contrato",
          labelText: "Estado",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfTurista() {
    var txt = TextEditingController();
    txt.text = widget.contrato.turista;
    return TextFormField(
      controller: txt,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      maxLength: 20,
      decoration: InputDecoration(
          hintText: "Introduzca el nombre del turista contratante",
          labelText: "Turista",
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
            msg: "Contrato creado",
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
